if(room==rm_menu){
if(!audio_is_playing(snd_PCini)){
	if(!audio_is_playing(snd_PCmeio)){
	audio_play_sound(snd_PCmeio, 0.1, true);}}
}
if(room!=rm_quarto){
	if(audio_is_playing(snd_backgroundquarto)){
		audio_stop_sound(snd_backgroundquarto);}}