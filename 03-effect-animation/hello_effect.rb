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

	def update
		@current_frame += 1 if frame_expired?
	end

	def draw

	end

end

	private

	def current_frame
		@animation[@current_frame % @animation.size]
	end
	
	def info # Show information on UI
		"[x:#{@x};y:#{@y}; draws: #{@draws}]"
	end
end

window = GameWindow.new
window.show