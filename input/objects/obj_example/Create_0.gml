enum VERB
{
    LEFT,
    RIGHT,
    UP,
    DOWN,
}

input_default_key(vk_left , VERB.LEFT );
input_default_key(vk_right, VERB.RIGHT);
input_default_key(vk_up   , VERB.UP   );
input_default_key(vk_down , VERB.DOWN );
input_default_key(ord("A"), VERB.LEFT , 1);
input_default_key(ord("D"), VERB.RIGHT, 1);
input_default_key(ord("W"), VERB.UP   , 1);
input_default_key(ord("S"), VERB.DOWN , 1);

input_default_gp_axis(gp_axislh, true , VERB.LEFT );
input_default_gp_axis(gp_axislh, false, VERB.RIGHT);
input_default_gp_axis(gp_axislv, true , VERB.UP   );
input_default_gp_axis(gp_axislv, false, VERB.DOWN );
input_default_gp_button(gp_padl, VERB.LEFT , 1);
input_default_gp_button(gp_padr, VERB.RIGHT, 1);
input_default_gp_button(gp_padu, VERB.UP   , 1);
input_default_gp_button(gp_padd, VERB.DOWN , 1);