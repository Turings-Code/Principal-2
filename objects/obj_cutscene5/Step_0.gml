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
    var _w = camera_get_view_width(_cam);
    var _h = camera_get_view_height(_cam);

    var _centro_x = camera_get_view_x(_cam) + _w / 2;
    var _centro_y = camera_get_view_y(_cam) + _h / 2;

    _w = lerp(_w, 1170, cam_zoom_vel);
    _h = lerp(_h, 660, cam_zoom_vel);

    if (abs(_w - 1170) < 0.5) _w = 1170;
    if (abs(_h - 660) < 0.5) _h = 660;

    camera_set_view_size(_cam, _w, _h);
    camera_set_view_pos(_cam, _centro_x - _w / 2, _centro_y - _h / 2);
}