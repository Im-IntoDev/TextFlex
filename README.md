# TextFlex
A lightweight, open-source text rendering module for ROBLOX that offers improved flexibility and precise control over each character. It's perfect for developers looking to create custom text effects and enjoy greater creative freedom.
<br><br/>

## How to use
1. Download the `.rbxm` file.
2. Drag and drop the file from your file explorer into Roblox Studio.
3. Parent the module to ReplicatedFirst to ensure it appears during the loading phase. This is the recommended location for any loading screen code.

**Below is a simple example use of the module.**
```lua
local Players = game:GetService("Players")

local textFlex = require(path.to.TextFlex) -- "path.to" being a placeholder.

-- Note that you obviously don't have to create the UI stuff inside of a script. It can be premade in the editor, which is optimal anyways.
local screenGui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
frame.Size = UDim2.new(100, 70) -- this will be our bounding box size of the text.
frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
frame.Parent = screenGui
screenGui.Parent = Players.LocalPlayer

textFlex.Render( -- Magic.
	"Hello there! This is a test.", -- Text.
	frame, -- Frame.
	28, -- Size - default: 14.
	1, -- Line height - default: 1.
	Font.new( -- Font - default: Font.new("Source Sans Pro").
		"Arcade",
		Enum.FontWeight.Regular,
		Enum.FontStyle.Normal
	),
	Color3.fromRGB(255, 255, 255) -- Color - default: Color3.fromRGB(0, 0, 0).
)
```

## Feedback
Your feedback is highly appreciated, as it helps improve the user experience for everyone. Feel free to reach out if you have suggestions or run into issues.

**Contact:** Discord: *Im_IntoDev*
