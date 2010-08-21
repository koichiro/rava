#!/usr/bin/ruby
# @file   rjthreadmanager.rb
# @author K.S.
#
# $Date: 2002/10/14 13:59:49 $
# $Id: rjthreadmanager.rb,v 1.1 2002/10/14 13:59:49 ko1 Exp $
#
# Create : K.S. 02/10/12 18:28:06
#
# ƒXƒŒƒbƒh‚ğŠÇ—‚·‚é‚·‚é
#
require 'singleton'

class RJThreadManager
  include Singleton
  def initialize
    @jthreads = []
    @main     = Thread.current
  end

  def create
    t = RJThread.new
    @jthreads << t
    
    t
  end

  def delete t
    @jthreads.delete t
    if is_empty?
      @main.run
    end
  end

  def is_empty?
    @jthreads.size == 0
  end
end




