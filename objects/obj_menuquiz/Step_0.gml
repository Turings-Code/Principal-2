if (estado == 0) {
    menu_vis = min(menu_vis + fade_speed, 1);
}
else if (estado == 1) {
    menu_vis -= fade_speed;
    if (menu_vis <= 0) {
        menu_vis = 0;
        estado = 2;
        timer = acertou ? pausa_acerto : pausa_erro;
    }
}
else if (estado == 2) {
    erro_vis = acertou ? 0 : min(erro_vis + fade_speed, 1);
    timer--;
    if (timer <= 0) {
        erro_vis = 0;
        if (acertou) rodada_atual++;

        if (rodada_atual >= array_length(rodadas)) {
            estado = 3;
            timer = 90;
        } else {
            estado = 0;
        }
    }
}
else if (estado == 3) {
    timer--;
    if (timer <= 0) {
        if (instance_exists(obj_objetivos)) {
			audio_play_sound(snd_objetivoconcluido, 1, false);
            obj_objetivos.define_objetivo("OBJETIVO - Concerte o Leitor");
            obj_objetivos.define_etapas([
                { texto: "- Identifique a função de cada componente do hardware", feita: true },
                { texto: "e concerte o encaixe corretamente", feita: true },
                "- Passe pela catraca"
            ]);
			instance_create_layer(793, 356, "Instances", obj_passacatraca);
        }
		if(instance_exists(obj_leitor)){
			with(obj_leitor){instance_destroy();}}
        instance_destroy();
        exit;
    }
}

var _gx = device_mouse_x_to_gui(0);
var _gy = device_mouse_y_to_gui(0);
var _frame_menu = 0;

if (estado == 0 && menu_vis >= 1) {
    var _clicada = -1;

    for (var i = 0; i < array_length(areas); i++) {
        var _r = areas[i];
        if (point_in_rectangle(_gx, _gy, _r[0], _r[1], _r[2], _r[3])) {
            _clicada = i;
            _frame_menu = i + 1;
            break;
        }
    }

    if (_clicada != -1) {
        if (instance_exists(obj_cursormouse)) {
            obj_cursormouse.mao = true;
        }

        if (mouse_check_button_pressed(mb_left)) {
            var _rod = rodadas[rodada_atual];
            acertou = (_clicada == _rod.correta);

            if (acertou) {
                rodadas_completas++;
                audio_play_sound(snd_acertou, 1, false);
                if (instance_exists(obj_leitor)) {
                    obj_leitor.image_index = min(rodadas_completas, obj_leitor.image_number - 1);
                }
            } else {
                motivo_texto = "A alternativa certa é: " + _rod.alts[_rod.correta] + "\n" + _rod.motivo;
                audio_play_sound(snd_errorxerox, 1, false);
            }
            estado = 1;
        }
    }
}

image_index = _frame_menu;