_MODS_overdrill_is_activated = _MODS_overdrill_is_activated or false
local is_single_player = Global.game_settings and Global.game_settings.single_player

if not is_single_player or _MODS_overdrill_is_activated then
	return
end

local current_contract = Global.level_data.level_id
local current_difficulty = tweak_data:difficulty_to_index(Global.game_settings.difficulty)
local is_stealth = managers.groupai:state():whisper_mode()
local activated_message = managers.localization:text("SATaSJ_overdrill_activator_message")

if current_contract == "red2" and current_difficulty >= 7 and not is_stealth then
	for _, script in pairs(managers.mission:scripts()) do
		for _, element in pairs(script:elements()) do
			for _, trigger in pairs(element:values().trigger_list or {}) do
				if trigger.notify_unit_sequence == "light_on" then
					element:on_executed()
					managers.chat:_receive_message(1, "Overdrill Activator", activated_message, Color.yellow)

					_MODS_overdrill_is_activated = true
				end
			end
		end
	end
end