/// @param verb
/// @param [alternate]

function input_default_mouse_wheel_up()
{
    var _verb      = argument[0];
    var _alternate = ((argument_count > 1) && (argument[1] != undefined))? argument[1] : 0;
    
    global.__input_mouse_valid = true;
    
    global.__input_default_player.set_binding(INPUT_SOURCE.KEYBOARD_AND_MOUSE, _verb, _alternate,
                                              new __input_class_binding("wheel up"));
    
    var _p = 0;
    repeat(INPUT_MAX_PLAYERS)
    {
        global.__input_players[_p].set_binding(INPUT_SOURCE.KEYBOARD_AND_MOUSE, _verb, _alternate,
                                               new __input_class_binding("wheel up"));
        ++_p;
    }
}