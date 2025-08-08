local hook_id = "PlayerManager.update_SoloAchievementsTrophiesAndSideJobs_post"

Hooks:PostHook(PlayerManager, "update", hook_id, function(self)
	local session = managers.network:session()

	if not session then
		return
	end

	if #self._global.synced_cocaine_stacks < 1 then
		return
	end

	local is_single_player = Global.game_settings.single_player
	local amount = 0
	local target_count = 1500

	if is_single_player then
		target_count = 390
	end

	for _, stack in pairs(self._global.synced_cocaine_stacks) do
		if stack.in_use then
			amount = amount + stack.amount
		end

		if target_count <= amount then
			managers.achievment:award("mad_5")
		end
	end
end)