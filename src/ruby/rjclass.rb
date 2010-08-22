#!/usr/bin/ruby
# -*- coding: utf-8 -*-
# @file   jrclass.rb
# @author K.S.
#
# $Date: 2002/10/14 13:59:49 $
# $Id: rjclass.rb,v 1.2 2002/10/14 13:59:49 ko1 Exp $
#
# Create : K.S. 02/10/09 04:05:39
#
# java のクラスを読み込む
#

require 'rjinstance'
require 'rjmethod'

class RJClass
  
  CONSTANT_Utf8    = 1 unless const_defined? :CONSTANT_Utf8
  CONSTANT_Integer = 3 unless const_defined? :CONSTANT_Integer
  CONSTANT_Float   = 4 unless const_defined? :CONSTANT_Float
  CONSTANT_Long    = 5 unless const_defined? :CONSTANT_Long
  CONSTANT_Double  = 6 unless const_defined? :CONSTANT_Double
  CONSTANT_Class   = 7 unless const_defined? :CONSTANT_Class
  CONSTANT_String  = 8 unless const_defined? :CONSTANT_String
  CONSTANT_Fieldref= 9 unless const_defined? :CONSTANT_Fieldref
  CONSTANT_Methodref=10 unless const_defined? :CONSTANT_Methodref
  CONSTANT_InterfaceMethodref = 11 unless const_defined? :CONSTANT_InterfaceMethodref
  CONSTANT_NameAndType        = 12 unless const_defined? :CONSTANT_NameAndType

  attr_reader :this_class
  attr_reader :super_class
  attr_reader :jfields
  attr_reader :super
  
  def initialize cls
    @jmethods = {}
    @jfields  = {}
    @jstaticfields = {}
    @jconsts  = [nil]
    @jinterfaces = []
    
    @cls      = cls
    load
    @cls      = nil

    @super    = nil
  end

  def set_super cls
    @super = cls
  end
  
  def const
    @jconsts
  end

  def get_static_method name,argtype
    m = @jmethods[method_name_type(name,argtype)]
    if !m
      if @super
        @super.get_static_method name,argtype
      else
        raise 'no such static method. : ' + method_name_type(name,argtype)
      end
    end
    m
  end

  def get_method name,argtype
    # puts "get method @#{this_class} , #{name},#{argtype}"
    if @jmethods.has_key? method_name_type(name,argtype)
      @jmethods[method_name_type(name,argtype)]
    else
      if @super
        # puts "--------------------------------- #{@this_class}"
        @super.get_method name,argtype
      else
        # Object にもみつからね
        raise 'no such method. : ' + method_name_type(name,argtype)
      end
    end
  end
  
  def get_static_field name
    if @jstaticfields.has_key? name
      @jstaticfields[name]
    else
      if @super
        @super.get_static_field name
      else
        raise "no such static field : #{name} @ #{@this_class}"
      end
    end
  end
  
  def set_static_field name,value
    if @jstaticfields.has_key? name
      @jstaticfields[name] = value
    else
      if @super
        @super.set_static_field name,value
      else
        raise "no such static field : #{name} @ #{@this_class}"
      end
    end
  end


  def create_instance
    RJInstance.new self
  end

  def has_clinit?
    if @jmethods[method_name_type('<clinit>','()V')]
      true
    else
      false
    end
  end

  ###################################################
  private

  # cls must be IO object(binary mode)
  def load

    # header
    @magic = u4
    if @magic != 3405691582
      raise 'this file is not class file'
    end
    
    @miver = u2
    @maver = u2

    # constant pool
    constant_pool_count = u2 - 1
    while constant_pool_count > 0
      constant_pool_count -= load_consts
    end
    sort_consts

    # etc
    @access_flag = u2
    @this_class  = const[u2]
    @super_class = const[u2]

    # interfaces
    interface_count = u2
    interface_count.times{
      load_interfaces
    }
    # fields
    fields_count = u2
    fields_count.times{
      load_fields
    }
    # methods
    methods_count = u2
    methods_count.times{
      load_methods
    }
    # attrs
    attributes_count = u2
    attributes_count.times{
      load_attributes
    }
    
    
  end

  def load_consts
    tag = u1
    case tag
    when CONSTANT_Utf8
      @jconsts << [tag,(@cls.read u2)]
    when CONSTANT_Integer
      @jconsts << [tag,u4]
    when CONSTANT_Float
      @jconsts << [tag,u4]
    when CONSTANT_Long
      @jconsts << [tag,u4]
      @jconsts << [tag,u4]
      return 2
    when CONSTANT_Double
      @jconsts << [tag,u4]
      @jconsts << [tag,u4]
      return 2
    when CONSTANT_Class
      @jconsts << [tag,u2]
    when CONSTANT_String
      @jconsts << [tag,u2]
    when CONSTANT_Fieldref
      @jconsts << [tag,u2,u2]
    when CONSTANT_Methodref
      @jconsts << [tag,u2,u2]
    when CONSTANT_InterfaceMethodref
      @jconsts << [tag,u2,u2]
    when CONSTANT_NameAndType
      @jconsts << [tag,u2,u2]
    else
      raise "No such type Constant ; #{tag}"
    end
    1
  end

  def sort_consts
    consts = @jconsts.dup
    
    @jconsts.map!{|e|
      if e == nil
        next
      end
      case e[0]
      when CONSTANT_Utf8 , CONSTANT_Integer , CONSTANT_Float ,
           CONSTANT_Long , CONSTANT_Double
        e = e[1]
      when CONSTANT_Class
        e = consts[e[1]][1]
      when CONSTANT_String
        e = consts[e[1]][1]
      when CONSTANT_Fieldref , CONSTANT_Methodref , CONSTANT_InterfaceMethodref
        e = [consts[consts[e[1]][1]][1],
             consts[consts[e[2]][1]][1],consts[consts[e[2]][2]][1]]
      when CONSTANT_NameAndType
        e = [consts[e[1]][1],consts[e[2]][1]]
      else
        raise "No such type Constant ; #{e[0]}"
      end
    }
  end


  def load_interfaces
    @jinterfaces << const[u2]
  end

  def load_fields
    access_flag      = u2
    name_index       = u2
    descriptor_index = u2
    attributes_count = u2
    first_value      = 0
    attributes_count.times{
      attribute_name_index = u2
      attribute_length     = u4

      if const[attribute_name_index] == 'ConstantValue'
        constantvalue_index  = u2
        first_value = const[constantvalue_index]
      else
        un attribute_length
      end
    }
    @jfields[const[name_index]] = [access_flag,const[descriptor_index],first_value]
    if access_flag & 0x0008
      # static field だよ・・・
      @jstaticfields[const[name_index]] = first_value
    end
  end
  
  def load_methods
    m = RJMethod.new self,@cls
    @jmethods[method_name_type(m.mname,m.mdesc)] = m
  end

  def method_name_type nm,ty
    nm + ' : ' + ty
  end
  
  def load_attributes
    
  end

  # read helper
  def un n
    @cls.read n
  end
  def u4
    ((@cls.read 4).unpack 'N')[0]
  end
  def u2
    ((@cls.read 2).unpack 'n')[0]
  end
  def u1
    ((@cls.read 1).unpack 'C')[0]
  end

  public

  def to_s
    "#{@this_class} (super:#{@super_class})"
  end

  def verbose
    ret = 
    "#{self.class} : #{@this_class}(#{@super_class})\n"
    i=1
    @jconsts.each{|c|
      if c == nil ; next end
      ret += sprintf("%4d\t",i) + c.to_s + "\n"
      i+=1
    }
    @jmethods.each{|k,v|
      ret += "#{k}\n"
      ret += v.verbose + "\n"
    }
    ret
  end

  def native_methods
    ret = []
    @jmethods.values.each{|v|
      if v.is_native?
        ret << v
      end
    }
    ret
  end
  
end


# 
if __FILE__ == $0
  fn = ARGV[0] || 'test'
  fn.gsub!(/\./,'/')
  fn += '.class'
  
  if (!fn); fn = 'test.class' ; end
  open(fn,'rb'){|f|
    c = RJClass.new f
    puts c.verbose
  }
end



