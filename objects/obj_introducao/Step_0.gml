if (estado_intro == 0) {
    alpha_texto = min(alpha_texto + 0.02, 1);
    if (alpha_texto >= 1) {
        estado_intro = 1;
        timer_intro = game_get_speed(gamespeed_fps) * 2;
    }
} else if (estado_intro == 1) {
    timer_intro -= 1;
    if (timer_intro <= 0) {
        estado_intro = 2;
    }
} else if (estado_intro == 2) {
    alpha_texto = max(alpha_texto - 0.02, 0);
    if (alpha_texto <= 0) {
        estado_intro = 3;
        if (instance_exists(obj_trocaroom)) {
            obj_trocaroom.dest_room = rm_quarto;
            obj_trocaroom.estado = "entrando";
        } else {
            room_goto(rm_quarto);
        }
    }
}