local hook_id = "GameSetup.init_finalize_SoloAchievementsTrophiesAndSideJobs_post"

Hooks:PostHook(GameSetup, "init_finalize", hook_id, function()
	local current_contract = Global.level_data.level_id
	local is_single_player = Global.game_settings.single_player

	if current_contract == "roberts" then
		if is_single_player then
			local element_charliesierra_1_difficulty = managers.mission:get_element_by_id(105780)

			element_charliesierra_1_difficulty._values.difficulty_overkill = true
			element_charliesierra_1_difficulty._values.difficulty_hard = true
			element_charliesierra_1_difficulty._values.difficulty_normal = true
		end
	end

	if current_contract == "big" then
		if is_single_player then
			local element_cac_22_difficulty = managers.mission:get_element_by_id(106249)

			element_cac_22_difficulty._values.difficulty_overkill_145 = true
			element_cac_22_difficulty._values.difficulty_easy_wish = true

			local element_bigbank_2_instigators = managers.mission:get_element_by_id(101271)

			local enemies_with_surrendered = function (values, instigators)
				local has_converted_enemies = managers.groupai:state():get_amount_enemies_converted_to_criminals() > 0

				if has_converted_enemies then
					for _, data in pairs(managers.enemy:all_enemies()) do
						if not data.is_converted then
							table.insert(instigators, data.unit)
						end
					end
				else
					for _, data in pairs(managers.enemy:all_enemies()) do
						table.insert(instigators, data.unit)
					end
				end
			end

			element_bigbank_2_instigators._instigator_find_func = enemies_with_surrendered
		end
	end

	if current_contract == "crojob3" then
		if is_single_player then
			local element_cow_3_timer = managers.mission:get_element_by_id(103460)

			element_cow_3_timer._timer = 7
			element_cow_3_timer._values.timer = 7
		end
	end

	if current_contract == "flat" then
		if is_single_player then
			local element_cac_9 = managers.mission:get_element_by_id(100809)

			for _, element_on_executed in ipairs(element_cac_9._values.on_executed) do
				if element_on_executed.id == 100823 then
					element_on_executed.delay = 90
				end
			end
		end
	end

	if current_contract == "spa" then
		if is_single_player then
			local element_spa_6_target = managers.mission:get_element_by_id(102000)

			element_spa_6_target._values.counter_target = 4
		end
	end

	if current_contract == "dinner" then
		if is_single_player then
			local element_farm_4_target = managers.mission:get_element_by_id(102786)
			local element_farm_4_delay = managers.mission:get_element_by_id(100485)

			element_farm_4_target._values.counter_target = 1
			element_farm_4_delay._values.base_delay = 15
		end
	end

	if current_contract == "des" then
		if is_single_player then
			local element_des_11_timer = managers.mission:get_element_by_id(103023)

			element_des_11_timer._timer = 5
			element_des_11_timer._values.timer = 5
		end
	end

	if current_contract == "sah" then
		if is_single_player then
			local element_sah_9_achievement_timer = managers.mission:get_element_by_id(101874)
			local element_sah_9_start_timer = managers.mission:get_element_by_id(101875)
			local element_sah_9_stop_timer = managers.mission:get_element_by_id(101880)

			element_sah_9_achievement_timer._timer = 360
			element_sah_9_achievement_timer._values.timer = 360
			element_sah_9_start_timer._values.time = 360
			element_sah_9_stop_timer._values.time = 360
		end
	end

	if current_contract == "nmh" then
		if is_single_player then
			local element_nmh_10_difficulty = managers.mission:get_element_by_id(104772)

			element_nmh_10_difficulty._values.difficulty_normal = true

			local element_nmh_11_timer = managers.mission:get_element_by_id(104482)

			element_nmh_11_timer._timer = 10
			element_nmh_11_timer._values.timer = 10
		end
	end

	if current_contract == "deep" then
		if is_single_player then
			local element_deep_10_timer = managers.mission:get_element_by_id(103532)
			local element_deep_10_timer_update = managers.mission:get_element_by_id(104942)

			element_deep_10_timer._timer = 80
			element_deep_10_timer._values.timer = 80
			element_deep_10_timer_update:on_executed()
		end
	end
end)