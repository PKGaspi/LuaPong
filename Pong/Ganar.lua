Ganar = gideros.class(Sprite)

function onClick(self, event)
	print(event.x, event.y)
	if 	event.x > self.Jugar:getX() and
		event.x < self.Jugar:getX() + self.Jugar:getWidth() and
		event.y > self.Jugar:getY() - self.Jugar:getHeight() / 2 and
		event.y < self.Jugar:getY() + self.Jugar:getHeight() / 2
	then
		sceneManager:changeScene("Pong", 1, SceneManager.flipWithFade, easing.outBack)
	elseif event.x > self.Salir:getX() and
		event.x < self.Salir:getX() + self.Salir:getWidth() and
		event.y > self.Salir:getY() - self.Jugar:getHeight() / 2 and
		event.y < self.Salir:getY() + self.Salir:getHeight() / 2
	then
		application:exit()
	end
end

function Ganar:init()
	local Hitlerbaby = Bitmap.new(Texture.new("Images/Hitlerbaby.jpg"))
	stage:addChild(Hitlerbaby)
	Hitlerbaby:setScale(1.4,1.4)
	Hitlerbaby:setPosition(-100,0)

	fuente = TTFont.new("Images/Stencil8bit-Regular.otf",30)
	GanarTXT = TextField.new(fuente, "NEIN!! HAS GANADO!")
	GanarTXT:setX(20)
	GanarTXT:setY(110)
	GanarTXT:setTextColor(0x000000)
	stage:addChild(GanarTXT)

	fuente = TTFont.new("Images/Stencil8bit-Regular.otf",30)
	self.Jugar = TextField.new(fuente, "Juega otra vez")
	self.Jugar:setX(20)
	self.Jugar:setY(140)
	self.Jugar:setTextColor(0x000000)
	stage:addChild(self.Jugar)

	fuente = TTFont.new("Images/Stencil8bit-Regular.otf",30)
	self.Salir = TextField.new(fuente, "Salir")
	self.Salir:setX(20)
	self.Salir:setY(160)
	self.Salir:setTextColor(0x000000)
	stage:addChild(self.Salir)

	Jugar:addEventListener(Event.MOUSE_UP, onClick)
end

