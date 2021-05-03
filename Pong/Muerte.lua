Muerte = gideros.class(Sprite)

function onClick(self, event)
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

function Muerte:init()
	local Hitler = Bitmap.new(Texture.new("Images/Hitler.jpg"))
	stage:addChild(Hitler)
	Hitler:setScale(.6,.6)
	Hitler:setPosition(-60,0)

	fuente = TTFont.new("Images/Stencil8bit-Regular.otf",30)
	PerderTXT = TextField.new(fuente, "HAHAHA!! HAS PERDIDO!!")
	PerderTXT:setX(60)
	PerderTXT:setY(160)
	PerderTXT:setTextColor(0x000000)
	stage:addChild(PerderTXT)

	fuente = TTFont.new("Images/Stencil8bit-Regular.otf",30)
	self.Jugar = TextField.new(fuente, "Juega otra vez")
	self.Jugar:setX(60)
	self.Jugar:setY(190)
	self.Jugar:setTextColor(0x000000)
	stage:addChild(self.Jugar)

	fuente = TTFont.new("Images/Stencil8bit-Regular.otf",30)
	self.Salir = TextField.new(fuente, "Salir")
	self.Salir:setX(60)
	self.Salir:setY(210)
	self.Salir:setTextColor(0x000000)
	stage:addChild(self.Salir)

	self:addEventListener(Event.MOUSE_UP, onClick)
end

