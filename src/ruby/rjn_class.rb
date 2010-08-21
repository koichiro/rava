# -*- coding: utf-8 -*-


class RJN_java_lang_Class < RJNative

  # isPrimitive
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Class.isPrimitive method,args
    # ()Z
    #p arg[0].to_s
    raise 'unimplemented native method : isPrimitive @ java/lang/Class'
  end

  # getProtectionDomain0
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Class.getProtectionDomain0 method,args
    # ()Ljava/security/ProtectionDomain;

    raise 'unimplemented native method : getProtectionDomain0 @ java/lang/Class'
  end

  # getPrimitiveClass
  # static method
  # func(a,b,c,...) => arg[0] : a , arg[1] : b , arg[2] : c , ...
  def RJN_java_lang_Class.getPrimitiveClass method,args
    # (Ljava/lang/String;)Ljava/lang/Class;
    p args[0].get_string
    p '-----------------'
    
    # raise 'unimplemented native method : getPrimitiveClass @ java/lang/Class'
  end

  # setSigners
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Class.setSigners method,args
    # ([Ljava/lang/Object;)V

    raise 'unimplemented native method : setSigners @ java/lang/Class'
  end

  # getName
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Class.getName method,args
    # ()Ljava/lang/String;

    raise 'unimplemented native method : getName @ java/lang/Class'
  end

  # getSuperclass
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Class.getSuperclass method,args
    # ()Ljava/lang/Class;

    raise 'unimplemented native method : getSuperclass @ java/lang/Class'
  end

  # getSigners
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Class.getSigners method,args
    # ()[Ljava/lang/Object;

    raise 'unimplemented native method : getSigners @ java/lang/Class'
  end

  # getComponentType
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Class.getComponentType method,args
    # ()Ljava/lang/Class;

    raise 'unimplemented native method : getComponentType @ java/lang/Class'
  end

  # getConstructor0
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Class.getConstructor0 method,args
    # ([Ljava/lang/Class;I)Ljava/lang/reflect/Constructor;

    raise 'unimplemented native method : getConstructor0 @ java/lang/Class'
  end

  # isInstance
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Class.isInstance method,args
    # (Ljava/lang/Object;)Z

    raise 'unimplemented native method : isInstance @ java/lang/Class'
  end

  # getConstructors0
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Class.getConstructors0 method,args
    # (I)[Ljava/lang/reflect/Constructor;

    raise 'unimplemented native method : getConstructors0 @ java/lang/Class'
  end

  # getFields0
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Class.getFields0 method,args
    # (I)[Ljava/lang/reflect/Field;

    raise 'unimplemented native method : getFields0 @ java/lang/Class'
  end

  # getField0
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Class.getField0 method,args
    # (Ljava/lang/String;I)Ljava/lang/reflect/Field;

    raise 'unimplemented native method : getField0 @ java/lang/Class'
  end

  # getInterfaces
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Class.getInterfaces method,args
    # ()[Ljava/lang/Class;

    raise 'unimplemented native method : getInterfaces @ java/lang/Class'
  end

  # getModifiers
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Class.getModifiers method,args
    # ()I

    raise 'unimplemented native method : getModifiers @ java/lang/Class'
  end

  # forName0
  # static method
  # func(a,b,c,...) => arg[0] : a , arg[1] : b , arg[2] : c , ...
  def RJN_java_lang_Class.forName0 method,args
    # (Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    raise 'unimplemented native method : forName0 @ java/lang/Class'
  end

  # isAssignableFrom
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Class.isAssignableFrom method,args
    # (Ljava/lang/Class;)Z

    raise 'unimplemented native method : isAssignableFrom @ java/lang/Class'
  end

  # getDeclaringClass
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Class.getDeclaringClass method,args
    # ()Ljava/lang/Class;

    raise 'unimplemented native method : getDeclaringClass @ java/lang/Class'
  end

  # getMethod0
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Class.getMethod0 method,args
    # (Ljava/lang/String;[Ljava/lang/Class;I)Ljava/lang/reflect/Method;

    raise 'unimplemented native method : getMethod0 @ java/lang/Class'
  end

  # registerNatives
  # static method
  # func(a,b,c,...) => arg[0] : a , arg[1] : b , arg[2] : c , ...
  def RJN_java_lang_Class.registerNatives method,args
    # ()V
    
    # raise 'unimplemented native method : registerNatives @ java/lang/Class'
  end

  # isArray
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Class.isArray method,args
    # ()Z

    raise 'unimplemented native method : isArray @ java/lang/Class'
  end

  # getDeclaredClasses0
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Class.getDeclaredClasses0 method,args
    # ()[Ljava/lang/Class;

    raise 'unimplemented native method : getDeclaredClasses0 @ java/lang/Class'
  end

  # isInterface
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Class.isInterface method,args
    # ()Z

    raise 'unimplemented native method : isInterface @ java/lang/Class'
  end

  # getClassLoader0
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Class.getClassLoader0 method,args
    # ()Ljava/lang/ClassLoader;

    raise 'unimplemented native method : getClassLoader0 @ java/lang/Class'
  end

  # getMethods0
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Class.getMethods0 method,args
    # (I)[Ljava/lang/reflect/Method;

    raise 'unimplemented native method : getMethods0 @ java/lang/Class'
  end

  # newInstance0
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Class.newInstance0 method,args
    # ()Ljava/lang/Object;

    raise 'unimplemented native method : newInstance0 @ java/lang/Class'
  end

  # setProtectionDomain0
  # instance method
  # func(a,b,c,...) => arg[0] : owner obj ref , arg[1] : a , arg[2] : b , ...
  def RJN_java_lang_Class.setProtectionDomain0 method,args
    # (Ljava/security/ProtectionDomain;)V

    raise 'unimplemented native method : setProtectionDomain0 @ java/lang/Class'
  end

end
