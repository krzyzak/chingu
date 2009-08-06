require 'rubygems'
require '../lib/chingu.rb'
include Gosu

#
# Paralaxx-example
# Images from http://en.wikipedia.org/wiki/Parallax_scrolling
#
class Game < Chingu::Window
  def initialize
    super    
    self.keymap = {:left => :scroll_left, :right => :scroll_right, :escape => :close}
    
    @paralaxx = Chingu::Paralaxx.new(:x => 0, :y => 0, :center_x => 0, :center_y => 0)
    
    #
    # If no :zorder is given to @paralaxx.add_background it defaults to first added -> lowest zorder
    # Everywhere the :image argument is used, theese 2 values are the Same:
    # 1) Image["foo.png"]  2) "foo.png"
    #
    # TODO: scrolling to left borks outm, fix. + get rid of center_x / center_y args in a clean way.
    @paralaxx.add_background(:image => "Parallax-scroll-example-layer-0.png", :damping => 100, :center_x => 0, :center_y => 0)
    @paralaxx.add_background(:image => "Parallax-scroll-example-layer-1.png", :damping => 10, :center_x => 0, :center_y => 0)
    @paralaxx.add_background(:image => "Parallax-scroll-example-layer-2.png", :damping => 5, :center_x => 0, :center_y => 0)
    @paralaxx.add_background(:image => "Parallax-scroll-example-layer-3.png", :damping => 1, :center_x => 0, :center_y => 0)
  end
  
  def scroll_left
    @paralaxx.x -= 2
  end
  
  def scroll_right
    @paralaxx.x += 2
  end  
end

Game.new.show