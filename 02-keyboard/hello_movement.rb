require 'gosu'

class GameWindow < Gosu::Window
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

	def button_down(id)
		# Add logic
	end

	def button_up(id)
		@buttons_down -= 1
	end

	def needs_redraw? # Returns true if:
		@draws == 0 || @buttons_down > 0
	end

	def draw
		@draws += 1
		@message = Gosu::Image.from_text(
		self, 'Hello World!', Gosu.default_font_name, 30)
		@message.draw(@x, @y, 0)
	end

	private

	def info # Show information on UI
		"[x:#{@x};y:#{@y}; draws: #{@draws}]"
	end
end

window = GameWindow.new
window.show