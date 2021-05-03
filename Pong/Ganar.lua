Ganar = gideros.class(Sprite)

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
Jugar = TextField.new(fuente, "Juega otra vez")
Jugar:setX(20)
Jugar:setY(140)
Jugar:setTextColor(0x000000)
stage:addChild(Jugar)

fuente = TTFont.new("Images/Stencil8bit-Regular.otf",30)
Salir = TextField.new(fuente, "Salir")
Salir:setX(20)
Salir:setY(160)
Salir:setTextColor(0x000000)
stage:addChild(Salir)

function onClick_event_Jugar(event)
	sceneManager:changeScene("Pong", 1, SceneManager.flipWithFade, easing.outBack)
end

function onClick_event_Salir(event)
	application:exit()
end

Jugar:addEventListener("click", onClick_event_Jugar)
Salir:addEventListener("click", onClick_event_Salir)