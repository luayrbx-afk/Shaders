local L = game:GetService("Lighting")
local W = game:GetService("Workspace")

for _, c in pairs(L:GetChildren()) do
    if c:IsA("PostEffect") or c:IsA("Sky") then c:Destroy() end
end

local B = Instance.new("BloomEffect", L)
B.Intensity = 0.1
local Blur = Instance.new("BlurEffect", L)
Blur.Size = 2
local CC = Instance.new("ColorCorrectionEffect", L)
CC.Saturation = 0.1

L.Brightness = 2
L.OutdoorAmbient = Color3.fromRGB(34, 0, 49)
L.ClockTime = 6.7

for _, p in pairs(W:GetDescendants()) do
    if p:IsA("BasePart") then
        p.Reflectance = 0.2
        if p.Material == Enum.Material.Plastic then
            p.Material = Enum.Material.SmoothPlastic
        end
    end
end

W.DescendantAdded:Connect(function(p)
    if p:IsA("BasePart") then p.Reflectance = 0.2 end
end)
