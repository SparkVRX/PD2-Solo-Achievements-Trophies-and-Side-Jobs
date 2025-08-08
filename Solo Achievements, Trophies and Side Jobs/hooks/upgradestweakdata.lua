local hook_id = "UpgradesTweakData._init_pd2_values_SoloAchievementsTrophiesAndSideJobs_post"

Hooks:PostHook(UpgradesTweakData, "_init_pd2_values", hook_id, function(self)
	self.skill_descs.triathlete.multibasic2 = "16/4"

	local is_single_player = Global.game_settings and Global.game_settings.single_player

	if is_single_player then
		self.values.cable_tie.quantity_1 = {
			16
		}
	end
end)