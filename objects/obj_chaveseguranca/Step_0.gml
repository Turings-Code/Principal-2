if (keyboard_check_pressed(ord("E")) && instance_exists(obj_letrae) && instance_exists(obj_turing)) {
    if (point_distance(x, y, obj_turing.x, obj_turing.y) < 250) {

	if (instance_exists(obj_inventario)) {
    obj_inventario.nome_item = "Chave de Segurança";
    obj_inventario.ganhouitem = true;
	global.chaveseguranca=true;
}
audio_play_sound(snd_itemnovo, 1, false);
	instance_destroy();
    }
}