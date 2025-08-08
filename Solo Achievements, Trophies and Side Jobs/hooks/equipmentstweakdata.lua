local hook_id = "EquipmentsTweakData.init_SoloAchievementsTrophiesAndSideJobs_post"

Hooks:PostHook(EquipmentsTweakData, "init", hook_id, function(self)
	local is_single_player = Global.game_settings and Global.game_settings.single_player

	if is_single_player then
		self.specials.cable_tie.quantity = 8
		self.specials.cable_tie.max_quantity = 24
	end
end)