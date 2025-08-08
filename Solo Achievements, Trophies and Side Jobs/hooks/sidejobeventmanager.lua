local hook_id = "SideJobEventManager._apply_fetched_event_data_SoloAchievementsTrophiesAndSideJobs_pre"

Hooks:PreHook(SideJobEventManager, "_apply_fetched_event_data", hook_id, function(self)
	self._fetched_event_data = {
		pda9 = {
			pigs = 20000000,
			stage = 5
		},
		cg22 = {
			bags = 6417206,
			stage = 6
		},
		pda10 = {
			bags = 21825945,
			stage = 6
		}
	}

	for event_id, event_data in pairs(self._tweak_data.event_info) do
		if event_data.steam_stages then
			for index, stage in table.reverse_ipairs(event_data.steam_stages) do
				if stage then
					managers.event_jobs:set_event_stage(event_id, index)
				end
			end
		end
	end
end)