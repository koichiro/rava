#!/usr/bin/ruby
# @file   rava.rb
# @author K.S.
#
# $Date: 2002/10/14 13:59:49 $
# $Id: rava.rb,v 1.1 2002/10/14 13:59:49 ko1 Exp $
#
# Create : K.S. 02/10/12 18:18:31
#
#
# Rava
# ( rava かぁ・・・ )


# 必要なのも、少ないねぇ・・・
require 'rjthreadmanager'
require 'rjclassmanager'

##############################################
# start

tm = RJThreadManager.instance
cm = RJClassManager .instance

m = cm.load ARGV[0]      # main なクラスをロードする
t = tm.create            # 新しいスレッドを用意
t.set_main m,ARGV[1..-1] # main を起動する準備をする

t.kick                   # そのスレッドを起動（うへえ）

# なんか簡単だ（笑）


# 最後のがなくなるまでストップ
Thread.stop


