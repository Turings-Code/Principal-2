if (keyboard_check_pressed(ord("E")) && instance_exists(obj_letrae) && instance_exists(obj_turing)) {
    if (point_distance(x, y, obj_turing.x, obj_turing.y) < 250) {
		instance_destroy();
        obj_cutscene3.dialogo3 = true;
		obj_objetivos.define_objetivo(" ");
            obj_objetivos.define_etapas([" "]);
			audio_play_sound(snd_objetivoconcluido, 1, false);
		var _bloco = instance_position(778, 365, obj_collisionblock);
if (_bloco != noone) {
    instance_destroy(_bloco);
}
    }
}