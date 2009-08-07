#
#
#
#
require 'rubygems'
require 'gosu'

%w{	window
		fpscounter
		named_resource
		assets
    game_object
		data_structures
		rect
		animation
		keymap
    parallax
		}.each do |lib|
      root ||= File.dirname(File.expand_path(__FILE__))
      require File.join(root,"chingu",lib)
    end

module Chingu
  VERSION = "0.0.1"
end