local hook_id = "MissionEndState.at_enter_SoloAchievementsTrophiesAndSideJobs_post"

Hooks:PostHook(MissionEndState, "at_enter", hook_id, function(self)
	if self._success then
		local current_contract = Global.level_data.level_id
		local current_difficulty = tweak_data:difficulty_to_index(Global.game_settings.difficulty)
		local is_single_player = Global.game_settings.single_player
		local amount_of_bots = managers.criminals:nr_AI_criminals()

		if not managers.achievment:get_info("cac_28").awarded then
			if is_single_player and current_contract == "nmh" and current_difficulty >= 5 then
				managers.achievment:award("cac_28")
			end
		end

		if not managers.achievment:get_info("king_of_the_hill").awarded then
			if current_contract == "escape_park" or current_contract == "escape_park_day" then
				if is_single_player and amount_of_bots == 0 and current_difficulty >= 7 then
					managers.achievment:award("king_of_the_hill")
				end
			end
		end

		if not managers.achievment:get_info("bex_10").awarded then
			if current_contract == "bex" then
				if is_single_player and amount_of_bots == 0 and current_difficulty >= 7 then
					managers.achievment:award("bex_10")
				end
			end
		end
	end
end)