require 'rubygems'
require 'bundler'
Bundler.setup(:default, :ci)

require 'firebase'

require 'curses'
include Curses

require './rb/firebase.rb'
require './rb/string.rb'
require './rb/edifact/datetime.rb'
require './rb/edifact/document.rb'
require './rb/edifact/group.rb'
require './rb/edifact/segment.rb'
require './rb/edifact/segments/bgm.rb'
require './rb/edifact/segments/dtm.rb'
require './rb/edifact/segments/nad.rb'
require './rb/edifact/segments/rff.rb'
require './rb/edifact/segments/unb.rb'
require './rb/edifact/segments/unh.rb'