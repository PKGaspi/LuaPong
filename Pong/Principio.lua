Principio = gideros.class(Sprite)

function onClickP(self, event)
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


function Principio:init()

	local Fondo = Bitmap.new(Texture.new("Images/Fondo.jpg"))
	stage:addChild(Fondo)

	local Pala2 = Bitmap.new(Texture.new("Images/Pala2.png"))
	stage:addChild(Pala2)
	Pala2:setPosition(110,0)

	--Movimiento Pala máquina
	Pala2.xdirection = 1
	Pala2.xspeed = 7

	local Pala = Bitmap.new(Texture.new("Images/Pala.png"))
	stage:addChild(Pala)
	Pala:setPosition(110,450)

	local Pausa = Bitmap.new(Texture.new("Images/Pausa.jpg"))
	stage:addChild(Pausa)
	Pausa:setPosition(0,130)

	local Music = Sound.new("Sounds/Music.mp3")
	Music:play(1,true)

	fuente = TTFont.new("Images/Stencil8bit-Regular.otf",70)
	self.Jugar = TextField.new(fuente, "Jugar")
	self.Jugar:setX(30)
	self.Jugar:setY(200)
	self.Jugar:setTextColor(0x000000)
	stage:addChild(self.Jugar)

	fuente = TTFont.new("Images/Stencil8bit-Regular.otf",70)
	self.Salir = TextField.new(fuente, "Salir")
	self.Salir:setX(30)
	self.Salir:setY(300)
	self.Salir:setTextColor(0x000000)
	stage:addChild(self.Salir)

	fuente = TTFont.new("Images/Stencil8bit-Regular.otf",15)
	Hecho = TextField.new(fuente, "Hecho por: GaXDpar")
	Hecho:setX(200)
	Hecho:setY(325)
	Hecho:setTextColor(0x000000)
	stage:addChild(Hecho)
	
	self:addEventListener(Event.MOUSE_UP, onClickP, self)
	
end
