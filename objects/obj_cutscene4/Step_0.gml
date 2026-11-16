if (caixadetexto && instance_exists(obj_turing)) {
    obj_turing.travado = true;
}

if (fase == 0) {
    if (instance_exists(obj_onibus2)) {
        onibus_vel = min(onibus_vel + onibus_acel, onibus_vel_max);
        obj_onibus2.x -= onibus_vel;

        if (obj_onibus2.bbox_right < 0) {
            with (obj_onibus2) {
                instance_destroy();
            }
            fase = 1;
        }
    } else {
        fase = 1;
    }
}

if (fase == 1) {
    fase = 2;
    dialogo_index = 0;
    nome = dialogos[0].nome;
    frase = dialogos[0].frase;
    contador_texto = 0;
    mostrar_texto = true;
    texto_acelerado = false;
    caixadetexto = true;
}

if (fase == 3 && !dialogo2_feito && dialogo2) {
    dialogo2_feito = true;
    dialogo2 = false;
    fase = 4;
    dialogos = dialogos2;
    dialogo_index = 0;
    nome = dialogos[0].nome;
    frase = dialogos[0].frase;
    contador_texto = 0;
    mostrar_texto = true;
    texto_acelerado = false;
    caixadetexto = true;
}

if (fase == 5 && !dialogo3_feito && global.puzzlebinario && instance_exists(obj_turing)) {
    if (point_in_rectangle(obj_turing.x, obj_turing.y, 915, 322, 1600, 705)) {
        dialogo3_feito = true;
        fase = 6;
        dialogos = dialogos3;
        dialogo_index = 0;
        nome = dialogos[0].nome;
        frase = dialogos[0].frase;
        contador_texto = 0;
        mostrar_texto = true;
        texto_acelerado = false;
        caixadetexto = true;
    }
}

var _falando = (mostrar_texto && contador_texto < string_length(frase) && pausa_timer <= 0 && caixadetexto);

if (_falando) {
    if (!audio_is_playing(snd_textblip)) {
        som_blip_id = audio_play_sound(snd_textblip, 10, true);
    }
    audio_sound_pitch(som_blip_id, texto_acelerado ? 1.2 : 1);
} else {
    if (audio_is_playing(snd_textblip)) {
        audio_stop_sound(snd_textblip);
    }
}

if (caixadetexto) {
    var _cam = view_camera[0];
    var _alvo = noone;

    if (nome == "Alan" && instance_exists(obj_alan)) {
        _alvo = obj_alan;
    } else if (nome == "Turing" && instance_exists(obj_turing)) {
        _alvo = obj_turing;
    } else if (nome == "Theo" && instance_exists(obj_theo)) {
        _alvo = obj_theo;
    }

    var _w = camera_get_view_width(_cam);
    var _h = camera_get_view_height(_cam);

    var _centro_x = camera_get_view_x(_cam) + _w / 2;
    var _centro_y = camera_get_view_y(_cam) + _h / 2;

    var _w_alvo = (_alvo != noone) ? 1170 : 1365;
    var _h_alvo = (_alvo != noone) ? 660 : 770;

    _w = lerp(_w, _w_alvo, cam_zoom_vel);
    _h = lerp(_h, _h_alvo, cam_zoom_vel);

    if (abs(_w - _w_alvo) < 0.5) _w = _w_alvo;
    if (abs(_h - _h_alvo) < 0.5) _h = _h_alvo;

    if (_alvo != noone) {
        _centro_x = lerp(_centro_x, (_alvo.bbox_left + _alvo.bbox_right) / 2, cam_vel);
        _centro_y = lerp(_centro_y, (_alvo.bbox_top + _alvo.bbox_bottom) / 2, cam_vel);
    }

    camera_set_view_size(_cam, _w, _h);
    camera_set_view_pos(_cam, _centro_x - _w / 2, _centro_y - _h / 2);
}