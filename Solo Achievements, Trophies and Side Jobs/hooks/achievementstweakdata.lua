local hook_id = "AchievementsTweakData.init_SoloAchievementsTrophiesAndSideJobs_post"

Hooks:PostHook(AchievementsTweakData, "init", hook_id, function(self)
	local is_single_player = Global.game_settings and Global.game_settings.single_player

	if is_single_player then
		self.convert_enemies.double_trouble.count = 2

		for _, achievement_data in pairs(self.complete_heist_achievements) do
			if achievement_data.num_players then
				if achievement_data.num_players > 1 then
					achievement_data.num_players = 1
				end
			end
		end

		self.complete_heist_achievements.turtle_wins.timer = 300

		for _, achievement_data in pairs(self.complete_heist_statistics_achievements or {}) do
			if achievement_data.num_players then
				if achievement_data.num_players > 1 then
					achievement_data.num_players = 1
				end
			end
		end

		self.complete_heist_achievements.trophy_shoutout.timer = 720
		self.complete_heist_achievements.cac_23.no_bots = false
	end
end)