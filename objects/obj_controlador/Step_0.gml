

if (keyboard_check_pressed(vk_escape)) {
    window_set_fullscreen(false);
}
if(room==rm_menu){
var scale_x = window_get_width() / room_width;
var scale_y = window_get_height() / room_height;

var wx = window_mouse_get_x();
var wy = window_mouse_get_y();

var cx = clamp(wx, 930 * scale_x, 1300 * scale_x);
var cy = clamp(wy, 560 * scale_y, 730 * scale_y);

if (wx != cx || wy != cy) {
    window_mouse_set(cx, cy);
}
}

if (fundo_ligando) {
    var _fundo = layer_background_get_id(layer_get_id("Background"));
    var _n = sprite_get_number(spr_mansaofundoliga);
    if (layer_background_get_index(_fundo) >= _n - 1) {
        layer_background_sprite(_fundo, spr_mansaofundoligado);
        layer_background_index(_fundo, 0);
        layer_background_speed(_fundo, 0);
        fundo_ligando = false;
        global.mansaoligada = true;
		global.iniciar_dialogo3 = true;
		
    }
}