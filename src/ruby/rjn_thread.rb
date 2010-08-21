# -*- coding: utf-8 -*-

require 'rjclassmanager'

class RJN_java_lang_Thread < RJNative

  # sleep
  # static method
  # func(a,b,c,...) => arg[0] : a , arg[1] : b , arg[2] : c , ...
  def RJN_java_lang_Thread.sleep method,args
    # (J)V

    raise 'unimplemented native method : sleep @ java/lang/Thread'
  end

  # yield
  # static method
  # func(a,b,c,...) => arg[0] : a , arg[1] : b , arg[2] : c , ...
  def RJN_java_lang_Thread.yield method,args
    # ()V

    raise 'unimplemented native method : yield @ java/lang/Thread'
  end

  # isInterrupted
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Thread.isInterrupted method,args
    # (Z)Z

    raise 'unimplemented native method : isInterrupted @ java/lang/Thread'
  end

  # interrupt0
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Thread.interrupt0 method,args
    # ()V

    raise 'unimplemented native method : interrupt0 @ java/lang/Thread'
  end

  # resume0
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Thread.resume0 method,args
    # ()V

    raise 'unimplemented native method : resume0 @ java/lang/Thread'
  end

  # start
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Thread.start method,args
    # ()V

    raise 'unimplemented native method : start @ java/lang/Thread'
  end

  # currentThread
  # static method
  # func(a,b,c,...) => arg[0] : a , arg[1] : b , arg[2] : c , ...
  def RJN_java_lang_Thread.currentThread method,args
    # ()Ljava/lang/Thread;
    RJThreadInstance.new
    # raise 'unimplemented native method : currentThread @ java/lang/Thread'
  end

  # stop0
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Thread.stop0 method,args
    # (Ljava/lang/Object;)V

    raise 'unimplemented native method : stop0 @ java/lang/Thread'
  end

  # isAlive
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Thread.isAlive method,args
    # ()Z

    raise 'unimplemented native method : isAlive @ java/lang/Thread'
  end

  # registerNatives
  # static method
  # func(a,b,c,...) => arg[0] : a , arg[1] : b , arg[2] : c , ...
  def RJN_java_lang_Thread.registerNatives method,args
    # ()V

    # raise 'unimplemented native method : registerNatives @ java/lang/Thread'
  end

  # countStackFrames
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Thread.countStackFrames method,args
    # ()I

    raise 'unimplemented native method : countStackFrames @ java/lang/Thread'
  end

  # suspend0
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Thread.suspend0 method,args
    # ()V

    raise 'unimplemented native method : suspend0 @ java/lang/Thread'
  end

  # setPriority0
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Thread.setPriority0 method,args
    # (I)V

    raise 'unimplemented native method : setPriority0 @ java/lang/Thread'
  end

end
