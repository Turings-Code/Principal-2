if (global.chaveseguranca && instance_exists(obj_turing)) {
    if (point_distance(x, y, obj_turing.x, obj_turing.y) <= alcance && keyboard_check_pressed(ord("F"))) {
        obj_portacinza3.destrancada = true;
		obj_portacinza3.image_speed=3;
        with (obj_collisionblocktemp) {
    if (x == 2107 && y == 1213) {
        instance_destroy();
    }
}

        instance_destroy();
    }
}
if (!global.chaveseguranca && instance_exists(obj_turing)) {
    if (point_distance(x, y, obj_turing.x, obj_turing.y) <= alcance && keyboard_check_pressed(ord("F"))) {

        if(!audio_is_playing(snd_portatrancada)){
			audio_play_sound(snd_portatrancada, 1, false);}

    }
}