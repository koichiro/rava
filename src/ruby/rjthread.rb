#!/usr/bin/ruby
# @file   rjthread.rb
# @author K.S.
#
# $Date: 2002/10/14 13:59:49 $
# $Id: rjthread.rb,v 1.1 2002/10/14 13:59:49 ko1 Exp $
#
# Create : K.S. 02/10/12 15:17:24
#
# Thread 実行実態
#

require 'rjopcodeinfo'
require 'rjout'
require 'rjexception'

class RJThread
  include RJOpcodeinfo
  include RJOut

  def initialize
    @method  = nil # 実行中のメソッド
    @stack   = []  # スタック
    @pc      = 0   # program counter
    @fp      = 0   # frame pointer
    @ruby_th = nil # ruby thread
  end

  # clinit class を起動
  def set_clinit cls
    @method = cls.get_static_method '<clinit>','()V'
    @stack += Array.new(@method.max_local)
  end

  def set_main cls,args
    @method = cls.get_static_method 'main','([Ljava/lang/String;)V'
    @stack += Array.new(@method.max_local)
    @stack[0] = args
  end

  def set_run obj
    @method = obj.get_method 'run','()V'
    @stack += Array.new(@method.max_local)
    @stack[0] = obj
  end
  
  # 起動
  def kick
    @ruby_th = Thread.start{
      self.interpret

      RJThreadManager.instance.delete self
    }
  end

  # 短い・・・
  def interpret
    while true
      # puts @method.to_s + "========================= #{@pc}"
      bc = @method.code[@pc]
      bn = OpcodeName[bc]
      # puts sprintf('** %4d : %s',@pc,@method.to_s)
      begin
        self.__send__('op_'+bn)
        
      rescue RJExceptionFinishThread
        puts 'finish thread'
        dump_stack 'finish'
        break
      rescue
        print $! , ' at pc ' , @pc , ' in class : ' , @method.to_s , "\n"
        puts $@
        dump_stack 'error'
        break
      end
    end
  end

private

  ##
  # stack 操作
  
  def local n
    @stack[@fp+n]
  end
  def local_set n,m
    @stack[@fp+n] = m
    # stout "set local #{@fp+n} <= #{m}"
    # dump_stack 'local set'
  end
  def local2 n
    @stack[@fp+n]
  end
  def local_set2 n,m
    @stack[@fp+n] = m
  end
  
  def push o
    @stack << o
    # dump_stack 'push'
  end
  def pop
    @stack.pop
    #dump_stack 'pop'
    #e
  end
  def push2 o
    @stack << o
    @stack << nil
  end
  def pop2
    @stack.pop
    @stack.pop
  end
  

  def cut_stack sz
    # dump_stack 'cut stack before'
    pt = @stack.size - sz
    ret = @stack[pt,sz]
    @stack = @stack[0,pt]
    # dump_stack 'cut stack after'
    ret
  end
  
  def dump_stack msg=''
    stout "== stack #{msg+' '}=="
    @stack.size.times{|i|
      e = @stack[i]
      mk = ''
      if i < @fp
        mk = '=='
      elsif i >= @fp && i < (@fp + @method.max_local)
        mk = 'lo'
      elsif i == (@fp + @method.max_local) && @fp != 0
        mk = '<P' # pc
      elsif i == (@fp + @method.max_local + 1) && @fp != 0
        mk = '<M' # me
      elsif i == (@fp + @method.max_local + 2) && @fp != 0
        mk = '<F'
      else
        mk = '  '
      end
      
      stout "#{sprintf("%2d",i)} #{mk} #{e.to_s}"
    }
    stout "-- stack -- sz:#{@stack.size} fp:#{@fp} lo:#{@method.max_local} as:#{@method.arg_size}"
  end
  

  def u1 n=1
    @method.code[@pc+n].to_i
  end
  def u2 n=1
    (@method.code[@pc+n,2].reverse.unpack 'S')[0]
  end
  def s2 n=1
    (@method.code[@pc+n,2].reverse.unpack 's')[0]
  end
  def s1 n=1
    v = @method.code[@pc+n]
    (((v & 0x80) != 0)? ((v & 0x7f) - 128) : v)
  end
  def const idx
    @method.const idx
  end
  def const2 idx
    ((@method.const idx) << 32) + @method.const(idx+1)
  end

  def get_caller_obj desc
    sz = get_param_num desc
    # dump_stack
    @stack[@stack.size - sz]
  end

  def get_param_num desc
    i = 0
    desc =~ /\((.*)\)/
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
    ret + 1
  end

  def create_String_instance str
    sc = RJClassManager.instance.get 'java.lang.String'
    v  = sc.create_instance
    v.set_field 'value',str.split('')
    v
  end
  

=begin
stack frame

 ... old stack , locals ... , PC , method ref , fp , stack ...
               ^current fp

=end

  ###################
  def store_frame m
    # puts m.to_s
    
    arg_size    = m.arg_size
    extend_size = m.max_local - arg_size
    tfp         = @stack.size - arg_size

    # puts "                              #{@stack.size} ==> #{extend_size}"
    
    # stack をフレーム分伸ばす
    @stack += Array.new(extend_size)
    
    push @pc
    push @method
    push @fp

    @pc     = 0
    @method = m
    @fp     = tfp

    dump_stack 'stored frame'
    
  end

  ###################
  def restore_frame
    if @fp == 0
      raise RJExceptionFinishThread # thread 終了
    end
    tfp = @fp

    m = @method
    
    @pc     = @stack[@fp + m.max_local + 0]
    @method = @stack[@fp + m.max_local + 1]
    @fp     = @stack[@fp + m.max_local + 2]
    
    @stack  = @stack[0,tfp]
    # puts "--------------------------------------------------> #{@pc}"
    # dump_stack 'restored frame'
    
  end

  

  
end

require 'rjthread_op_impl'


