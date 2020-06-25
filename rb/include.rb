require 'rubygems'
require 'bundler'
Bundler.setup(:default, :ci)

require 'firebase'

require './rb/firebase.rb'
require './rb/string.rb'
require './rb/eancom/datetime.rb'
require './rb/eancom/document.rb'
require './rb/eancom/group.rb'
require './rb/eancom/segment.rb'
require './rb/eancom/segments/bgm.rb'
require './rb/eancom/segments/dtm.rb'
require './rb/eancom/segments/nad.rb'
require './rb/eancom/segments/rff.rb'
require './rb/eancom/segments/unb.rb'
require './rb/eancom/segments/unh.rb'