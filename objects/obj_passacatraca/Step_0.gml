if (keyboard_check_pressed(ord("E")) && instance_exists(obj_letrae) && instance_exists(obj_turing)) {
    if (point_distance(x, y, obj_turing.x, obj_turing.y) < 250) {
		instance_destroy();
        obj_cutscene3.dialogo3 = true;
		obj_objetivos.define_objetivo(" ");
            obj_objetivos.define_etapas([" "]);
			audio_play_sound(snd_objetivoconcluido, 1, false);
			show_debug_message("seta: " + string(instance_number(obj_cutscene3)) + " inst, dialogo3=" + string(obj_cutscene3.dialogo3));
    }
}