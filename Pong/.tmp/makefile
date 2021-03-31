LUAC = luac

all: .tmp/Principio.lua.bin .tmp/Pong.lua.bin .tmp/button.lua.bin .tmp/easing.lua.bin

.tmp/Principio.lua.bin: Principio.lua
	$(LUAC) -o ".tmp/Principio.lua.bin" "Principio.lua"

.tmp/Pong.lua.bin: Pong.lua
	$(LUAC) -o ".tmp/Pong.lua.bin" "Pong.lua"

.tmp/button.lua.bin: button.lua
	$(LUAC) -o ".tmp/button.lua.bin" "button.lua"

.tmp/easing.lua.bin: easing.lua
	$(LUAC) -o ".tmp/easing.lua.bin" "easing.lua"

