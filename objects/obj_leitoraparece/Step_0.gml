if (keyboard_check_pressed(ord("E")) && instance_exists(obj_letrae) && instance_exists(obj_turing)) {
    if (point_distance(x, y, obj_turing.x, obj_turing.y) < 170) {
		instance_create_layer(0, 0, "Instances", obj_leitor);
		instance_destroy();
    }
}