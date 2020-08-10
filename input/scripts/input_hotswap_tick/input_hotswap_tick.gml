/// @param [playerIndex]

function input_hotswap_tick()
{
    var _player_index = ((argument_count > 0) && (argument[0] != undefined))? argument[0] : 0;
    
    if (_player_index < 0)
    {
        __input_error("Invalid player index provided (", _player_index, ")");
        return undefined;
    }
    
    if (_player_index >= INPUT_MAX_PLAYERS)
    {
        __input_error("Player index too large (", _player_index, " vs. ", INPUT_MAX_PLAYERS, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    with(global.__input_players[_player_index])
    {
        if ((last_input_time < 0) || (current_time - last_input_time > INPUT_HOTSWAP_DELAY))
        {
            if (keyboard_check(vk_anykey) && __input_source_is_available(INPUT_SOURCE.KEYBOARD))
            {
                input_player_source_set(INPUT_NO_SEPARATE_KEYBOARD_AND_MOUSE? INPUT_SOURCE.KEYBOARD_AND_MOUSE : INPUT_SOURCE.KEYBOARD, _player_index);
            }
            else if ((global.__input_mouse_moved || mouse_check_button(mb_any) || mouse_wheel_up() || mouse_wheel_down())
                 &&  __input_source_is_available(INPUT_SOURCE.MOUSE))
            {
                input_player_source_set(INPUT_NO_SEPARATE_KEYBOARD_AND_MOUSE? INPUT_SOURCE.KEYBOARD_AND_MOUSE : INPUT_SOURCE.MOUSE, _player_index);
            }
            else
            {
                var _g = 0;
                repeat(gamepad_get_device_count())
                {
                    if (gamepad_is_connected(_g) && __input_source_is_available(INPUT_SOURCE.GAMEPAD, _g))
                    {
                        if (gamepad_button_check(_g, gp_face1)
                        ||  gamepad_button_check(_g, gp_face2)
                        ||  gamepad_button_check(_g, gp_face3)
                        ||  gamepad_button_check(_g, gp_face4)
                        ||  gamepad_button_check(_g, gp_padu)
                        ||  gamepad_button_check(_g, gp_padd)
                        ||  gamepad_button_check(_g, gp_padl)
                        ||  gamepad_button_check(_g, gp_padr)
                        ||  gamepad_button_check(_g, gp_shoulderl)
                        ||  gamepad_button_check(_g, gp_shoulderr)
                        ||  gamepad_button_check(_g, gp_shoulderlb)
                        ||  gamepad_button_check(_g, gp_shoulderrb)
                        ||  gamepad_button_check(_g, gp_start)
                        ||  gamepad_button_check(_g, gp_select)
                        ||  gamepad_button_check(_g, gp_stickl)
                        ||  gamepad_button_check(_g, gp_stickr)
                        ||  (abs(gamepad_axis_value(_g, gp_axislh)) > INPUT_DEFAULT_MIN_THRESHOLD)
                        ||  (abs(gamepad_axis_value(_g, gp_axislv)) > INPUT_DEFAULT_MIN_THRESHOLD)
                        ||  (abs(gamepad_axis_value(_g, gp_axisrh)) > INPUT_DEFAULT_MIN_THRESHOLD)
                        ||  (abs(gamepad_axis_value(_g, gp_axisrv)) > INPUT_DEFAULT_MIN_THRESHOLD))
                        {
                            input_player_source_set(INPUT_SOURCE.GAMEPAD, _player_index);
                            input_player_gamepad_set(_g, _player_index);
                        }
                    }
                    
                    ++_g;
                }
            }
        }
    }
}