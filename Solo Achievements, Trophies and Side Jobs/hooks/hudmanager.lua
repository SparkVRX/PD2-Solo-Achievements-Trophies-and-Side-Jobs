local waypoint_name = "CorrectPCWaypoint"
local hook_id_1 = "HUDManager.add_waypoint_SoloAchievementsTrophiesAndSideJobs_post"

Hooks:PostHook(HUDManager, "add_waypoint", hook_id_1, function(self, id)
	local current_contract = Global.level_data.level_id
	local is_single_player = Global.game_settings.single_player

	if current_contract == "big" then
		if (id == 104653 or id == 101674) and is_single_player then
			local pc_positions = {
				staff_computer_the_one001 = Vector3(2725.0, 1439.0, -923.0),
				staff_computer_the_one002 = Vector3(2072.0, 1443.0, -922.772),
				staff_computer_the_one003 = Vector3(1966.0, 1343.0, -922.772),
				staff_computer_the_one004 = Vector3(1575.0, 1450.0, -923.0),
				staff_computer_the_one005 = Vector3(2532.0, 1817.0, -922.772),
				staff_computer_the_one006 = Vector3(2471.0, 1847.0, -923.0),
				staff_computer_the_one007 = Vector3(1840.0, 1796.0, -922.772),
				staff_computer_the_one008 = Vector3(1736.0, 1784.0, -922.772),
				staff_computer_the_one009 = Vector3(1093.0, 1251.0, -522.772),
				staff_computer_the_one010 = Vector3(1288.0, 1247.0, -522.772),
				staff_computer_the_one011 = Vector3(1883.0, 1392.0, -522.762),
				staff_computer_the_one012 = Vector3(1885.13, 1592.08, -522.762),
				staff_computer_the_one013 = Vector3(2344.0, 1613.0, -522.762),
				staff_computer_the_one014 = Vector3(2346.3, 1428.81, -522.762),
				staff_computer_the_one015 = Vector3(2761.55, 1236.39, -522.772),
				staff_computer_the_one016 = Vector3(2910.0, 1748.0, -522.772),
				staff_computer_the_one017 = Vector3(2918.6, 1248.96, -522.772)
			}

			local element_random_pc = managers.mission:get_element_by_id(103246)
			local element_correct_pc = managers.mission:get_element_by_id(element_random_pc._values.on_executed[1].id)
			local correct_pc_position

			for name, position in pairs(pc_positions) do
				if name == element_correct_pc._editor_name then
					correct_pc_position = position
				end
			end

			if correct_pc_position then
				managers.hud:remove_waypoint(id)

				managers.hud:add_waypoint(waypoint_name, {
					present_timer = 0,
					icon = "pd2_computer",
					state = "sneak_present",
					distance = true,
					position = correct_pc_position
				})
			end
		end
	end
end)

local hook_id_2 = "HUDManager.remove_waypoint_SoloAchievementsTrophiesAndSideJobs_post"

Hooks:PostHook(HUDManager, "remove_waypoint", hook_id_2, function(self, id)
	local current_contract = Global.level_data.level_id

	if current_contract == "big" then
		if id == 104653 or id == 101674 then
			managers.hud:remove_waypoint(waypoint_name)
		end
	end
end)