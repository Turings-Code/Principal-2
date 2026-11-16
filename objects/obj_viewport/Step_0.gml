var _fala = false;

with (all) {
    if (variable_instance_exists(id, "caixadetexto") && caixadetexto) {
        _fala = true;
        break;
    }
}

if (!_fala) {
    var _w = lerp(camera_get_view_width(cam), cam_width, 0.1);
    var _h = lerp(camera_get_view_height(cam), cam_height, 0.1);
    camera_set_view_size(cam, _w, _h);

    if (instance_exists(obj_turing)) {
    var _lim_x1 = 0;
    var _lim_y1 = 0;
    var _lim_x2 = room_width;
    var _lim_y2 = room_height;

        if (room == rm_rua) {
        _lim_x1 = 0;
        _lim_y1 = 0;
        _lim_x2 = 1960;
        _lim_y2 = 805;
    } else if (room == rm_quarto) {
        _lim_x1 = 658;
        _lim_y1 = 525;
        _lim_x2 = 3591;
        _lim_y2 = 1572;
    }	else if (room == rm_entradabletchley1) {
        _lim_x1 = 0;
        _lim_y1 = 0;
        _lim_x2 = 2452;
        _lim_y2 = 1349;
    }

    var target_x = obj_turing.x - _w / 2;
    var target_y = obj_turing.y - _h / 2;

    var new_x = lerp(camera_get_view_x(cam), target_x, 0.1);
    var new_y = lerp(camera_get_view_y(cam), target_y, 0.1);

    new_x = clamp(new_x, _lim_x1, max(_lim_x1, _lim_x2 - _w));
    new_y = clamp(new_y, _lim_y1, max(_lim_y1, _lim_y2 - _h));

    camera_set_view_pos(cam, new_x, new_y);
}
}