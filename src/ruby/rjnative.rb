#!/usr/bin/ruby
# @file   rjnative.rb
# @author K.S.
#
# $Date: 2002/10/14 13:59:49 $
# $Id: rjnative.rb,v 1.1 2002/10/14 13:59:49 ko1 Exp $
#
# Create : K.S. 02/10/13 18:00:29
#
# Native method definission
#

class RJNative

end


require 'rjn_class'
require 'rjn_system'
require 'rjn_nums'
require 'rjn_thread'


if __FILE__ == $0
  require 'rjclass'
  # native ‚Ì—‚ğ•\¦
  fn = ARGV[0] || 'test'
  fn.gsub!('\.','/')
  fn += '.class'
  
  if (!fn); fn = 'test.class' ; end
  open(fn,'rb'){|f|
    c = RJClass.new f

    natives = {} # hash
    c.native_methods.each{|m|
      if natives.has_key? m.mname
        natives[m.mname] = [natives[m.mname],m]
      else
        natives[m.mname] = [m]
      end
    }
    class_name = 'RJN_' + c.this_class.gsub('/','_')
    puts "class #{class_name} < RJNative"
    puts ''
    natives.each{|n,m|
      puts "  # #{n}"
      if !m[0].is_static?
        puts '  # instance method'
        puts '  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...'
      else
        puts '  # static method'
        puts '  # func(a,b,c,...) => arg[0] : a , arg[1] : b , arg[2] : c , ...'
      end
      puts "  def #{class_name}.#{n} method,args"
      if m.size > 1
        # •¡”‚ÌŒ^‚ğ‚Â
        puts '    case method.mdesc'
        m.each{|mm|
          puts "    when '#{mm.mdesc}'"
          puts
        }
        puts ''
        puts '    end'
      else
        # ˆê‚Â
        puts "    # #{m[0].mdesc}"
        puts ''
      end

      puts "    raise 'unimplemented native method : #{n} @ #{c.this_class}'"
      puts "  end"
      puts ''
    }
    puts "end"
  }
end

class RJN_java_lang_Object < RJNative

  # wait
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Object.wait method,args
    # (J)V

    raise 'unimplemented native method : wait @ java/lang/Object'
  end

  # hashCode
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Object.hashCode method,args
    # ()I

    raise 'unimplemented native method : hashCode @ java/lang/Object'
  end

  # getClass
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Object.getClass method,args
    # ()Ljava/lang/Class;

    raise 'unimplemented native method : getClass @ java/lang/Object'
  end

  # notifyAll
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Object.notifyAll method,args
    # ()V

    raise 'unimplemented native method : notifyAll @ java/lang/Object'
  end

  # clone
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Object.clone method,args
    # ()Ljava/lang/Object;

    raise 'unimplemented native method : clone @ java/lang/Object'
  end

  # registerNatives
  # static method
  # func(a,b,c,...) => arg[0] : a , arg[1] : b , arg[2] : c , ...
  def RJN_java_lang_Object.registerNatives method,args
    # ()V
    # ‚È‚É‚à‚µ‚È‚¢
    #raise 'unimplemented native method : registerNatives @ java/lang/Object'
  end

  # notify
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Object.notify method,args
    # ()V

    raise 'unimplemented native method : notify @ java/lang/Object'
  end

end

#######################
class RJN_java_io_ObjectStreamClass < RJNative

  # initNative
  # static method
  # func(a,b,c,...) => arg[0] : a , arg[1] : b , arg[2] : c , ...
  def RJN_java_io_ObjectStreamClass.initNative method,args
    # ()V

    #raise 'unimplemented native method : initNative @ java/io/ObjectStreamClass'
  end

  # hasStaticInitializer
  # static method
  # func(a,b,c,...) => arg[0] : a , arg[1] : b , arg[2] : c , ...
  def RJN_java_io_ObjectStreamClass.hasStaticInitializer method,args
    # (Ljava/lang/Class;)Z

    raise 'unimplemented native method : hasStaticInitializer @ java/io/ObjectStreamClass'
  end

  # getFieldIDs
  # static method
  # func(a,b,c,...) => arg[0] : a , arg[1] : b , arg[2] : c , ...
  def RJN_java_io_ObjectStreamClass.getFieldIDs method,args
    # ([Ljava/io/ObjectStreamField;[J[J)V

    raise 'unimplemented native method : getFieldIDs @ java/io/ObjectStreamClass'
  end

end



#######################
class RJN_test < RJNative

  # out
  # static method
  # func(a,b,c,...) => arg[0] : a , arg[1] : b , arg[2] : c , ...
  def RJN_test.out method,args
    # (Ljava/lang/String;)V
    puts '====================================='
    puts args[0].to_s
    puts args[0].get_field('value').join
    puts '====================================='
    # raise 'unimplemented native method : out @ test'
  end

end



