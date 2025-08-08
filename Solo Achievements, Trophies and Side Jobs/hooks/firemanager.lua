local hook_id_1 = "FireManager._clbk_on_dot_var_added_SoloAchievementsTrophiesAndSideJobs_post"
_MODS_grill_4_dozers_on_fire_list = _MODS_grill_4_dozers_on_fire_list or {}

Hooks:PostHook(FireManager, "_clbk_on_dot_var_added", hook_id_1, function(self, dot_info, var_info)
	local player_key = managers.player:player_unit():key()
	local unit_key = dot_info.unit and dot_info.unit:key()
	local unit_base = dot_info.unit and dot_info.unit:base()
	local is_dozer = unit_base and unit_base.has_tag and unit_base:has_tag("tank")
	local is_fire = var_info.variant == "fire"
	local by_player = player_key == var_info.last_attacker_unit:key()

	if is_dozer and is_fire and by_player then
		local start_burning_time = var_info.dot_applied_time

		for _, dozer in ipairs(_MODS_grill_4_dozers_on_fire_list) do
			if dozer.unit_key == unit_key then
				return
			end
		end

		table.insert(_MODS_grill_4_dozers_on_fire_list, {
			unit_key = unit_key,
			start_burning_time = start_burning_time
		})
	end
end)

local hook_id_2 = "FireManager._clbk_on_dot_var_removed_SoloAchievementsTrophiesAndSideJobs_post"

Hooks:PostHook(FireManager, "_clbk_on_dot_var_removed", hook_id_2, function(self, dot_info, var_info)
	local unit_key = dot_info.unit and dot_info.unit:key()
	local unit_index

	for index, dozer in ipairs(_MODS_grill_4_dozers_on_fire_list) do
		if dozer.unit_key == unit_key then
			unit_index = index

			local end_burning_time = var_info.dot_applied_time
			local total_burning_time = end_burning_time - dozer.start_burning_time

			if not managers.achievment:get_info("grill_4").awarded and total_burning_time >= 10 then
				managers.achievment:award("grill_4")
			end
		end
	end

	if unit_index then
		table.remove(_MODS_grill_4_dozers_on_fire_list, unit_index)
	end
end)