sceneManager = SceneManager.new({
	["Principio"] = Principio,
	["Pong"] = Pong,
	["Muerte"] = Muerte,
	["Ganar"] = Ganar
})


stage:addChild(sceneManager)

sceneManager:changeScene("Pong", 1, SceneManager.flipWithFade, easing.outBack)