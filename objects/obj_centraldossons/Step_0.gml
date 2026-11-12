if(room==rm_quarto){
	if(audio_is_playing(snd_backgroundfinal)){
	if (audio_sound_get_gain(snd_backgroundfinal) <= 0) {
    audio_stop_sound(snd_backgroundfinal);}}}

if (instance_exists(obj_cursor) && (obj_cursor.clicou || obj_cursor.clicou2)) {
    escurecendo = true;
}

if (room == rm_quarto || room != room_anterior_fade) {
    escurecendo = false;
}

room_anterior_fade = room;

if (escurecendo) {
    alpha_escuro = min(alpha_escuro + 0.02, 1);
} else {
    alpha_escuro = max(alpha_escuro - 0.02, 0);
}

