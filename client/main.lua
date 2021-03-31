RegisterCommand("vfireworks", function(source)
	local _source = source
	local ped = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(ped)
	local times = 10
	if  GetEntityModel(vehicle) == 2086119546 then
		if not HasNamedPtfxAssetLoaded("scr_indep_fireworks") then
			RequestNamedPtfxAsset("scr_indep_fireworks")
			while not HasNamedPtfxAssetLoaded("scr_indep_fireworks") do
			   Citizen.Wait(10)
			end
		end

		local vehcoords = GetEntityCoords(ped)
		Citizen.Wait(1000)
		repeat
			UseParticleFxAssetNextCall("scr_indep_fireworks")
			local part1 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_starburst", vehcoords.x - 5, vehcoords.y, vehcoords.z +10 , 0.0, 0.0, 0.0, 1.0, false, false, false, false)
			UseParticleFxAssetNextCall("scr_indep_fireworks")
			local part2 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_shotburst", vehcoords.x - 2, vehcoords.y, vehcoords.z + 10, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
			UseParticleFxAssetNextCall("scr_indep_fireworks")
			local part3 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst", vehcoords.x, vehcoords.y, vehcoords.z + 10, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
			UseParticleFxAssetNextCall("scr_indep_fireworks")
			local part4 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trail_spawn", vehcoords.x + 2, vehcoords.y, vehcoords.z + 10 , 0.0, 0.0, 0.0, 1.0, false, false, false, false)
			UseParticleFxAssetNextCall("scr_indep_fireworks")
			local part5 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_fountain", vehcoords.x + 5, vehcoords.y, vehcoords.z + 10, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
			times = times - 1
			Citizen.Wait(2000)
		until(times == 0)
	end
end, false)