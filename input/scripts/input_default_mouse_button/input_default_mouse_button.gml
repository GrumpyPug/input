/// @param button
/// @param verb
/// @param [alternate]

function input_default_mouse_button()
{
    var _button    = argument[0];
    var _verb      = argument[1];
    var _alternate = ((argument_count > 2) && (argument[2] != undefined))? argument[2] : 0;
    
    global.__input_default_player.set_binding(INPUT_SOURCE.MOUSE, _verb, _alternate,
                                              {
                                                  type          : "mouse button",
                                                  value         : _button,
                                                  axis_negative : undefined,
                                              });
    
    var _p = 0;
    repeat(INPUT_MAX_PLAYERS)
    {
        global.__input_players[_p].set_binding(INPUT_SOURCE.MOUSE, _verb, _alternate,
                                               {
                                                   type          : "mouse button",
                                                   value         : _button,
                                                   axis_negative : undefined,
                                               });
        ++_p;
    }
}