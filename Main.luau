-- Confing
if game.PlaceId == 189707 then
	local Workspace=game:GetService("Workspace")

	local Water=Workspace:FindFirstChild("WaterLevel")
	if Water and Water:IsA("BasePart") then
		Water.Transparency=.7
		Water.Position=Vector3.new(Water.Position.X,10,Water.Position.Z)
		local Copy=Water:Clone()
		Copy.Anchored=true
		Copy.CanCollide=false
		Copy.CastShadow=false
		Copy.Material=Water.Material
		Copy.Size=Water.Size
		Copy.CFrame=Water.CFrame
		Copy.Parent=Workspace
	end

	local blocked={
		Cloud=true,
		AcidRain=true,
		FogEffect=true,
		BlizzardGui=true,
		SandStormGui=true
	}

	local function clean()
		for _,v in ipairs(Workspace:GetDescendants()) do
			if blocked[v.Name] then
				v:Destroy()
			end
		end
	end

	clean()

	Workspace.DescendantAdded:Connect(function(v)
		if blocked[v.Name] then
			task.defer(function()
				if v.Parent then
					v:Destroy()
				end
			end)
		end
	end)

	task.spawn(function()
		while true do
			clean()
			task.wait(.25)
		end
	end)

	print("✓ Configured")
end
