local hook_id = "ObjectivesManager.activate_objective_SoloAchievementsTrophiesAndSideJobs_pre"
_MODS_fort_3_max_time = _MODS_fort_3_max_time or false

Hooks:PreHook(ObjectivesManager, "activate_objective", hook_id, function(self, id)
	local current_contract = Global.level_data.level_id
	local is_single_player = Global.game_settings.single_player

	if not managers.achievment:get_info("fort_3").awarded then
		if current_contract == "cage" and is_single_player then
			if id == "heist_cag1_9" then
				_MODS_fort_3_max_time = TimerManager:game():time() + 65
			elseif id == "heist_cag1_10" then
				local current_time = TimerManager:game():time()

				if _MODS_fort_3_max_time and current_time <= _MODS_fort_3_max_time then
					managers.achievment:award("fort_3")
				end
			end
		end
	end
end)