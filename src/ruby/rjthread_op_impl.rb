class RJThread
private
  # 0x00
  def op_nop
    @pc += 1
    opout "nop"
  end

  # 0x01
  def op_aconst_null
    push nil
    @pc += 1
    opout "aconst_null"
  end

  # 0x02
  def op_iconst_m1
    push(-1)
    @pc += 1
    opout "iconst_m1"
  end

  # 0x03
  def op_iconst_0
    push 0
    @pc += 1
    opout "iconst_0"
  end

  # 0x04
  def op_iconst_1
    push 1
    @pc += 1
    opout "iconst_1"
  end

  # 0x05
  def op_iconst_2
    push 2
    @pc += 1
    opout "iconst_2"
  end

  # 0x06
  def op_iconst_3
    push 3
    @pc += 1
    opout "iconst_3"
  end

  # 0x07
  def op_iconst_4
    push 4
    @pc += 1
    opout "iconst_4"
  end

  # 0x08
  def op_iconst_5
    push 5
    @pc += 1
    opout "iconst_5"
  end

  # 0x09
  def op_lconst_0
    # raise 'unsupported opcode : lconst_0'
    push2 0
    @pc += 1
    opout "lconst_0"
  end

  # 0x0a
  def op_lconst_1
    # raise 'unsupported opcode : lconst_1'
    push2 1
    @pc += 1
    opout "lconst_1"
  end

  # 0x0b
  def op_fconst_0
    push 0
    @pc += 1
    opout "fconst_0"
  end

  # 0x0c
  def op_fconst_1
    push 1
    @pc += 1
    opout "fconst_1"
  end

  # 0x0d
  def op_fconst_2
    push 2
    @pc += 1
    opout "fconst_2"
  end

  # 0x0e
  def op_dconst_0
    raise 'unsupported opcode : dconst_0'
    @pc += 1
    opout "dconst_0"
  end

  # 0x0f
  def op_dconst_1
    raise 'unsupported opcode : dconst_1'
    @pc += 1
    opout "dconst_1"
  end

  # 0x10
  def op_bipush
    push s1
    @pc += 2
    opout "bipush"
  end

  # 0x11
  def op_sipush
    push s2
    @pc += 3
    opout "sipush"
  end

  # 0x12
  def op_ldc
    v = const u1
    
    if v.kind_of? String
      # string
      push(RJStringInstance.new v)
    else
      # int or float
      push v
    end
    @pc += 2
    opout "ldc"
  end

  # 0x13
  def op_ldc_w
    raise 'unsupported opcode : ldc_w'
    @pc += 3
    opout "ldc_w"
  end

  # 0x14
  def op_ldc2_w
    # raise 'unsupported opcode : ldc2_w'
    push2 const2(u2)
    @pc += 3
    opout "ldc2_w"
  end

  # 0x15
  def op_iload
    push local(u1)
    opout "iload(push local(#{u1}) == #{local(u1)})"
    @pc += 2
  end

  # 0x16
  def op_lload
    raise 'unsupported opcode : lload'
    @pc += 2
    opout "lload"
  end

  # 0x17
  def op_fload
    push local(u1)
    @pc += 2
    opout "fload"
  end

  # 0x18
  def op_dload
    raise 'unsupported opcode : dload'
    @pc += 2
    opout "dload"
  end

  # 0x19
  def op_aload
    push local(u1)
    opout "aload (#{u1})"
    @pc += 2
  end

  # 0x1a
  def op_iload_0
    push local(0)
    @pc += 1
    opout "iload_0"
  end

  # 0x1b
  def op_iload_1
    push local(1)
    @pc += 1
    opout "iload_1"
  end

  # 0x1c
  def op_iload_2
    push local(2)
    @pc += 1
    opout "iload_2"
  end

  # 0x1d
  def op_iload_3
    push local(3)
    @pc += 1
    opout "iload_3"
  end

  # 0x1e
  def op_lload_0
    push2 local2(0)
    @pc += 1
    opout "lload_0"
  end

  # 0x1f
  def op_lload_1
    push2 local2(1)
    @pc += 1
    opout "lload_1"
  end

  # 0x20
  def op_lload_2
    push2 local2(2)
    @pc += 1
    opout "lload_2"
  end

  # 0x21
  def op_lload_3
    push2 local2(3)
    @pc += 1
    opout "lload_3"
  end

  # 0x22
  def op_fload_0
    push local(0)
    @pc += 1
    opout "fload_0"
  end

  # 0x23
  def op_fload_1
    push local(1)
    @pc += 1
    opout "fload_1"
  end

  # 0x24
  def op_fload_2
    push local(2)
    @pc += 1
    opout "fload_2"
  end

  # 0x25
  def op_fload_3
    push local(3)
    @pc += 1
    opout "fload_3"
  end

  # 0x26
  def op_dload_0
    raise 'unsupported opcode : dload_0'
    @pc += 1
    opout "dload_0"
  end

  # 0x27
  def op_dload_1
    raise 'unsupported opcode : dload_1'
    @pc += 1
    opout "dload_1"
  end

  # 0x28
  def op_dload_2
    raise 'unsupported opcode : dload_2'
    @pc += 1
    opout "dload_2"
  end

  # 0x29
  def op_dload_3
    raise 'unsupported opcode : dload_3'
    @pc += 1
    opout "dload_3"
  end

  # 0x2a
  def op_aload_0
    push local(0)
    @pc += 1
    opout "aload_0"
  end

  # 0x2b
  def op_aload_1
    push local(1)
    @pc += 1
    opout "aload_1"
  end

  # 0x2c
  def op_aload_2
    push local(2)
    @pc += 1
    opout "aload_2"
  end

  # 0x2d
  def op_aload_3
    push local(3)
    @pc += 1
    opout "aload_3"
  end

  # 0x2e
  def op_iaload
	dump_stack '**'
    i = pop
    a = pop
	if !a.kind_of? Array
		raise 'op_iaload : this is not array'
	end

    push a[i]
    @pc += 1
    opout "iaload"
  end

  # 0x2f
  def op_laload
    raise 'unsupported opcode : laload'
    @pc += 1
    opout "laload"
  end

  # 0x30
  def op_faload
    raise 'unsupported opcode : faload'
    @pc += 1
    opout "faload"
  end

  # 0x31
  def op_daload
    raise 'unsupported opcode : daload'
    @pc += 1
    opout "daload"
  end

  # 0x32
  def op_aaload
    raise 'unsupported opcode : aaload'
    @pc += 1
    opout "aaload"
  end

  # 0x33
  def op_baload
    raise 'unsupported opcode : baload'
    @pc += 1
    opout "baload"
  end

  # 0x34
  def op_caload
    i = pop
    a = pop
    push a[i]
    @pc += 1
    opout "caload"
  end

  # 0x35
  def op_saload
    raise 'unsupported opcode : saload'
    @pc += 1
    opout "saload"
  end

  # 0x36
  def op_istore
    local_set u1,pop
    @pc += 2
    opout "istore"
  end

  # 0x37
  def op_lstore
    raise 'unsupported opcode : lstore'
    @pc += 2
    opout "lstore"
  end

  # 0x38
  def op_fstore
    raise 'unsupported opcode : fstore'
    @pc += 2
    opout "fstore"
  end

  # 0x39
  def op_dstore
    raise 'unsupported opcode : dstore'
    @pc += 2
    opout "dstore"
  end

  # 0x3a
  def op_astore
    local_set u1,pop
    @pc += 2
    opout "astore"
  end

  # 0x3b
  def op_istore_0
    local_set 0,pop
    @pc += 1
    opout "istore_0"
  end

  # 0x3c
  def op_istore_1
    local_set 1,pop
    @pc += 1
    opout "istore_1"
  end

  # 0x3d
  def op_istore_2
    local_set 2,pop
    @pc += 1
    opout "istore_2"
  end

  # 0x3e
  def op_istore_3
    local_set 3,pop
    @pc += 1
    opout "istore_3"
  end

  # 0x3f
  def op_lstore_0
    raise 'unsupported opcode : lstore_0'
    @pc += 1
    opout "lstore_0"
  end

  # 0x40
  def op_lstore_1
    raise 'unsupported opcode : lstore_1'
    @pc += 1
    opout "lstore_1"
  end

  # 0x41
  def op_lstore_2
    raise 'unsupported opcode : lstore_2'
    @pc += 1
    opout "lstore_2"
  end

  # 0x42
  def op_lstore_3
    raise 'unsupported opcode : lstore_3'
    @pc += 1
    opout "lstore_3"
  end

  # 0x43
  def op_fstore_0
    raise 'unsupported opcode : fstore_0'
    @pc += 1
    opout "fstore_0"
  end

  # 0x44
  def op_fstore_1
    raise 'unsupported opcode : fstore_1'
    @pc += 1
    opout "fstore_1"
  end

  # 0x45
  def op_fstore_2
    raise 'unsupported opcode : fstore_2'
    @pc += 1
    opout "fstore_2"
  end

  # 0x46
  def op_fstore_3
    raise 'unsupported opcode : fstore_3'
    @pc += 1
    opout "fstore_3"
  end

  # 0x47
  def op_dstore_0
    raise 'unsupported opcode : dstore_0'
    @pc += 1
    opout "dstore_0"
  end

  # 0x48
  def op_dstore_1
    raise 'unsupported opcode : dstore_1'
    @pc += 1
    opout "dstore_1"
  end

  # 0x49
  def op_dstore_2
    raise 'unsupported opcode : dstore_2'
    @pc += 1
    opout "dstore_2"
  end

  # 0x4a
  def op_dstore_3
    raise 'unsupported opcode : dstore_3'
    @pc += 1
    opout "dstore_3"
  end

  # 0x4b
  def op_astore_0
    local_set 0,pop
    @pc += 1
    opout "astore_0"
  end

  # 0x4c
  def op_astore_1
    local_set 1,pop
    @pc += 1
    opout "astore_1"
  end

  # 0x4d
  def op_astore_2
    local_set 2,pop
    @pc += 1
    opout "astore_2"
  end

  # 0x4e
  def op_astore_3
    local_set 3,pop
    @pc += 1
    opout "astore_3"
  end

  # 0x4f
  def op_iastore
    v = pop
    i = pop
    a = pop
    a[i] = v
    @pc += 1
    opout "iastore"
  end

  # 0x50
  def op_lastore
    raise 'unsupported opcode : lastore'
    @pc += 1
    opout "lastore"
  end

  # 0x51
  def op_fastore
    v = pop
    i = pop
    a = pop
    a[i] = v
    @pc += 1
    opout "fastore"
  end

  # 0x52
  def op_dastore
    raise 'unsupported opcode : dastore'
    @pc += 1
    opout "dastore"
  end

  # 0x53
  def op_aastore
    v = pop
    i = pop
    a = pop
    a[i] = v
    @pc += 1
    opout "aastore"
  end

  # 0x54
  def op_bastore
    raise 'unsupported opcode : bastore'
    @pc += 1
    opout "bastore"
  end

  # 0x55
  def op_castore
    v = pop
    i = pop
    a = pop
    a[i] = v
    @pc += 1
    opout "castore"
  end

  # 0x56
  def op_sastore
    raise 'unsupported opcode : sastore'
    @pc += 1
    opout "sastore"
  end

  # 0x57
  def op_pop
    pop
    @pc += 1
    opout "pop"
  end

  # 0x58
  def op_pop2
    pop;pop
    @pc += 1
    opout "pop2"
  end

  # 0x59
  def op_dup
    v = pop
    push v
    push v
    @pc += 1
    opout "dup"
  end

  # 0x5a
  def op_dup_x1
    raise 'unsupported opcode : dup_x1'
    @pc += 1
    opout "dup_x1"
  end

  # 0x5b
  def op_dup_x2
    raise 'unsupported opcode : dup_x2'
    @pc += 1
    opout "dup_x2"
  end

  # 0x5c
  def op_dup2
    raise 'unsupported opcode : dup2'
    @pc += 1
    opout "dup2"
  end

  # 0x5d
  def op_dup2_x1
    raise 'unsupported opcode : dup2_x1'
    @pc += 1
    opout "dup2_x1"
  end

  # 0x5e
  def op_dup2_x2
    raise 'unsupported opcode : dup2_x2'
    @pc += 1
    opout "dup2_x2"
  end

  # 0x5f
  def op_swap
    raise 'unsupported opcode : swap'
    @pc += 1
    opout "swap"
  end

  # 0x60
  def op_iadd
    # dump_stack
    push pop + pop
    @pc += 1
    opout "iadd"
  end

  # 0x61
  def op_ladd
    raise 'unsupported opcode : ladd'
    @pc += 1
    opout "ladd"
  end

  # 0x62
  def op_fadd
    raise 'unsupported opcode : fadd'
    @pc += 1
    opout "fadd"
  end

  # 0x63
  def op_dadd
    raise 'unsupported opcode : dadd'
    @pc += 1
    opout "dadd"
  end

  # 0x64
  def op_isub
    v2 = pop
    v1 = pop
    push(v1-v2)
    @pc += 1
    opout "isub"
  end

  # 0x65
  def op_lsub
    raise 'unsupported opcode : lsub'
    @pc += 1
    opout "lsub"
  end

  # 0x66
  def op_fsub
    raise 'unsupported opcode : fsub'
    @pc += 1
    opout "fsub"
  end

  # 0x67
  def op_dsub
    raise 'unsupported opcode : dsub'
    @pc += 1
    opout "dsub"
  end

  # 0x68
  def op_imul
    push(pop*pop)
    @pc += 1
    opout "imul"
  end

  # 0x69
  def op_lmul
    raise 'unsupported opcode : lmul'
    @pc += 1
    opout "lmul"
  end

  # 0x6a
  def op_fmul
    raise 'unsupported opcode : fmul'
    @pc += 1
    opout "fmul"
  end

  # 0x6b
  def op_dmul
    raise 'unsupported opcode : dmul'
    @pc += 1
    opout "dmul"
  end

  # 0x6c
  def op_idiv
    v2 = pop
    v1 = pop
    push(v1/v2)
    @pc += 1
    opout "idiv"
  end

  # 0x6d
  def op_ldiv
    raise 'unsupported opcode : ldiv'
    @pc += 1
    opout "ldiv"
  end

  # 0x6e
  def op_fdiv
    raise 'unsupported opcode : fdiv'
    @pc += 1
    opout "fdiv"
  end

  # 0x6f
  def op_ddiv
    raise 'unsupported opcode : ddiv'
    @pc += 1
    opout "ddiv"
  end

  # 0x70
  def op_irem
    raise 'unsupported opcode : irem'
    @pc += 1
    opout "irem"
  end

  # 0x71
  def op_lrem
    raise 'unsupported opcode : lrem'
    @pc += 1
    opout "lrem"
  end

  # 0x72
  def op_frem
    raise 'unsupported opcode : frem'
    @pc += 1
    opout "frem"
  end

  # 0x73
  def op_drem
    raise 'unsupported opcode : drem'
    @pc += 1
    opout "drem"
  end

  # 0x74
  def op_ineg
    raise 'unsupported opcode : ineg'
    @pc += 1
    opout "ineg"
  end

  # 0x75
  def op_lneg
    raise 'unsupported opcode : lneg'
    @pc += 1
    opout "lneg"
  end

  # 0x76
  def op_fneg
    raise 'unsupported opcode : fneg'
    @pc += 1
    opout "fneg"
  end

  # 0x77
  def op_dneg
    raise 'unsupported opcode : dneg'
    @pc += 1
    opout "dneg"
  end

  # 0x78
  def op_ishl
    s = pop & 0x1f
    v = pop
    push(v << s)
    @pc += 1
    opout "ishl"
  end

  # 0x79
  def op_lshl
    raise 'unsupported opcode : lshl'
    @pc += 1
    opout "lshl"
  end

  # 0x7a
  def op_ishr
    s = pop & 0x1f
    v = pop
    push(v >> s)

    @pc += 1
    opout "ishr"
  end

  # 0x7b
  def op_lshr
    raise 'unsupported opcode : lshr'
    @pc += 1
    opout "lshr"
  end

  # 0x7c
  def op_iushr
    s = pop & 0x1f
    v = pop
    push(v >> s)
    @pc += 1
    opout "iushr"
  end

  # 0x7d
  def op_lushr
    raise 'unsupported opcode : lushr'
    @pc += 1
    opout "lushr"
  end

  # 0x7e
  def op_iand
    raise 'unsupported opcode : iand'
    @pc += 1
    opout "iand"
  end

  # 0x7f
  def op_land
    raise 'unsupported opcode : land'
    @pc += 1
    opout "land"
  end

  # 0x80
  def op_ior
    raise 'unsupported opcode : ior'
    @pc += 1
    opout "ior"
  end

  # 0x81
  def op_lor
    raise 'unsupported opcode : lor'
    @pc += 1
    opout "lor"
  end

  # 0x82
  def op_ixor
    raise 'unsupported opcode : ixor'
    @pc += 1
    opout "ixor"
  end

  # 0x83
  def op_lxor
    raise 'unsupported opcode : lxor'
    @pc += 1
    opout "lxor"
  end

  # 0x84
  def op_iinc
    lidx = u1
    local_set lidx,(local lidx) + s1(2)
    opout "iinc(local(#{lidx}+=#{s1(2)})"

    @pc += 3
  end

  # 0x85
  def op_i2l
    # raise 'unsupported opcode : i2l'
    push2 pop
    @pc += 1
    opout "i2l"
  end

  # 0x86
  def op_i2f
    # raise 'unsupported opcode : i2f'
    # ‚È‚É‚à‚µ‚È‚¢
    @pc += 1
    opout "i2f"
  end

  # 0x87
  def op_i2d
    raise 'unsupported opcode : i2d'
    @pc += 1
    opout "i2d"
  end

  # 0x88
  def op_l2i
    raise 'unsupported opcode : l2i'
    @pc += 1
    opout "l2i"
  end

  # 0x89
  def op_l2f
    raise 'unsupported opcode : l2f'
    @pc += 1
    opout "l2f"
  end

  # 0x8a
  def op_l2d
    raise 'unsupported opcode : l2d'
    @pc += 1
    opout "l2d"
  end

  # 0x8b
  def op_f2i
    raise 'unsupported opcode : f2i'
    @pc += 1
    opout "f2i"
  end

  # 0x8c
  def op_f2l
    raise 'unsupported opcode : f2l'
    @pc += 1
    opout "f2l"
  end

  # 0x8d
  def op_f2d
    raise 'unsupported opcode : f2d'
    @pc += 1
    opout "f2d"
  end

  # 0x8e
  def op_d2i
    raise 'unsupported opcode : d2i'
    @pc += 1
    opout "d2i"
  end

  # 0x8f
  def op_d2l
    raise 'unsupported opcode : d2l'
    @pc += 1
    opout "d2l"
  end

  # 0x90
  def op_d2f
    raise 'unsupported opcode : d2f'
    @pc += 1
    opout "d2f"
  end

  # 0x91
  def op_i2b
    raise 'unsupported opcode : i2b'
    @pc += 1
    opout "i2b"
  end

  # 0x92
  def op_i2c
    raise 'unsupported opcode : i2c'
    @pc += 1
    opout "i2c"
  end

  # 0x93
  def op_i2s
    raise 'unsupported opcode : i2s'
    @pc += 1
    opout "i2s"
  end

  # 0x94
  def op_lcmp
    v2 = pop2
    v1 = pop2
    if v1 > v2
      push 1
    elsif v1 == v2
      push 0
    else
      push(-1)
    end
    @pc += 1
    opout "lcmp"
  end

  # 0x95
  def op_fcmpl
    raise 'unsupported opcode : fcmpl'
    @pc += 1
    opout "fcmpl"
  end

  # 0x96
  def op_fcmpg
    raise 'unsupported opcode : fcmpg'
    @pc += 1
    opout "fcmpg"
  end

  # 0x97
  def op_dcmpl
    raise 'unsupported opcode : dcmpl'
    @pc += 1
    opout "dcmpl"
  end

  # 0x98
  def op_dcmpg
    raise 'unsupported opcode : dcmpg'
    @pc += 1
    opout "dcmpg"
  end

  # 0x99
  def op_ifeq
    v = pop
    if v == 0
      @pc += s2
    else
      @pc += 3
    end    
    opout "ifeq"
  end

  # 0x9a
  def op_ifne
    v = pop
    if v != 0
      @pc += s2
    else
      @pc += 3
    end    
    opout "ifne"
  end

  # 0x9b
  def op_iflt
    v = pop
    if v < 0
      @pc += s2
    else
      @pc += 3
    end    
    opout "iflt"
  end

  # 0x9c
  def op_ifge
    v = pop
    if v >= 0
      @pc += s2
    else
      @pc += 3
    end    
    opout "ifge(#{v} >= 0)"
  end

  # 0x9d
  def op_ifgt
    v = pop
    if v > 0
      @pc += s2
    else
      @pc += 3
    end    
    @pc += 3
    opout "ifgt"
  end

  # 0x9e
  def op_ifle
    v = pop
    p v
    if v <= 0
      @pc += s2
    else
      @pc += 3
    end    
    opout "ifle"
  end

  # 0x9f
  def op_if_icmpeq
    v2 = pop ; v1 = pop
    if v1 == v2
      @pc += s2
    else
      @pc += 3
    end
    opout "if_icmpeq"
  end

  # 0xa0
  def op_if_icmpne
    v2 = pop ; v1 = pop
    if v1 != v2
      @pc += s2
    else
      @pc += 3
    end
    opout "if_icmpne"
  end

  # 0xa1
  def op_if_icmplt
    addr = s2
    v2 = pop ; v1 = pop
    opout "# #{v1} < #{v2} ?"
    if v1 < v2
      @pc += addr
    else
      @pc += 3
    end
    opout "if_icmplt pc => #{@pc}"
  end

  # 0xa2
  def op_if_icmpge
    dump_stack
    v2 = pop ; v1 = pop
    if v1 >= v2
      @pc += s2
    else
      @pc += 3
    end
    opout "if_icmpge =>#{@pc}"
  end

  # 0xa3
  def op_if_icmpgt
    v2 = pop ; v1 = pop
    if v1 > v2
      @pc += s2
    else
      @pc += 3
    end
    opout "if_icmpgt"
  end

  # 0xa4
  def op_if_icmple
    v2 = pop ; v1 = pop
    if v1 <= v2
      @pc += s2
    else
      @pc += 3
    end
    opout "if_icmple(#{v1} <= #{v2})"
  end

  # 0xa5
  def op_if_acmpeq
    v2 = pop ; v1 = pop
    if v1 == v2
      @pc += s2
    else
      @pc += 3
    end
    opout "if_acmpeq"
  end

  # 0xa6
  def op_if_acmpne
    v2 = pop ; v1 = pop
    if v1 != v2
      @pc += s2
    else
      @pc += 3
    end
    opout "if_acmpne"
  end

  # 0xa7
  def op_goto
    @pc += s2
    #@pc += 3
    opout "goto #{@pc}"
  end

  # 0xa8
  def op_jsr
    raise 'unsupported opcode : jsr'
    @pc += 3
    opout "jsr"
  end

  # 0xa9
  def op_ret
    raise 'unsupported opcode : ret'
    @pc += 2
    opout "ret"
  end

  # 0xaa
  def op_tableswitch
    raise 'unsupported opcode : tableswitch'
    @pc += -1
    opout "tableswitch"
  end

  # 0xab
  def op_lookupswitch
    raise 'unsupported opcode : lookupswitch'
    @pc += -1
    opout "lookupswitch"
  end

  # 0xac
  def op_ireturn
    ret = pop
    restore_frame
    push ret
    opout "ireturn"
  end

  # 0xad
  def op_lreturn
    raise 'unsupported opcode : lreturn'
    @pc += 1
    opout "lreturn"
  end

  # 0xae
  def op_freturn
    raise 'unsupported opcode : freturn'
    @pc += 1
    opout "freturn"
  end

  # 0xaf
  def op_dreturn
    raise 'unsupported opcode : dreturn'
    @pc += 1
    opout "dreturn"
  end

  # 0xb0
  def op_areturn
    ret = pop
    restore_frame
    push ret
    opout "areturn"
  end

  # 0xb1
  def op_return
    restore_frame
    opout "return"
  end

  # 0xb2
  def op_getstatic
    ft = const(u2)
    push(RJClassManager.instance.get(ft[0]).get_static_field ft[1])
    @pc += 3
    opout "getstatic"
  end

  # 0xb3
  def op_putstatic
    ft = const(u2)
    RJClassManager.instance.get(ft[0]).set_static_field ft[1],pop
    @pc += 3
    opout "putstatic"
  end

  # 0xb4
  def op_getfield
    ft = const(u2)
    o = pop
    push o.get_field ft[1]
    @pc += 3
    opout "getfield #{ft.join ','}"
  end

  # 0xb5
  def op_putfield
    # dump_stack
    ft = const(u2)
    # p @method.to_s
    # p ft

    v = pop
    o = pop
    o.set_field ft[1],v
    @pc += 3
    opout "putfield"
  end

  # 0xb6
  def op_invokevirtual
    ft = const(u2)
    @pc += 3 # æ‚É‚â‚Á‚Ä‚¨‚­
    dump_stack
    cl = get_caller_obj(ft[2]).owner
    m  = cl.get_method ft[1],ft[2]
    if m.is_native?
      args = cut_stack m.arg_size
      r = m.invoke_native args
      case m.ret_size
      when 1 # other
        push r
      when 2 # long
        push2 r
      when 3 # double
        pushd r
      end
    else
      store_frame m
    end

    opout "invokevirtual , call #{ft.join ','}"
  end

  # 0xb7
  def op_invokespecial
    ft = const(u2)
    @pc += 3 # æ‚É‚â‚Á‚Ä‚¨‚­
    m  = RJClassManager.instance.get(ft[0]).get_static_method ft[1],ft[2]
    if m.is_native?
      args = cut_stack m.arg_size
      r = m.invoke_native args
      case m.ret_size
      when 1 # other
        push r
      when 2 # long
        push2 r
      when 3 # double
        pushd r
      end
    else
      store_frame m
    end
    # dump_stack
    opout "invokespecial , call #{ft.to_s}"

  end

  # 0xb8
  def op_invokestatic
    dump_stack
    ft = const(u2)
    @pc += 3 # æ‚É‚â‚Á‚Ä‚¨‚­
    m  = RJClassManager.instance.get(ft[0]).get_static_method ft[1],ft[2]
    if m.is_native?
      args = cut_stack m.arg_size
      r = m.invoke_native args
      case m.ret_size
      when 1 # other
        push r
      when 2 # long
        push2 r
      when 3 # double
        push2 r
      end
    else
      store_frame m
    end
    
    opout "invokestatic , call #{ft.to_s}"
  end

  # 0xb9
  def op_invokeinterface
    raise 'unsupported opcode : invokeinterface'
    @pc += 5
    opout "invokeinterface"
  end

  # 0xba
  def op_xxxunusedxxx
    raise 'unsupported opcode : xxxunusedxxx'
    @pc += 0
    opout "xxxunusedxxx"
  end

  # 0xbb
  def op_new
    
    ft = const(u2)
    if ft == 'java/lang/String'
      push RJStringInstance.new
    else
      push RJClassManager.instance.get(ft).create_instance
    end
    @pc += 3
    opout "new"
  end

  # 0xbc
  def op_newarray
    len = pop
    if len <= 0
      raise 'array too short'
    end
    push RJArrayInstance.new(len)
    @pc += 2
    opout "newarray"
  end

  # 0xbd
  def op_anewarray
    push Array.new(pop)
    @pc += 3
    opout "anewarray"
  end

  # 0xbe
  def op_arraylength
    dump_stack
    o = pop
    p o.to_s
    push o.size
    @pc += 1
    opout "arraylength(#{o.size})"
  end

  # 0xbf
  def op_athrow
    raise 'unsupported opcode : athrow'
    @pc += 1
    opout "athrow"
  end

  # 0xc0
  def op_checkcast
    raise 'unsupported opcode : checkcast'
    @pc += 3
    opout "checkcast"
  end

  # 0xc1
  def op_instanceof
    raise 'unsupported opcode : instanceof'
    @pc += 3
    opout "instanceof"
  end

  # 0xc2
  def op_monitorenter
    # raise 'unsupported opcode : monitorenter'
    @pc += 1
    opout "monitorenter"
  end

  # 0xc3
  def op_monitorexit
    # raise 'unsupported opcode : monitorexit'
    @pc += 1
    opout "monitorexit"
  end

  # 0xc4
  def op_wide
    raise 'unsupported opcode : wide'
    @pc += -1
    opout "wide"
  end

  # 0xc5
  def op_multianewarray
    raise 'unsupported opcode : multianewarray'
    @pc += 4
    opout "multianewarray"
  end

  # 0xc6
  def op_ifnull
    v = pop
    if v == nil || v == 0
      @pc += s2
    else
      @pc += 3
    end
    opout "ifnull"
  end

  # 0xc7
  def op_ifnonnull
    v = pop
    if v != nil || v != 0
      @pc += s2
    else
      @pc += 3
    end
    opout "ifnonnull"
  end

  # 0xc8
  def op_goto_w
    raise 'unsupported opcode : goto_w'
    @pc += 5
    opout "goto_w"
  end

  # 0xc9
  def op_jsr_w
    raise 'unsupported opcode : jsr_w'
    @pc += 5
    opout "jsr_w"
  end

  # 0xca
  def op_breakpoint
    raise 'unsupported opcode : breakpoint'
    @pc += 0
    opout "breakpoint"
  end

  # 0xfe
  def op_impdep1
    raise 'unsupported opcode : impdep1'
    @pc += 0
    opout "impdep1"
  end

  # 0xff
  def op_impdep2
    raise 'unsupported opcode : impdep2'
    @pc += 0
    opout "impdep2"
  end

end
