--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*--
--*--------------------------------- HARRY VEHICLE FIREWORKS BY HARRY "AZRADEVOPS" -----------------------------*--
--*																												*--
--*																												*--
--*-- FR --																										*--
--*   v 1.0.0 du 31/03/2021 (pour les différentes étapes du dev, lisez le fichier README_DEV.md)				*--
--*   > Ajout d'une commande pour pouvoir lancer un feu d'artifice depuis un véhicule							*--
--*   			> Script écrit initialement pour être utilisé depuis un gros véhicule comme un Yatch			*--
--*																												*--
--*   Tous commentaires ou aides sont les bienvenus, allez sur  https://github.com/AzraDevOps/VehicleFireworks 	*--
--*																												*--
--*																												*--
--*-- EN --																										*--
--*   v 1.0.0 of 31/03/2021 (for the roadmap dev read README_DEV.md)											*--
--*   > Add command to run a fireworks from a vehicule															*--
--*   			> Script initialy wrote to be use from a heavy vehicle like a Yatch								*--
--*																												*--
--*   All comments or help welcome , go on  https://github.com/AzraDevOps/VehicleFireworks						*--
--*																												*--
--*																												*--
--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*--



--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*--
--*	DECLARATIONS VARIABLES & CONFIG & ESX FRAMEWORK			*--
--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*--

ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShLittleACaredObjLittleACect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end) -- Fin Citizen.CreateThread(function()



--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*--
--*	FONCTIONS 						 						*--
--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*--

-- Pas de fonctions nécessaires pour ce script
-- No functions needed in this script



--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*--
--*	THREADS 						 						*--
--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*--

-- Pas de threads nécessaires pour ce script
-- No threads needed in this script



--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*--
--*	COMMANDS 						 						*--
--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*--

-- Commande qui permets de lancer un feu d'artifices depuis un véhicule.
-- Command that's run a fireworks from the actual vehicle the player drive.
RegisterCommand("bellebleue", function(source)
	
	local _source = source
	local ped = GetPlayerPed(-1)
	local vehicle = GetVehiclePedIsIn(ped)
	
	-- Variable locale qui définit le nombre de boucle de lancer de feux d'artifices
	-- Local variable to define how many times script run fireworks
	local times = 10
	
	-- Options pour la condition ligne 85 // Possible option for the condition at line 85
	-- Vous pouvez limitez l'usage de la commande pour un véhicule spécifique avec l'option A ou pour un job particulier avec l'option B
	-- You can limit the use for a specific vehicule with use the A option or a specific job with B option
	-- (Option A) : if  GetEntityModel(vehicle) == 2086119546 then
	-- (Option B) : if PlayerData.job ~= nil and PlayerData.job.name == 'harryluxe' then
	
	if PlayerData.job ~= nil then
		
		-- Condition qui s'assure que le jeu de particules est bien chargé en mémoire
		-- Condition that's check if Fx Particules is already loaded in memory
		if not HasNamedPtfxAssetLoaded("scr_indep_fireworks") then
			RequestNamedPtfxAsset("scr_indep_fireworks")
			while not HasNamedPtfxAssetLoaded("scr_indep_fireworks") do
			   Wait(10)
			end
		end
		
		-- Récupération des coordonnées du véhicule conduit par le joueur
		-- Take coords info of the vehicule which in the player
		local vehcoords = GetEntityCoords(GetPlayerPed(-1))
   	
		-- Pause game pour limiter la consommation serveur
		-- Wait condition to limit server usage
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
--			local part5 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst", vehcoords.x , vehcoords.y, vehcoords.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)						
			times = times - 1
			Citizen.Wait(2000)
		until(times == 0)

	end -- fin if PlayerData.job ~= nil
	
end, false) -- Fin RegisterCommand("bellebleue", function(source)

