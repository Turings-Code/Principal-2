if (keyboard_check_pressed(ord("E")) && instance_exists(obj_letrae) && instance_exists(obj_turing)) {
    if (point_distance(x, y, obj_turing.x, obj_turing.y) < 250) {
		instance_destroy();
		obj_turing.theosegue=false;
		obj_alan.seguindo=false;
		obj_alan.sprite_index=spr_alanparado;
		obj_theo.sprite_index=spr_theoparado;

		obj_objetivos.define_objetivo("");
	audio_play_sound(snd_objetivoconcluido, 1, false);
	global.iniciar_dialogo_cutscene7 = true;
    }
}