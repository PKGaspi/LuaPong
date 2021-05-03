Principio = gideros.class(Sprite)

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
Jugar = TextField.new(fuente, "Jugar")
Jugar:setX(30)
Jugar:setY(200)
Jugar:setTextColor(0x000000)
stage:addChild(Jugar)

fuente = TTFont.new("Images/Stencil8bit-Regular.otf",70)
Salir = TextField.new(fuente, "Salir")
Salir:setX(30)
Salir:setY(300)
Salir:setTextColor(0x000000)
stage:addChild(Salir)

fuente = TTFont.new("Images/Stencil8bit-Regular.otf",15)
Hecho = TextField.new(fuente, "Hecho por: GaXDpar")
Hecho:setX(200)
Hecho:setY(325)
Hecho:setTextColor(0x000000)
stage:addChild(Hecho)

function onEnterFrame(event)
end

function onClick_event_Jugar(event)
	sceneManager:changeScene("Pong", 1, SceneManager.flipWithFade, easing.outBack)
end

function onClick_event_Salir(event)
	application:exit()
end

stage:addEventListener(Event.ENTER_FRAME,onEnterFrame)
Jugar:addEventListener("click", onClick_event_Jugar)
Salir:addEventListener("click", onClick_event_Salir)