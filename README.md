# <p align="center">🎨✨TextFlex✨🎨</p>
<p align="center">A lightweight, open-source text rendering module for ROBLOX that offers improved flexibility meaning precise control over each character, word and line. It's perfect for developers looking to create custom text effects and enjoy greater creative freedom.</p>
<br><br/>

## 🌐Discover more
Like what you're seeing? Find more in [my community server](https://discord.gg/R9hp2vbpP5).

## 🚀Get started
1. Download the `.rbxm` file.
2. Drag and drop the file from your file explorer into Roblox Studio.
3. Parent the module to any place you'd like, where you'll be able to require it.

💡**Below is a simple example use of the module.**
```lua
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player.PlayerGui

local textFlex = require(path.to.TextFlex) -- "path.to" being a placeholder, so replace with actual path.

-- Note that you obviously don't have to create the UI stuff inside of a script. It can be premade in the editor, which is optimal anyways.
local screenGui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 100, 0, 70) -- this will be our bounding box size of the text.
frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
frame.Parent = screenGui
screenGui.Parent = playerGui

textFlex.Render( -- Magic.
	-- Parameters with defaults are NOT required.
	"Hello there! This is a test.", -- Text.
	frame, -- Frame - will be bounding box and parent of text.
	28, -- Text size - default: 14.
	1, -- Line height - default: 1.
	Font.new( -- Font - Default: Source Sans Pro, regular, normal.
		"rbxasset://fonts/families/PressStart2P.json", -- Find fonts and their urls at https://create.roblox.com/docs/reference/engine/datatypes/Font.
		Enum.FontWeight.Regular,
		Enum.FontStyle.Normal
	),
	Color3.fromRGB(255, 255, 255), -- Text color - default: Color3.fromRGB(0, 0, 0).
	true, -- word sorting - default: true
	false -- line sorting - default: false
)

-- What's awesome with TextFlex is that it sorts. This means you'll be able to access and individually modify every character, word and line. In this case we only turned on word sorting.
for _, folder in ipairs(frame:GetChildren()) do
	-- "folder" variable is the word folder containing all of its characters.
	local word = ""
	for _, label in ipairs(folder:GetChildren()) do
		word ..= label.Text -- "label.Text" is the character.
	end
	print("Word number "..folder.Name..": "..word) -- "folder.Name" is the index of the word - this means you can access specific words by looking for the index: frame[tostring(index_here)].
end
```

## 🖼️Share your creations
Please consider sharing some pictures of your awesome creations with this module! It allows everyone to see the incredible possiblities with this.

## 💬Feedback
Your feedback is highly appreciated, as it helps improve the user experience for everyone. Feel free to reach out if you have suggestions or run into issues.

**Contact:** Discord: *Im_IntoDev* or [my community server](https://discord.gg/R9hp2vbpP5)
