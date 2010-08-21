#!/usr/bin/ruby
# @file   rjclassmanager.rb
# @author K.S.
#
# $Date: 2002/10/14 13:59:49 $
# $Id: rjclassmanager.rb,v 1.1 2002/10/14 13:59:49 ko1 Exp $
#
# Create : K.S. 02/10/12 15:47:38
#
# class manager
#
#

require 'rjclass'
require 'rjthread'
require 'singleton'

class RJClassManager
  include Singleton

  
  def initialize
    @jclasses = {}
  end

  # class をロード
  def load name
    puts " load class --> #{name}"
    fn = name.gsub('\.','/') # hoe.hue => hoe/hue
    fn += '.class'    #         => hoe/hue.class
    c = nil
    open(fn,'rb'){|f|
      c = RJClass.new f
    }
    @jclasses[name] = c

    # super class の設定
    if c.super_class
      c.set_super(get c.super_class)
    end
    
    # clinit があったら
    # ...
    if c.has_clinit?
      clinit_thread = RJThread.new
      clinit_thread.set_clinit c
      clinit_thread.interpret # ここで全部やってしまう
    end

    c
  end

  # class をゲットする。無ければロードする
  def get name
    # puts "load name : #{name}"
    if @jclasses.key? name
      @jclasses[name]
    else
      load name
    end
  end
  
end


# require の順序の関係で、ここに

class RJStringInstance < RJInstance

  JStringClass = RJClassManager.instance.get('java.lang.String')
  
  def initialize msg = ''
    @owner   = JStringClass
    @fields  = {}
    set_fields JStringClass
    set_string msg
  end

  def get_string
    if @fields.has_key? 'value'
      @fields['value'].join
    else
      raise 'this instance is not string class.'
    end
  end
  def set_string msg
    if @fields.has_key? 'value'
      @fields['value'] = msg.split('')
      @fields['count'] = msg.split('').length
    else
      raise 'this instance is not string class.'
    end
  end
  
  def to_s
    "String : '#{get_string}'"
  end

end

class RJArrayInstance < Array
  def to_s
    ret = "Array(#{self.size}) : ["
    10.times{|i|
      if self.size < i
        break
      end
      ret += self[i].to_s
      ret += ','
    }
    ret + '...]'
  end
  def verbose
    "Array(#{self.size}) : [" +
    self.join(',') + ']'
  end
end

class RJThreadInstance < RJInstance
  JThreadClass = RJClassManager.instance.get('java.lang.Thread')

  def initialize
    @owner   = JThreadClass
    @fields  = {}
    set_fields JThreadClass
  end
  
  def to_s
    "Java Thread Instance"
  end
end