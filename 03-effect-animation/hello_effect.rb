require 'gosu'

def media_path(file) # Add file path
	File.join(File.dirname(File.dirname(
		__FILE__)), 'media', file)
end

class Explosion
	FRAME_DELAY = 10 # 10ms
	SPRITE = media_path('boom.png') # Our explosion Asset

	def self.load_animation(window)
		Gosu::Image.load_tiles(
			window, SPRITE, 128, 128, false)
	end

	def initialize(animation, x, y)
		@animation = animation
		@x, @y = x, y
		@current_frame = 0
	end


end


class GameWindow < Gosu::Window
	# Add some screen size
	def initialize(width=320, height=240, fullscreen=false)
		super
		@x = @y = 10
		@draws = 0
		@buttons_down = 0
	end

	def update
		@x -=1 if button_down?(Gosu::KbLeft)
		@x +=1 if button_down?(Gosu::KbRight)
		@y -=1 if button_down?(Gosu::KbUp)
		@y +=1 if button_down?(Gosu::KbDown)
	end

	def button_down(id)
		close if id == Gosu::KbEscape
		@buttons_down += 1
	end

	def button_up(id)
		@buttons_down -= 1
	end

	def needs_redraw? # Returns true if:
		@draws == 0 || @buttons_down > 0
	end

	def draw
		@draws += 1
		# Display Message
		# @message = Gosu::Image.from_text(
		# self, 'Hello World!', Gosu.default_font_name, 30)
		# Display Info
		@message = Gosu::Image.from_text(
		self, info, Gosu.default_font_name, 30)
		@message.draw(@x, @y, 0)
	end

	private

	def info # Show information on UI
		"[x:#{@x};y:#{@y}; draws: #{@draws}]"
	end
end

window = GameWindow.new
window.show