Muerte = gideros.class(Sprite)

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
Jugar = TextField.new(fuente, "Juega otra vez")
Jugar:setX(60)
Jugar:setY(190)
Jugar:setTextColor(0x000000)
stage:addChild(Jugar)

fuente = TTFont.new("Images/Stencil8bit-Regular.otf",30)
Salir = TextField.new(fuente, "Salir")
Salir:setX(60)
Salir:setY(210)
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