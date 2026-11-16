var _t1 = false;
var _t2 = false;
var _t3 = false;
var _t4 = false;

if (instance_exists(obj_turing)) {
    with (obj_turing) {
        _t1 = place_meeting(x, y, obj_troca);
        _t2 = place_meeting(x, y, obj_troca2);
        _t3 = place_meeting(x, y, obj_troca3);
        _t4 = place_meeting(x, y, obj_troca4);
    }
}

if (room != room_anterior) {
    estado = "saindo";
    room_anterior = room;
}

if (estado == "nenhum" && instance_exists(obj_cursor) && (obj_cursor.clicou || obj_cursor.clicou2)) {
    estado = "escurecendo";
}

if (estado == "escurecendo") {
    alpha = min(alpha + 0.02, 1);
}

if (estado == "nenhum" && instance_exists(obj_turing)) {
    if (room == rm_quarto && _t1) {
        dest_room = rm_rua;
        usar_spawn = false;
        estado = "entrando";
    }
    else if (room == rm_rua && _t1) {
        dest_room = rm_onibus;
        usar_spawn = false;
        estado = "entrando";
    }
	    else if (room == rm_onibus && _t1) {
        dest_room = rm_entradabletchley1;
        spawn_x = 1743;
        spawn_y = 1223;
        usar_spawn = true;
        estado = "entrando";
    }
    else if (room == rm_bletchley2) {
        if (_t1) {
            dest_room = rm_bletchley1;
            spawn_x = 2884;
            spawn_y = 986;
            usar_spawn = true;
            estado = "entrando";
        }
        else if (_t2) {
            dest_room = rm_bletchley1;
            spawn_x = 2853;
            spawn_y = 1691;
            usar_spawn = true;
            estado = "entrando";
        }
    }
    else if (room == rm_bletchley1) {
        if (_t1) {
            dest_room = rm_bletchley2;
            spawn_x = 155;
            spawn_y = 1054;
            usar_spawn = true;
            estado = "entrando";
        }
        else if (_t2) {
            dest_room = rm_bletchley2;
            spawn_x = 172;
            spawn_y = 1676;
            usar_spawn = true;
            estado = "entrando";
        }
        else if (_t3) {
            dest_room = rm_entradabletchley2;
            spawn_x = 2420;
            spawn_y = 674;
            usar_spawn = true;
            estado = "entrando";
        }
    }
        else if (room == rm_entradabletchley2) {
        if (_t1) {
            dest_room = rm_bletchley1;
            spawn_x = 166;
            spawn_y = 1670;
            usar_spawn = true;
            estado = "entrando";
        }
        else if (_t2) {
            dest_room = rm_entradabletchley1;
            spawn_x = 1232;
            spawn_y = 521;
            usar_spawn = true;
            estado = "entrando";
        }
    }
        else if (room == rm_entradabletchley1) {
        if (_t1) {
            dest_room = rm_entradabletchley2;
            spawn_x = 127;
            spawn_y = 1478;
            usar_spawn = true;
            estado = "entrando";
        }
        else if (_t2) {
            dest_room = rm_salaentrada;
            usar_spawn = false;
            estado = "entrando";
        }
    }
		else if (room == rm_salaentrada && _t1) {
		dest_room = rm_entradabletchley1;
	    spawn_x = 371;
	    spawn_y = 787;
	    usar_spawn = true;
	    estado = "entrando";
}
}

if (estado == "entrando") {
    alpha += 0.02;
    if (alpha >= 1) {
        alpha = 1;
        room_goto(dest_room);
    }
}

if (estado == "saindo") {
    alpha -= 0.02;
    if (alpha <= 0) {
        alpha = 0;
        estado = "nenhum";
    }
} 