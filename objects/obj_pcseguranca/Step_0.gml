if (instance_exists(obj_turing)) {
    obj_turing.travado = true;
}

if (fading_out) {
    image_alpha -= 0.05;
    if (image_alpha <= 0) {
        instance_destroy();
    }
    exit;
}

image_alpha = min(image_alpha + 0.05, 1);

if (image_alpha < 1 || concluido) exit;

keyboard_string = string_digits(keyboard_string);
if (string_length(keyboard_string) > 4) {
    keyboard_string = string_copy(keyboard_string, 1, 4);
}
digitado = keyboard_string;

if (keyboard_check_pressed(vk_enter) && digitado != "") {
    if (digitado == perguntas[pergunta_atual].resposta) {
        audio_play_sound(snd_acertou, 1, false);
        pergunta_atual++;

        if (pergunta_atual >= array_length(perguntas)) {
            concluido = true;
            fading_out = true;
        }
    } else {
        audio_play_sound(snd_errorxerox, 1, false);
    }

    digitado = "";
    keyboard_string = "";
}