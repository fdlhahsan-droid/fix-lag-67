--// EAGLE HUB X - FPS Boost Script
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local Terrain = Workspace:FindFirstChildOfClass("Terrain")

--// Əsas qrafik parametrlərinin aşağı salınması
Lighting.GlobalShadows = false
Lighting.Brightness = 1
Lighting.FogEnd = 9e9

if Terrain then
	Terrain.WaterWaveSize = 0
	Terrain.WaterWaveSpeed = 0
	Terrain.WaterReflectance = 0
	Terrain.WaterTransparency = 1
end

--// Material və teksturların optimizasiyası
for _, v in ipairs(Workspace:GetDescendants()) do
	if v:IsA("BasePart") then
		v.Material = Enum.Material.SmoothPlastic
		v.Reflectance = 0
	elseif v:IsA("Decal") or v:IsA("Texture") then
		v.Transparency = 1
	elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
		v.Enabled = false
	end
end

--// Yeni yaranan obyektlər üçün tənzimləmə
Workspace.DescendantAdded:Connect(function(v)
	if v:IsA("BasePart") then
		v.Material = Enum.Material.SmoothPlastic
		v.Reflectance = 0
	elseif v:IsA("Decal") or v:IsA("Texture") then
		v.Transparency = 1
	elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
		v.Enabled = false
	end
end)

print("FPS Boost Aktivləşdirildi!")
