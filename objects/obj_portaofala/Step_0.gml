if (keyboard_check_pressed(ord("E")) && instance_exists(obj_letrae) && instance_exists(obj_turing)) {
    if (point_distance(x, y, obj_turing.x, obj_turing.y) < 250) {
		instance_destroy();
		obj_turing.theosegue=false;
		obj_alan.seguindo=false;
		obj_alan.sprite_index=spr_alanparado;
		obj_theo.sprite_index=spr_theoparado;
        obj_cutscene4.dialogo2 = true;
		obj_objetivos.define_objetivo("");
		/*obj_alan.y=obj_turing.y;
		obj_alan.x=obj_turing.x-150;
		obj_theo.y=obj_turing.y;
		obj_theo.x=obj_turing.x+150;*/
		with (obj_controladorcollisiontemp) {
    for (var i = 0; i < array_length(blocos_inst4); i++) {
        if (instance_exists(blocos_inst4[i])) {
            instance_destroy(blocos_inst4[i]);
        }
    }
    blocos_inst4 = [];
}
    }
}