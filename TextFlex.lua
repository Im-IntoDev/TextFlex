--[[

  _______        _   ______ _           
 |__   __|      | | |  ____| |          
    | | _____  _| |_| |__  | | _____  __
    | |/ _ \ \/ / __|  __| | |/ _ \ \/ /
    | |  __/>  <| |_| |    | |  __/>  < 
    |_|\___/_/\_\\__|_|    |_|\___/_/\_\
 - IntoDev

A lightweight, open-source text rendering module for ROBLOX
that offers improved flexibility, meaning precise control over each character, word and line.
It's perfect for developers looking to create custom text effects and enjoy greater creative freedom.

Github: https://github.com/Im-IntoDev/TextFlex
Devforum: https://devforum.roblox.com/t/textflex-next-level-text-fine-control-now-for-roblox-developers-open-source/3164881
Community: https://discord.gg/R9hp2vbpP5

]]--

local TextService = game:GetService("TextService")

local defaultFont = Font.new("rbxasset://fonts/families/SourceSansPro.json")
local defaultSize = 14
local defaultLineHeight = 1

export type moduleType = {
	Render: (text: string, frame: Frame, size: number?, lineHeight: number?, font: Font?, color: Color3?, wordSorting: boolean?, lineSorting: boolean?) -> nil,
}

local module = {}

function module.Render(text, frame, size, lineHeight, font, color, wordSorting, lineSorting)
	-- Parameter errors.
	if text == nil or text == "" then error("No text received.") end
	if typeof(frame) ~= "Instance" or frame.ClassName ~= "Frame" then error("No frame received.") end
	
	-- Parameter corrections.
	if typeof(font) ~= "Font" then
		font = defaultFont
	end
	if type(size) ~= "number" then
		size = defaultSize
	elseif size < 1 then
		size = 1
	end
	if type(lineHeight) ~= "number" then
		lineHeight = defaultLineHeight*size
	elseif lineHeight < 0.1 then
		lineHeight = 0.1*size
	else
		lineHeight *= size
	end
	if typeof(color) ~= "Color3" then
		color = Color3.fromRGB(0, 0, 0)
	end
	
	-- Calculate information.
	local textBoundsParams = Instance.new("GetTextBoundsParams")
	textBoundsParams.Size = size
	textBoundsParams.Font = font
	
	local frameWidth = frame.AbsoluteSize.X
	
	textBoundsParams.Text = " "
	local spaceWidth = TextService:GetTextBoundsAsync(textBoundsParams).X
	
	local x = 0
	local y = 0
	local words = text:split(" ")
	for index, word in ipairs(words) do
		local characters = {}
		local originalCharacters = word:split("")
		for index, character in ipairs(originalCharacters) do
			textBoundsParams.Text = character
			local width = TextService:GetTextBoundsAsync(textBoundsParams).X
			if x + width > frameWidth then
				y += lineHeight
				x = 0
				for _, info in ipairs(characters) do
					info.Y = y
					info.X = x
					x += info.Width
				end
			end
			table.insert(characters, {Character = character, X = x, Y = y, Width = width})
			x += width
		end
		
		words[index] = characters
		x += spaceWidth
	end
	
	-- Render text.
	if lineSorting then
		local lineIndex = 1
		local lineFolder = Instance.new("Folder")
		lineFolder.Name = tostring(lineIndex)
		lineFolder.Parent = frame
		local lastY = 0
		for index, characters in ipairs(words) do
			local currentY = characters[1].Y
			if currentY ~= lastY then -- New line.
				lineIndex += 1
				lastY = currentY
				lineFolder = Instance.new("Folder")
				lineFolder.Name = tostring(lineIndex)
				lineFolder.Parent = frame
			end
			local parent = lineFolder
			if wordSorting == true then
				local wordFolder = Instance.new("Folder")
				wordFolder.Name = tostring(index)
				wordFolder.Parent = parent
				parent = wordFolder
			end
			
			for index, info in ipairs(characters) do
				local label = Instance.new("TextLabel")
				label.Text = info.Character
				label.TextSize = size
				label.FontFace = font
				label.Size = UDim2.fromOffset(info.Width, size)
				label.Position = UDim2.fromOffset(info.X, info.Y)
				label.TextColor3 = color
				label.BackgroundTransparency = 1
				label.Name = tostring(index)
				label.Parent = parent
			end
		end
	else
		for index, characters in ipairs(words) do
			local parent = nil
			if wordSorting == true then
				local wordFolder = Instance.new("Folder")
				wordFolder.Name = tostring(index)
				wordFolder.Parent = frame
				parent = wordFolder
			else
				parent = frame
			end
			
			for index, info in ipairs(characters) do
				local label = Instance.new("TextLabel")
				label.Text = info.Character
				label.TextSize = size
				label.FontFace = font
				label.Size = UDim2.fromOffset(info.Width, size)
				label.Position = UDim2.fromOffset(info.X, info.Y)
				label.TextColor3 = color
				label.BackgroundTransparency = 1
				label.Name = tostring(index)
				label.Parent = parent
			end
		end
	end
end

return table.freeze(module) :: moduleType
