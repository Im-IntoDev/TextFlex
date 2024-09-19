<div align="center">

![TextFlex Logo](https://github.com/user-attachments/assets/be6665b0-a308-460c-917f-b87ab1a7d1f9)

</div>

<p align="center">A lightweight, open-source text rendering module for ROBLOX that offers improved flexibility, meaning precise control over each character, word and line. It's perfect for developers looking to create custom text effects and enjoy greater creative freedom.</p>
<div align="center">

[Devforum post](https://devforum.roblox.com/t/textflex-new-creative-opportunities-with-text-for-roblox-developers-open-source/3164881) | [Roblox model](https://create.roblox.com/store/asset/138658986432597/TextFlex) | [Community](https://discord.gg/R9hp2vbpP5)

</div>
<br><br/>

# ✨Features
TextFlex efficiently renders text into your selected Frame instance, maintaining mostly all of the features of your usual TextLabel, filling your frame with characters sorted according to your preference. You are able to sort your text by words, lines, or both, giving you full control over how content is structured within the frame.

Below is an example where both word and line sorting are enabled for demonstration.

![image](https://github.com/user-attachments/assets/4450b178-8d92-40bd-a711-993d2adb44fd)

# ⚡Performance
TextFlex is lightweight, rendering the english alphabet (including commas and spaces) in approximately 9 milliseconds on average. However, keep in mind that multiple TextLabels are in use simultaneously, and continuous rendering could lead to performance lag.

### Not impressed by the performance?
Well, the slower rendering time is mostly impacted by the `TextService:GetTextBoundsAsync()`, which sends a network request.
*If you have any ideas, remember that this is an open-source project, meaning everyone is able to contribute!*

## 🚀Get started
1. Download the `.rbxm` file, or import the model from the toolbox.
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
frame.Size = UDim2.new(0, 250, 0, 100) -- this will be our bounding box size of the text.
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
	true, -- word sorting - default: true.
	false -- line sorting - default: false.
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
