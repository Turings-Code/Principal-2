if (dialogoalan) {
    dialogoalan = false;
    if (!caixadetexto) {
        fase_antes = fase;
        fase = 8;
        dialogos = dialogos4;
        dialogo_index = 0;
        nome = dialogos[0].nome;
        frase = dialogos[0].frase;
        contador_texto = 0;
        mostrar_texto = true;
        texto_acelerado = false;
        caixadetexto = true;
    }
}

if (caixadetexto) {
    obj_turing.travado = true;
}

if (fase == 6) {
    if (!instance_exists(obj_alan)) {
        fase = 7;
    } else if (andando_alan) {
        var _px = pontos_x[ponto_atual];
        var _py = pontos_y[ponto_atual];
        var _dx = _px - obj_alan.x;
        var _dy = _py - obj_alan.y;
        var _dist = point_distance(obj_alan.x, obj_alan.y, _px, _py);

        if (abs(_dx) > abs(_dy)) {
            obj_alan.sprite_index = (_dx > 0) ? spr_alandireita : spr_alanesquerda;
        } else {
            obj_alan.sprite_index = (_dy > 0) ? spr_alanbaixo : spr_alancima;
        }

        if (_dist <= vel_alan) {
            obj_alan.x = _px;
            obj_alan.y = _py;
            andando_alan = false;
            obj_alan.sprite_index = spr_alanparado;

            if (ponto_atual == array_length(pontos_x) - 1) {
                with (obj_alan) {
                    instance_destroy();
                }
                var _fundo = layer_background_get_id(layer_get_id("Background"));
                layer_background_sprite(_fundo, spr_cenarioquartoalan);
                fase = 7;
            }
        } else {
            var _dir = point_direction(obj_alan.x, obj_alan.y, _px, _py);
            obj_alan.x += lengthdir_x(vel_alan, _dir);
            obj_alan.y += lengthdir_y(vel_alan, _dir);
        }

        if (instance_exists(obj_alan)) {
            obj_alan.depth = -obj_alan.y;
        }
    } else if (instance_exists(obj_turing)) {
        if (point_distance(obj_alan.x, obj_alan.y, obj_turing.x, obj_turing.y) <= distancia_alan) {
            ponto_atual += 1;
            andando_alan = true;
        }
    }
}

if (fase == 4 && instance_exists(obj_turing) && obj_turing.x < 1364) {
    fase = 5;
    dialogos = dialogos3;
    dialogo_index = 0;
    nome = dialogos[0].nome;
    frase = dialogos[0].frase;
    contador_texto = 0;
    mostrar_texto = true;
    texto_acelerado = false;
    caixadetexto = true;
}

if (fase == 1) {
    if (instance_exists(obj_theo)) {
        var _dx = theo_dest_x - obj_theo.x;
        var _dy = theo_dest_y - obj_theo.y;
        var _dist = point_distance(0, 0, _dx, _dy);
        obj_theo.sprite_index = spr_theobaixo;

        if (_dist <= theo_vel) {
            with (obj_theo) {
                instance_destroy();
            }
            fase = 2;
            alarm[0] = game_get_speed(gamespeed_fps) * 3;
        } else {
            obj_theo.x += _dx / _dist * theo_vel;
            obj_theo.y += _dy / _dist * theo_vel;
        }
    } else {
        fase = 2;
        alarm[0] = game_get_speed(gamespeed_fps) * 3;
    }
}

var _falando = (mostrar_texto && contador_texto < string_length(frase) && pausa_timer <= 0 && caixadetexto);

if (_falando) {
    if (!audio_is_playing(snd_textblip)) {
        som_blip_id = audio_play_sound(snd_textblip, 10, true);
    }
    if (texto_acelerado) {
        audio_sound_pitch(som_blip_id, 1.2);
    } else {
        audio_sound_pitch(som_blip_id, 1);
    }
} else {
    if (audio_is_playing(snd_textblip)) {
        audio_stop_sound(snd_textblip);
    }
}

if (caixadetexto) {
    var _cam = view_camera[0];
    var _alvo = noone;
    var _fixo = false;

    if (fase == 8) {
        if (nome == "Alan") {
            _fixo = true;
        } else if (nome == "Turing" && instance_exists(obj_turing)) {
            _alvo = obj_turing;
        } else if (nome == "Theo" && instance_exists(obj_theo)) {
            _alvo = obj_theo;
        }
    } else if (fase == 5) {
        if (nome == "Turing" && instance_exists(obj_turingcutscene)) {
            _alvo = obj_turingcutscene;
        } else if (nome == "Theo" && instance_exists(obj_theocutscene)) {
            _alvo = obj_theocutscene;
        } else if (nome == "Mãe" && instance_exists(obj_mae)) {
            _alvo = obj_mae;
        } else if (nome == "Alan" && instance_exists(obj_turing)) {
            _alvo = obj_turing;
        }
    } else if (nome == "Alan" && instance_exists(obj_turing)) {
        _alvo = obj_turing;
    } else if (nome == "Mãe" && instance_exists(obj_mae)) {
        _alvo = obj_mae;
    }

    var _w = camera_get_view_width(_cam);
    var _h = camera_get_view_height(_cam);

    var _centro_x = camera_get_view_x(_cam) + _w / 2;
    var _centro_y = camera_get_view_y(_cam) + _h / 2;

    var _w_alvo = (_alvo != noone || _fixo) ? 1170 : 1365;
    var _h_alvo = (_alvo != noone || _fixo) ? 660 : 770;

    _w = lerp(_w, _w_alvo, cam_zoom_vel);
    _h = lerp(_h, _h_alvo, cam_zoom_vel);

    if (abs(_w - _w_alvo) < 0.5) _w = _w_alvo;
    if (abs(_h - _h_alvo) < 0.5) _h = _h_alvo;

    if (_fixo) {
        _centro_x = lerp(_centro_x, 3163, cam_vel);
        _centro_y = lerp(_centro_y, 858, cam_vel);
    } else if (_alvo != noone) {
        _centro_x = lerp(_centro_x, (_alvo.bbox_left + _alvo.bbox_right) / 2, cam_vel);
        _centro_y = lerp(_centro_y, (_alvo.bbox_top + _alvo.bbox_bottom) / 2, cam_vel);
    }

    camera_set_view_size(_cam, _w, _h);
    camera_set_view_pos(_cam, _centro_x - _w / 2, _centro_y - _h / 2);
}