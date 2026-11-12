if(room==rm_quarto){
	if(!audio_is_playing(snd_backgroundquarto)){
	audio_play_sound(snd_backgroundquarto, 1, true);}
	if(audio_is_playing(snd_backgroundfinal)){
	audio_sound_gain(snd_backgroundfinal, 0, 3000);}
	if (audio_sound_get_gain(snd_backgroundfinal) <= 0) {
    audio_stop_sound(snd_backgroundfinal);
}
	}
if(room==rm_introducao){
	if(!audio_is_playing(snd_backgroundfinal)){
	audio_play_sound(snd_backgroundfinal, 1, true);}
}