sceneManager = SceneManager.new({
	["Principio"] = Principio,
	["Pong"] = Pong,
	["Muerte"] = Muerte,
	["Ganar"] = Ganar
})


stage:addChild(sceneManager)

sceneManager:changeScene("Principio", 1, SceneManager.flipWithFade, easing.outBack)