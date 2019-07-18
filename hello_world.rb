require 'gosu'

class GameWindow < Gosu::Windows
	def initialize
		super
		self.caption = 'Hello'
		@message = Gosu::Image.from_text(
		self, 'Hello World!', Gosu.default_font_name, 30)
	end

	def draw
		# Provide X/Y screen cordinates and Z equal 0
		@message.draw(10, 10, 0)
	end

end