if (fading_out) {
    image_alpha -= 0.05;
    if (image_alpha <= 0) {
        instance_destroy();
    }
    exit;
}

image_alpha = min(image_alpha + 0.05, 1);

if (image_alpha < 1) exit;

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);
var _clicando = mouse_check_button(mb_left);
var _clicou = mouse_check_button_pressed(mb_left);

var _sobre1 = point_in_rectangle(_mx, _my, botao1[0], botao1[1], botao1[2], botao1[3]);
var _sobre0 = point_in_rectangle(_mx, _my, botao0[0], botao0[1], botao0[2], botao0[3]);
var _sobre_final = point_in_rectangle(_mx, _my, area_final[0], area_final[1], area_final[2], area_final[3]);
var _sobre_instrucao = point_in_rectangle(_mx, _my, area_instrucao[0], area_instrucao[1], area_instrucao[2], area_instrucao[3]);
var _sobre_pular = point_in_rectangle(_mx, _my, area_pular[0], area_pular[1], area_pular[2], area_pular[3]);

if (instance_exists(obj_folhabinarios)) {
    exit;
}

if (_sobre_instrucao || _sobre_pular) {
    if (instance_exists(obj_cursormouse)) {
        obj_cursormouse.mao = true;
    }

    if (_clicou) {
        if (_sobre_instrucao) {
            instance_create_depth(0, 0, depth - 1, obj_folhabinarios);
            exit;
        } else {
            fading_out = true;
            exit;
        }
    }
}
if (!concluido) {
    image_index = 0;

           if (_sobre1) {
        image_index = _clicando ? 4 : 2;
    } else if (_sobre0) {
        image_index = _clicando ? 3 : 1;
    }

    if ((_sobre1 || _sobre0) && instance_exists(obj_cursormouse)) {
        obj_cursormouse.mao = true;
    }

    if (_clicou && (_sobre1 || _sobre0)) {
        digitado += _sobre1 ? "1" : "0";

        var _certa = respostas[pergunta_atual];

        if (string_length(digitado) >= string_length(_certa)) {
            if (digitado == _certa) {
                audio_play_sound(snd_acertou, 1, false);
                digitado = "";
                pergunta_atual++;

                if (pergunta_atual >= array_length(numeros)) {
                    concluido = true;
                    reiniciado = true;
                    image_index = 0;
                    if (instance_exists(obj_objetivos)) {
                        obj_objetivos.define_objetivo("OBJETIVO - Reinicie o sistema");
                        obj_objetivos.define_etapas([
                            { texto: "- Transcreva os dígitos", feita: true },
							{ texto: "para binário", feita: true },
                            "- Aperte o botão para",
							"abrir o portão",
                        ]);
                    }
                }
            } else {
                audio_play_sound(snd_errorxerox, 1, false);
                digitado = "";
            }
        }
    }
} else {
    image_index = 0;

    if (_sobre_final) {
        image_index = _clicando ? 7 : 6;

        if (instance_exists(obj_cursormouse)) {
            obj_cursormouse.mao = true;
        }

        if (_clicou) {
            fading_out = true;
        }
    }
}