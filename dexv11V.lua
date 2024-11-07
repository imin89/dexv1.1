-- Инициализация GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ObjectExplorer"
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0.3, 0, 0.8, 0)
Frame.Position = UDim2.new(0.7, 0, 0.1, 0)
Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Text = "Object Explorer"
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSans
Title.TextSize = 24

local ScrollingFrame = Instance.new("ScrollingFrame", Frame)
ScrollingFrame.Position = UDim2.new(0, 0, 0, 50)
ScrollingFrame.Size = UDim2.new(1, 0, 1, -50)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 2, 0)

-- Функция для отображения объектов и их свойств
local function DisplayObject(object, parent)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, -10, 0, 30)
    Button.Text = object.Name .. " (" .. object.ClassName .. ")"
    Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Parent = parent

    Button.MouseButton1Click:Connect(function()
        -- Очистить предыдущие объекты
        for _, child in ipairs(ScrollingFrame:GetChildren()) do
            if child:IsA("TextButton") then
                child:Destroy()
            end
        end

        -- Показать дочерние элементы
        for _, child in ipairs(object:GetChildren()) do
            DisplayObject(child, ScrollingFrame)
        end
    end)
end

-- Основная функция для отображения всех объектов
local function ExploreObjects()
    for _, obj in ipairs(game:GetChildren()) do
        DisplayObject(obj, ScrollingFrame)
    end
end

ExploreObjects()
