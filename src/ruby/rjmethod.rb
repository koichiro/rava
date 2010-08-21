#!/usr/bin/ruby
# -*- coding: utf-8 -*-
# @file   rjmethod.rb
# @author K.S.
#
# $Date: 2002/10/14 13:59:49 $
# $Id: rjmethod.rb,v 1.2 2002/10/14 13:59:49 ko1 Exp $
#
# Create : K.S. 02/10/09 06:10:01
#
#
#
#
require 'rjopcodeinfo'
require 'rjnative'


class RJMethod
  include RJOpcodeinfo
  
  attr_reader :mname
  attr_reader :mdesc
  attr_reader :code
  attr_reader :max_local
  attr_reader :max_stack
  attr_reader :arg_size
  attr_reader :ret_size
  attr_reader :owner
  
  def initialize owner,cls
    @cls = cls
    @owner = owner
    @exception_table = []
    load
  end

  def load
    @access_flag = u2
    @mname = @owner.const[u2]
    @mdesc = @owner.const[u2]

    @arg_size  = calc_arg_size
    @ret_size  = calc_ret_size
    
    @max_local = @arg_size # native では最低 arg_size
    @max_stack = 2         # native では最低 2
    
    attributes_count = u2
    attributes_count.times{
      load_attributes
    }
  end

  def load_attributes
    attr_name = @owner.const[u2]
    
    attribute_length = u4
    if attr_name == 'Code'
      @max_stack   = u2
      @max_local   = u2
      @code_length = u4
      @code = @cls.read @code_length
      exception_table_length = u2
      exception_table_length.times{
        start_pc   = u2
        end_pc     = u2
        handler_pc = u2
        catch_type = u2
        @exception_table << [start_pc,end_pc,handler_pc,catch_type]
      }
      attributes_count = u2
      attributes_count.times{
        attr_name = u2
        attr_length = u4
        @cls.read attr_length
        # raise 'not supported'
      }
    else
      @cls.read attribute_length
    end
  end

  def to_s
    "RJMethod . #{@mname} : #{@mdesc} @ #{@owner.this_class}"
  end
  
  def verbose
    ret = 
    "name : #{@mname}\n" + 
    "type : #{@mdesc}\n" +
    "stack: #{@max_stack}\n" +
    "local: #{@max_local}\n" +
    "len  : #{@code_length}\n"+
    "code :\n"
    if is_native?
      ret +=
      "     : ==> native method\n"
      return ret
    end

    
    i = 0
    while i<@code_length
      c = @code[i]
      len = get_opcode_length c
      if len == 0
        len += 1
        len += (4 - (i+1)%4) % 4
        if c == 0xab # lookupswitch
          len += 4
          pairs = (@code[i+len] << 24) + (@code[i+len+1] << 16) +
          (@code[i+len+2] << 8)+ (@code[i+len+3])
          len += 4 + pairs * 2
          
        else # tableswitch
          len += 4
          low  = (@code[i+len] << 24) + (@code[i+len+1] << 16) +
          (@code[i+len+2] << 8)+ (@code[i+len+3])
          len += 4
          high = (@code[i+len] << 24) + (@code[i+len+1] << 16) +
          (@code[i+len+2] << 8)+ (@code[i+len+3])
          len += 4

          len += 4 + (high - low + 1) * 4
        end
      end
      opt = get_opcode_arg c
      case opt
      when 'cc'
        opt = @owner.const[(@code[i+1] << 8) + @code[i+2]]
      when 'ii'
        opt = @code[i+1,2].reverse.unpack 's'
      when '1'
        opt = @code[i+1].to_i
      end
        
      ret += "#{sprintf("%4d",i)}\t#{OpcodeName[c]} #{opt}\n"
      i+=len
    end
    ret
  end

  def const idx
    @owner.const[idx]
  end

  def calc_arg_size
    i = 0
    @mdesc =~ /\((.*)\)/
    ret = 0
    lflg = false
    $1.split('').each{|c|
      if lflg
        if c == ';'
          lflg = false
        end
        next
      end
      
      case c
      when 'B','C','F','I','S','Z'
        ret += 1
      when 'D','J'
        ret += 2
      when 'L'
        ret += 1 ; lflg = true
      end
      # [ は見なくていいのかって？
      # いいんじゃないの？　無視しちゃって
    }
    ret + (is_static? ? 0 : 1)
  end

  def calc_ret_size
    i = 0
    ret = 0
    flg = false
    @mdesc =~ /\(.*\)(.)/
    case $1
    when 'B','C','F','I','S','Z','L','['
      return 1
    when 'J'
      return 2
    when 'D'
      return 3
    end
    return 0 # void
  end

  
  def is_static?
    @access_flag & 0x0008 != 0
  end
  def is_native?
    @access_flag & 0x0100 != 0
  end

  def invoke_native args
    # native 探し
    nm  = 'RJN_' + @owner.this_class.gsub('/','_')
    begin
      nc = Module.const_get(nm)
    rescue NameError
      puts "can't find that native method support class : #{nm}"
      puts "plz write this class :-) jrnative.rb will helps this."
      puts "ex) ruby rjnative.rb #{@owner.this_class}"
      puts ''
      raise
    end
    
    nc.__send__ @mname,@mdesc,args
  end
  
  # read helper
private
  def u4
    ((@cls.read 4).unpack 'N')[0]
  end
  def u2
    ((@cls.read 2).unpack 'n')[0]
  end
  def u1
    ((@cls.read 1).unpack 'C')[0]
  end
  
end

