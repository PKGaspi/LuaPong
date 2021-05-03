Pong = gideros.class(Sprite)

function Pong:init()

	--Cargar sprites fondo, palas y bola
	local Fondo = Bitmap.new(Texture.new("Images/Fondo.jpg"))
	stage:addChild(Fondo)

	local Pala2 = Bitmap.new(Texture.new("Images/Pala2.png"))
	stage:addChild(Pala2)
	Pala2:setPosition(160,0)

	--Movimiento Pala máquina
	Pala2.xdirection = 1
	Pala2.xspeed = 7

	local Pala = Bitmap.new(Texture.new("Images/Pala.png"))
	stage:addChild(Pala)
	Pala:setPosition(110,450)

	local Bola = Bitmap.new(Texture.new("Images/Bola.png"))
	stage:addChild(Bola)
	Bola:setPosition(0,260)

	local GolCPU = Sound.new("Sounds/Gato.wav")

	local goles_CPU = 0
	local goles_Player = 0
	local Gato = Sound.new("Sounds/Gato.wav")
	local Boom = Sound.new("Sounds/Boom.wav")
	--Movimiento Bola
	Bola.xdirection = 1
	Bola.ydirection = 1
	Bola.xspeed = 5
	Bola.yspeed = 6.3

	--Texto CPU
	fuente = TTFont.new("Images/Stencil8bit-Regular.otf",25)
	golesCPU = TextField.new(fuente, "")
	golesCPU:setX(10)
	golesCPU:setY(20)
	golesCPU:setTextColor(0x000000)
	stage:addChild(golesCPU)
	--Texto Player
	fuente = TTFont.new("Images/Stencil8bit-Regular.otf",25)
	golesPlayer = TextField.new(fuente, "")
	golesPlayer:setX(10)
	golesPlayer:setY(475)
	golesPlayer:setTextColor(0x000000)
	stage:addChild(golesPlayer)

	stage:addEventListener(Event.MOUSE_DOWN, onMouseDown, Pala)
	stage:addEventListener(Event.MOUSE_MOVE, onMouseMove, Pala)
	stage:addEventListener(Event.ENTER_FRAME,onEnterFrame)
end
--Colisiones
function Sprite:collision(sprite2)
	-- self bottom < other srite top
	if self:getY() + self:getHeight() < sprite2:getY() then
		return false
	end
	-- self top > other sprite bottom
	if self:getY() > sprite2:getY() + sprite2:getHeight() then
		return false
	end
	-- self left > other sprite right
	if self:getX() > sprite2:getX() + sprite2:getWidth() then
		return false
	end
	-- self right < other sprite left
	if self:getX() + self:getWidth() < sprite2:getX() then
		return false
	end
	return true
end

--Funciones al iniciar
function onEnterFrame(event)
	local x = Bola:getX()
	local y = Bola:getY()
	
	x = x + (Bola.xspeed * Bola.xdirection)
	y = y + (Bola.yspeed * Bola.ydirection)
	
	if x < 0 then
		Bola.xdirection = 1
	end
	if x > 320 - Bola:getWidth() then
		Bola.xdirection = -1
	end
	if y < 0 then
		x = 320 - Bola:getWidth()
		y = 240 - (Bola:getHeight()/2)
		goles_Player = goles_Player+1
		golesPlayer:setText(goles_Player)
		Boom:play(0,false)
	end
	if y > 480 - Bola:getHeight() then
		x = 0 - Bola:getWidth()
		y = 240 - (Bola:getHeight()/2)
		goles_CPU = goles_CPU+1
		golesCPU:setText(goles_CPU)
		Gato:play(0,false)
	end
	if Bola:collision(Pala2) then
		Bola.ydirection = 1
		if x > 160 then
			Bola.xdirection = 1
		end
		if x <= 160 then
			Bola.xdirection = -1
		end
	end 
	if Bola:collision(Pala) then
		Bola.ydirection = -1
		if x > 160 then
			Bola.xdirection = 1
		end
		if x <= 160 then
			Bola.xdirection = -1
		end
	end
	Bola:setX(x)
	Bola:setY(y)
	
	--colisión Pala máquina con paredes
	local x = Pala2:getX()
	
	x = x + (Pala2.xspeed * Pala2.xdirection)
	
	if x < 0 then
		Pala2.xdirection = 1
	end
	if x > 320 - Pala2:getWidth() then
		Pala2.xdirection = -1
	end
	
	Pala2:setX(x)
end

--Movimiento Pala jugador
local function onMouseMove(self, event)
	if event.x < Pala:getX() + 100 then
		if event.x > Pala:getX() - 100 then
			local dx = event.x - self.x0
				self:setX(self:getX() + dx)
				self.x0 = event.x
		end
	end
end
local function onMouseDown(self, event)
	if event.x < Pala:getX() + 100 then
		if event.x > Pala:getX() - 100 then
			self.x0 = event.x
		end
	end
end
