if (ativar && fase == 0) {
    fase = 1;
    dialogo_index = 0;
    nome = dialogos[0].nome;
    frase = dialogos[0].frase;
    contador_texto = 0;
    mostrar_texto = true;
    texto_acelerado = false;
    caixadetexto = true;
}

if (caixadetexto && instance_exists(obj_turing)) {
    obj_turing.travado = true;
}

if (caixadetexto && nome == "Alan" && instance_exists(obj_turing)) {
    var _cam = view_camera[0];
    var _w = camera_get_view_width(_cam);
    var _h = camera_get_view_height(_cam);

    camera_set_view_pos(_cam, obj_turing.x - _w / 2, obj_turing.y - _h / 2);
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
    var _w = camera_get_view_width(_cam);
    var _h = camera_get_view_height(_cam);

    _w = lerp(_w, 1170, cam_zoom_vel);
    _h = lerp(_h, 660, cam_zoom_vel);

    if (abs(_w - 1170) < 0.5) _w = 1170;
    if (abs(_h - 660) < 0.5) _h = 660;

    camera_set_view_size(_cam, _w, _h);

    var _alvo_x = camera_get_view_x(_cam) + _w / 2;
    var _alvo_y = camera_get_view_y(_cam) + _h / 2;

    if (nome == "Alan" && instance_exists(obj_turing)) {
        _alvo_x = obj_turing.x;
        _alvo_y = obj_turing.y;
    }
    else if (nome == "Mae" && instance_exists(obj_mae)) {
        _alvo_x = obj_mae.x;
        _alvo_y = obj_mae.y;
    }

    camera_set_view_pos(_cam, _alvo_x - _w / 2, _alvo_y - _h / 2);
}

if (caixadetexto && mostrar_texto) {
    if (mouse_check_button_pressed(mb_left)) {
        if (contador_texto >= string_length(frase)) {
            mostrar_texto = false;
            alarm[1] = 10;
        } else {
            texto_acelerado = true;
        }
    }

    var _velocidade = letras_por_frame;
    if (texto_acelerado) _velocidade += vel;

    if (pausa_timer > 0) {
        pausa_timer -= 1;
    } else {
        var _contador_anterior = contador_texto;
        contador_texto += _velocidade;

        if (contador_texto > string_length(frase)) {
            contador_texto = string_length(frase);
            texto_acelerado = false;
        }

        var _letra_revelada = string_char_at(frase, floor(contador_texto));

        if (floor(contador_texto) > floor(_contador_anterior)) {
            if (_letra_revelada == "." || _letra_revelada == "!" || _letra_revelada == "?") {
                pausa_timer = 30;
            }
        }
    }
}

if (finalizando) {
    fade_final = min(fade_final + 0.02, 1);

    if (fade_final >= 1) {
        room_goto(rm_creditos);
    }
}