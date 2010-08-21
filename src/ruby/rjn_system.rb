class RJN_java_lang_System < RJNative

  # currentTimeMillis
  # static method
  # func(a,b,c,...) => arg[0] : a , arg[1] : b , arg[2] : c , ...
  def RJN_java_lang_System.currentTimeMillis method,args
    # ()J
    Time.now.to_i * 1000
    # raise 'unimplemented native method : currentTimeMillis @ java/lang/System'
  end

  # setIn0
  # static method
  # func(a,b,c,...) => arg[0] : a , arg[1] : b , arg[2] : c , ...
  def RJN_java_lang_System.setIn0 method,args
    # (Ljava/io/InputStream;)V

    raise 'unimplemented native method : setIn0 @ java/lang/System'
  end

  # setErr0
  # static method
  # func(a,b,c,...) => arg[0] : a , arg[1] : b , arg[2] : c , ...
  def RJN_java_lang_System.setErr0 method,args
    # (Ljava/io/PrintStream;)V

    raise 'unimplemented native method : setErr0 @ java/lang/System'
  end

  # setOut0
  # static method
  # func(a,b,c,...) => arg[0] : a , arg[1] : b , arg[2] : c , ...
  def RJN_java_lang_System.setOut0 method,args
    # (Ljava/io/PrintStream;)V

    raise 'unimplemented native method : setOut0 @ java/lang/System'
  end

  # getCallerClass
  # static method
  # func(a,b,c,...) => arg[0] : a , arg[1] : b , arg[2] : c , ...
  def RJN_java_lang_System.getCallerClass method,args
    # ()Ljava/lang/Class;

    raise 'unimplemented native method : getCallerClass @ java/lang/System'
  end

  # arraycopy
  # static method
  # func(a,b,c,...) => arg[0] : a , arg[1] : b , arg[2] : c , ...
  def RJN_java_lang_System.arraycopy method,args
    # (Ljava/lang/Object;ILjava/lang/Object;II)V
    src = args[0]
    sp  = args[1]
    dst = args[2]
    dp  = args[3]
    len = args[4]

    # check

    puts "&& #{len}"
    puts src.join(',') + "-- #{sp}" 
    puts dst.join(',') + "-- #{dp}"
    
    len.times{|i|
      dst[i+dp] = src[i+sp]
    }
    puts src.join(',')
    puts dst.join(',')
    # raise 'unimplemented native method : arraycopy @ java/lang/System'
  end

  # initProperties
  # static method
  # func(a,b,c,...) => arg[0] : a , arg[1] : b , arg[2] : c , ...
  def RJN_java_lang_System.initProperties method,args
    # (Ljava/util/Properties;)Ljava/util/Properties;

    raise 'unimplemented native method : initProperties @ java/lang/System'
  end

  # registerNatives
  # static method
  # func(a,b,c,...) => arg[0] : a , arg[1] : b , arg[2] : c , ...
  def RJN_java_lang_System.registerNatives method,args
    # ()V
    #
    # raise 'unimplemented native method : registerNatives @ java/lang/System'
  end

  # identityHashCode
  # static method
  # func(a,b,c,...) => arg[0] : a , arg[1] : b , arg[2] : c , ...
  def RJN_java_lang_System.identityHashCode method,args
    # (Ljava/lang/Object;)I

    raise 'unimplemented native method : identityHashCode @ java/lang/System'
  end

  # mapLibraryName
  # static method
  # func(a,b,c,...) => arg[0] : a , arg[1] : b , arg[2] : c , ...
  def RJN_java_lang_System.mapLibraryName method,args
    # (Ljava/lang/String;)Ljava/lang/String;

    raise 'unimplemented native method : mapLibraryName @ java/lang/System'
  end

end
