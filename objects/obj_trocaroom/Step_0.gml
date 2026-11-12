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

if (estado == "nenhum" && instance_exists(obj_turing)) {
    if (room == rm_quarto && _t1) {
        dest_room = room_next(room);
        usar_spawn = false;
        estado = "entrando";
        audio_play_sound(snd_futuro, 0.5, false);
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