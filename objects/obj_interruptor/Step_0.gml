if (keyboard_check_pressed(ord("E")) && instance_exists(obj_letrae) && instance_exists(obj_turing)) {
    if (point_distance(x, y, obj_turing.x, obj_turing.y) < 250) {
		var _fundo = layer_background_get_id(layer_get_id("Background"));
layer_background_sprite(_fundo, spr_mansaofundoliga);
layer_background_index(_fundo, 0);
layer_background_speed(_fundo, 4);
obj_controlador.fundo_ligando = true;
		instance_destroy();
    }
}