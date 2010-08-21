#!/usr/bin/ruby
# @file   rjinstance.rb
# @author K.S.
#
# $Date: 2002/10/14 13:59:49 $
# $Id: rjinstance.rb,v 1.1 2002/10/14 13:59:49 ko1 Exp $
#
# Create : K.S. 02/10/13 01:41:42
#
#
# new されたインスタンスを表現
#
# 主に field 管理


class RJInstance
  attr_reader :owner
  
  def initialize own
    @owner   = own
    @fields  = {}
    set_fields own
  end

  def to_s
    "instance of #{@owner.to_s}"
  end

  def set_field name,value
    if @fields.has_key? name
      @fields[name] = value
    else
      raise "#{self.to_s} doesn't have such field : #{name}"
    end
  end

  def get_field name
    if @fields.has_key? name
      @fields[name]
    else
      raise "#{self.to_s} doesn't have such field : #{name}"
    end
  end

private

  def set_fields cls
    # puts "#{cls.this_class}"
    cls.jfields.each{|k,v|
      # puts "#** #{k} = #{v.join ','},#{sprintf("%08x",v[0])}"
      if (v[0] & 0x0008) == 0
        @fields[k] = 0
      end
    }
    if cls.super
      set_fields cls.super
    end
  end
  
end

