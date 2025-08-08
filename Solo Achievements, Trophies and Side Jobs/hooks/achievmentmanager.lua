local hook_id_1 = "AchievmentManager.check_gsu_01_achievement_SoloAchievementsTrophiesAndSideJobs_post"

Hooks:PostHook(AchievmentManager, "check_gsu_01_achievement", hook_id_1, function()
	return true
end)

local hook_id_2 = "AchievmentManager.total_unlocked_SoloAchievementsTrophiesAndSideJobs_post_1"

Hooks:PostHook(AchievmentManager, "total_unlocked", hook_id_2, function(self)
	local for_removal = {}

	for id, achievement in pairs(self.achievments) do
		if achievement.tracked and achievement.awarded then
			table.insert(for_removal, id)
		end
	end

	if #for_removal > 0 then
		for _, id in ipairs(for_removal) do
			self:track(id, false)
		end
	end
end)

local hook_id_3 = "AchievmentManager.total_unlocked_SoloAchievementsTrophiesAndSideJobs_post_2"
_MODS_pent_11_desc_is_changed = _MODS_pent_11_desc_is_changed or false

Hooks:PostHook(AchievmentManager, "total_unlocked", hook_id_3, function()
	if managers.achievment:get_info("pent_11").awarded or _MODS_pent_11_desc_is_changed then
		return
	end

	local pent_11_desc = managers.localization:text("achievement_pent_11_additional")

	local dragon_heist_loc_name = managers.localization:text("heist_chas")
	local ukrainian_prisoner_loc_name = managers.localization:text("heist_sand")
	local black_cat_loc_name = managers.localization:text("heist_chca")
	local mountain_master_loc_name = managers.localization:text("heist_pent")

	local progress_loc = managers.localization:to_upper_text("menu_unlock_progress")
	local dialog_yes_loc = managers.localization:to_upper_text("dialog_yes")
	local dialog_no_loc = managers.localization:to_upper_text("dialog_no")

	local pent_11_dragon_heist_tracking = dragon_heist_loc_name .. ": " .. tostring(Global.mission_manager.saved_job_values["tea_chas"] and dialog_yes_loc or dialog_no_loc)
	local pent_11_ukrainian_prisoner_tracking = ukrainian_prisoner_loc_name .. ": " .. tostring(Global.mission_manager.saved_job_values["tea_sand"] and dialog_yes_loc or dialog_no_loc)
	local pent_11_black_cat_tracking = black_cat_loc_name .. ": " .. tostring(Global.mission_manager.saved_job_values["tea_chca"] and dialog_yes_loc or dialog_no_loc)
	local pent_11_mountain_master_tracking = mountain_master_loc_name .. ": " .. tostring(Global.mission_manager.saved_job_values["tea_pent"] and dialog_yes_loc or dialog_no_loc)

	local pent_11_tracking_result = pent_11_dragon_heist_tracking .. "\n" .. pent_11_ukrainian_prisoner_tracking .. "\n" .. pent_11_black_cat_tracking .. "\n" .. pent_11_mountain_master_tracking

	managers.localization:add_localized_strings({
  		["achievement_pent_11_additional"] = pent_11_desc .. "\n\n" .. progress_loc .. "\n" .. pent_11_tracking_result
	})

	_MODS_pent_11_desc_is_changed = true
end)

local hook_id_4 = "AchievmentManager.do_award_SoloAchievementsTrophiesAndSideJobs_post"

local function do_award_post(self, id)
	self.achievments[id].awarded = true

	if not managers.hud and not self.achievments[id].showed_awarded then
		require("lib/managers/hud/HudChallengeNotification")

		local visual = tweak_data.achievement.visual[id]
		local title = managers.localization:to_upper_text("hud_achieved_popup")
		local text = visual and managers.localization:to_upper_text(visual.name_id) or id
		local icon = visual and visual.icon_id or "placeholder_circle"

		HudChallengeNotification.queue(title, text, icon)

		self.achievments[id].showed_awarded = true
	end
end

Hooks:PostHook(AchievmentManager, "award_steam", hook_id_4, do_award_post)
Hooks:PostHook(AchievmentManager, "award_epic", hook_id_4, do_award_post)
Hooks:PostHook(AchievmentManager, "award_none", hook_id_4, do_award_post)
Hooks:PostHook(AchievmentManager, "award_psn", hook_id_4, do_award_post)
Hooks:PostHook(AchievmentManager, "award_x360", hook_id_4, do_award_post)