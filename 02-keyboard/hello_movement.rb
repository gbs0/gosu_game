require 'gosu'

class GameWindow < Gosu::Windows
	# Add some screen size
	def initialize(width=320, height=240, fullscreen=false)
		super
		@x = @y = 10
		@draws = 0
		@buttons_down = 0
	end

	def update
		@x -=1 if buttons_down?(Gosu::KbLeft)
		@x +=1 if buttons_down?(Gosu::KbRight)
		@y -=1 if buttons_down?(Gosu::KbUp)
		@y +=1 if buttons_down?(Gosu::KbDown)
	end

end