if (caixadetexto && instance_exists(obj_turing)) {
    obj_turing.travado = true;
}

if (variable_global_exists("iniciar_dialogo4") && global.iniciar_dialogo4 && !dialogo4_feito && !caixadetexto) {
    global.iniciar_dialogo4 = false;
    dialogo4_feito = true;
    em_dialogo4 = true;

    dialogos = dialogos4;
    dialogo_index = 0;
    nome = dialogos[0].nome;
    frase = dialogos[0].frase;
    contador_texto = 0;
    mostrar_texto = true;
    texto_acelerado = false;
    caixadetexto = true;
}

if (variable_global_exists("iniciar_dialogo3") && global.iniciar_dialogo3 && !dialogo3_feito && !caixadetexto) {
    global.iniciar_dialogo3 = false;
    dialogo3_feito = true;
    em_dialogo3 = true;

    dialogos = dialogos3;
    dialogo_index = 0;
    nome = dialogos[0].nome;
    frase = dialogos[0].frase;
    contador_texto = 0;
    mostrar_texto = true;
    texto_acelerado = false;
    caixadetexto = true;
}

if (!dialogo2_feito && !caixadetexto && instance_exists(obj_turing)) {
    if (collision_rectangle(2367, 1061, 2658, 1351, obj_turing, false, false) != noone) {
        dialogo2_feito = true;
        em_dialogo2 = true;
		audio_play_sound(snd_objetivo, 1, false);
        obj_turing.theosegue = false;

        if (instance_exists(obj_alan)) {
            obj_alan.seguindo = false;
            obj_alan.x = 2672;
            obj_alan.y = 1204;
        }
        if (instance_exists(obj_theo)) {
            obj_theo.x = 2911;
            obj_theo.y = 1347;
        }

        dialogos = dialogos2;
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
    if (som_blip_id != -1 && audio_is_playing(som_blip_id)) {
        audio_stop_sound(som_blip_id);
        som_blip_id = -1;
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