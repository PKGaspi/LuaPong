Pong = gideros.class(Sprite)

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
function onEnterFrame(self, event)
	local x = self.Bola:getX()
	local y = self.Bola:getY()
	
	x = x + (self.Bola.xspeed * self.Bola.xdirection)
	y = y + (self.Bola.yspeed * self.Bola.ydirection)
	
	if x < 0 then
		self.Bola.xdirection = 1
	end
	if x > 320 - self.Bola:getWidth() then
		self.Bola.xdirection = -1
	end
	if y < 0 then
		x = 320 - self.Bola:getWidth()
		y = 240 - (self.Bola:getHeight()/2)
		self.goles_Player = self.goles_Player+1
		self.golesPlayer:setText(self.goles_Player)
		self.Boom:play(0,false)
		if self.goles_Player >= 10 then
			sceneManager:changeScene("Ganar", 1, SceneManager.flipWithFade, easing.outBack)
		end
	end
	if y > 480 - self.Bola:getHeight() then
		x = 0 - self.Bola:getWidth()
		y = 240 - (self.Bola:getHeight()/2)
		self.goles_CPU = self.goles_CPU+1
		self.golesCPU:setText(self.goles_CPU)
		self.Gato:play(0,false)
		if self.goles_CPU >= 10 then
			sceneManager:changeScene("Muerte", 1, SceneManager.flipWithFade, easing.outBack)
		end
	end
	if self.Bola:collision(self.Pala2) then
		self.Bola.ydirection = 1
		if x > 160 then
			self.Bola.xdirection = 1
		end
		if x <= 160 then
			self.Bola.xdirection = -1
		end
	end 
	if self.Bola:collision(self.Pala) then
		self.Bola.ydirection = -1
		if x > 160 then
			self.Bola.xdirection = 1
		end
		if x <= 160 then
			self.Bola.xdirection = -1
		end
	end
	self.Bola:setX(x)
	self.Bola:setY(y)
	
	--colisión Pala máquina con paredes
	local x = self.Pala2:getX()
	
	x = x + (self.Pala2.xspeed * self.Pala2.xdirection)
	
	if x < 0 then
		self.Pala2.xdirection = 1
	end
	if x > 320 - self.Pala2:getWidth() then
		self.Pala2.xdirection = -1
	end
	
	self.Pala2:setX(x)
end

--Movimiento Pala jugador
local function onMouseMove(self, event)
	if event.x < self.Pala:getX() + 100 then
		if event.x > self.Pala:getX() - 100 then
			local dx = event.x - self.Pala.x0
				self.Pala:setX(self.Pala:getX() + dx)
				self.Pala.x0 = event.x
		end
	end
end
local function onMouseDown(self, event)
	if event.x < self.Pala:getX() + 100 then
		if event.x > self.Pala:getX() - 100 then
			self.Pala.x0 = event.x
		end
	end
end

function Pong:init()

	--Cargar sprites fondo, palas y bola
	local Fondo = Bitmap.new(Texture.new("Images/Fondo.jpg"))
	stage:addChild(Fondo)

	self.Pala2 = Bitmap.new(Texture.new("Images/Pala2.png"))
	stage:addChild(self.Pala2)
	self.Pala2:setPosition(160,0)

	--Movimiento Pala máquina
	self.Pala2.xdirection = 1
	self.Pala2.xspeed = 7

	self.Pala = Bitmap.new(Texture.new("Images/Pala.png"))
	stage:addChild(self.Pala)
	self.Pala:setPosition(110,450)

	self.Bola = Bitmap.new(Texture.new("Images/Bola.png"))
	stage:addChild(self.Bola)
	self.Bola:setPosition(0,260)
	
	-- esta variable de mierda la dejo aquí porque el programador
	-- original de esta cosa así lo quería y por los memes.
	local GolCPU = Sound.new("Sounds/Gato.wav")

	self.goles_CPU = 0
	self.goles_Player = 0
	self.Gato = Sound.new("Sounds/Gato.wav")
	self.Boom = Sound.new("Sounds/Boom.wav")
	--Movimiento Bola
	self.Bola.xdirection = 1
	self.Bola.ydirection = 1
	self.Bola.xspeed = 5
	self.Bola.yspeed = 6.3

	--Texto CPU
	fuente = TTFont.new("Images/Stencil8bit-Regular.otf",25)
	self.golesCPU = TextField.new(fuente, "")
	self.golesCPU:setX(10)
	self.golesCPU:setY(20)
	self.golesCPU:setTextColor(0x000000)
	stage:addChild(self.golesCPU)
	--Texto Player
	fuente = TTFont.new("Images/Stencil8bit-Regular.otf",25)
	self.golesPlayer = TextField.new(fuente, "")
	self.golesPlayer:setX(10)
	self.golesPlayer:setY(475)
	self.golesPlayer:setTextColor(0x000000)
	stage:addChild(self.golesPlayer)

	stage:addEventListener(Event.MOUSE_DOWN, onMouseDown, self)
	stage:addEventListener(Event.MOUSE_MOVE, onMouseMove, self)
	stage:addEventListener(Event.ENTER_FRAME, onEnterFrame, self)
end