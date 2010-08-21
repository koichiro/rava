#!/usr/bin/ruby
# @file   rjexception.rb
# @author K.S.
#
# $Date: 2002/10/14 13:59:49 $
# $Id: rjexception.rb,v 1.1 2002/10/14 13:59:49 ko1 Exp $
#
# Create : K.S. 02/10/13 14:36:56
#
# exception 定義
#
#


class RJException < Exception
  # 特になにも・・・
end

# スレッド終了時例外
class RJExceptionFinishThread < RJException
  # ...
end




