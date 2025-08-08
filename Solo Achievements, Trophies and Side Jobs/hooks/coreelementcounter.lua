core:module("CoreElementCounter")

local hook_id = "ElementCounter._check_triggers_SoloAchievementsTrophiesAndSideJobs_pre"

Hooks:PreHook(ElementCounter, "_check_triggers", hook_id, function (self, type)
	if not self._triggers[type] then
		return
	end

	local current_contract = Global.level_data.level_id
	local is_single_player = Global.game_settings.single_player

	if current_contract == "alex_3" and tostring(self:id()) == "100423" then
		local target_count = 7

		if is_single_player then
			target_count = 3
		end

		self._triggers[type][100827].amount = target_count
	end
end)