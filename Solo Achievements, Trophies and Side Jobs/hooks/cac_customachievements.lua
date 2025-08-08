local hook_id = "AchievmentManager.init_cac_custom_achievements_SoloAchievementsTrophiesAndSideJobs_post"

Hooks:PostHook(AchievmentManager, "init_cac_custom_achievements", hook_id, function()
	local trip_mine_count = 0
	local target_count = 40
	local listener_key = {}

	managers.player:register_message("trip_mine_placed", listener_key, function()
		if not Global.statistics_manager.playing_from_start then
			return
		end

		local is_single_player = Global.game_settings.single_player

		if is_single_player then
			target_count = 14
		end

		trip_mine_count = trip_mine_count + 1

		if trip_mine_count == target_count then
			managers.achievment:award("cac_15")
		end
	end)
end)