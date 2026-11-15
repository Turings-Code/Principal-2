if (transicao > 0) {
    if (instance_exists(obj_turing)) {
        obj_turing.travado = true;
    }

    if (transicao == 1) {
        alpha_preto = min(alpha_preto + 0.008, 1);
        if (alpha_preto >= 1) {
            transicao = 2;
        }
    } else if (transicao == 2) {
        alpha_msg = min(alpha_msg + 0.008, 1);
        if (alpha_msg >= 1) {
            transicao = 3;
            timer_trans = game_get_speed(gamespeed_fps) * 2;
        }
    } else if (transicao == 3) {
        timer_trans--;
        if (timer_trans <= 0) {
            transicao = 4;
			obj_fundoonibus.image_speed=0;
			obj_fundoonibus.image_index=0;
			obj_postesonibus.image_speed=0;
			var _troca = instance_create_layer(280, 517, "Instances", obj_troca);
        _troca.image_xscale = 6;
        _troca.image_yscale = 6;
			if (instance_exists(obj_turing)) {
        obj_turing.x = 442;
        obj_turing.y = 282;
    }
    if (instance_exists(obj_alan)) {
        obj_alan.x = 621;
        obj_alan.y = 289;
    }
    if (instance_exists(obj_theo)) {
        obj_theo.x = 705;
        obj_theo.y = 328;
        obj_theo.historico_x = [705];
        obj_theo.historico_y = [328];
    }
        }
    } else if (transicao == 4) {
        alpha_msg = max(alpha_msg - 0.008, 0);
        if (alpha_msg <= 0) {
            transicao = 5;
        }
    } else if (transicao == 5) {
        alpha_preto = max(alpha_preto - 0.008, 0);
        if (alpha_preto <= 0) {
                        transicao = 0;
            em_dialogos5 = true;
            dialogos = dialogos5;
            dialogo_index = 0;
            nome = dialogos[0].nome;
            frase = dialogos[0].frase;
            contador_texto = 0;
            mostrar_texto = true;
            texto_acelerado = false;
            caixadetexto = true;
        }
    }
}

if (dialogo3 && fase3 == 0) {
    fase3 = 1;
}

if (fase3 == 1 && instance_exists(obj_turing)) {
        obj_turing.travado = true;
    obj_turing.sprite_cutscene = true;
    obj_turing.sprite_index = spr_turingesquerda;
    obj_turing.direcao = "esquerda";

    var _dx3 = turing_dest_x - obj_turing.x;
    var _dy3 = turing_dest_y - obj_turing.y;
    var _dist3 = point_distance(0, 0, _dx3, _dy3);

    if (_dist3 <= turing_vel) {
        obj_turing.x = turing_dest_x;
        obj_turing.y = turing_dest_y;
        obj_turing.direcao = "cima";
		 obj_turing.sprite_cutscene = false;
        obj_turing.sprite_index = spr_turingparado;

        fase3 = 2;
        fase = 3;
        dialogos = dialogos3;
        dialogo_index = 0;
        nome = dialogos[0].nome;
        frase = dialogos[0].frase;
        contador_texto = 0;
        mostrar_texto = true;
        texto_acelerado = false;
        caixadetexto = true;
    } else {
        obj_turing.x += _dx3 / _dist3 * turing_vel;
        obj_turing.y += _dy3 / _dist3 * turing_vel;
    }
    obj_turing.depth = -obj_turing.y;
}

if (caixadetexto && instance_exists(obj_turing)) {
    obj_turing.travado = true;
}

if (dialogo1 && fase == 0) {
    fase = 1;
    dialogo_index = 0;
    nome = dialogos[0].nome;
    frase = dialogos[0].frase;
    contador_texto = 0;
    mostrar_texto = true;
    texto_acelerado = false;
    caixadetexto = true;
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