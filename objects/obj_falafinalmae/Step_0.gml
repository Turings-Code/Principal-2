if (keyboard_check_pressed(ord("E")) && instance_exists(obj_letrae) && instance_exists(obj_turing)) {
    if (point_distance(x, y, obj_turing.x, obj_turing.y) < 250) {
		instance_destroy();
        if (instance_exists(obj_cutscene10)) {
    obj_cutscene10.ativar = true;
}
    }
}