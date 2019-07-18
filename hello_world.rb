require 'gosu'

class GameWindow < Gosu::Windows
	def initialize
		super
		self.caption = 'Hello'
		@message = Gosu::Image.from_text(
		self, 'Hello World!', Gosu.default_font_name, 30)
	end

	def draw
		@message.draw(10,10,0)
	end

end