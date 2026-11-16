if (aviso_ativo) {
    var _cam = view_camera[0];
    var _cx = camera_get_view_x(_cam) + camera_get_view_width(_cam) / 2;
    var _cy = camera_get_view_y(_cam) + camera_get_view_height(_cam) - 120 - aviso_y;

    draw_set_font(fnt_fonte);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_set_alpha(aviso_alpha);
	if(room==rm_quarto){
    draw_text_transformed(_cx, _cy, "Siga o Alan!", aviso_escala, aviso_escala, 0);}
	else if(room==rm_entradabletchley1){
    draw_text_transformed(_cx, _cy, "Conclue seu Objetivo Primeiro!", aviso_escala, aviso_escala, 0);}
	else if(room==rm_entradabletchley2){
    draw_text_transformed(_cx, _cy, "Caminho Errado!", aviso_escala, aviso_escala, 0);}
	else if(room==rm_mansao){
    draw_text_transformed(_cx, _cy, "Item Necessário: Chave de Segurança", aviso_escala, aviso_escala, 0);}
	else{
		if(!audio_is_playing(snd_portatrancada)){
			audio_play_sound(snd_portatrancada, 1, false);}
	draw_text_transformed(_cx, _cy, "Oi rodrigo, se vc está lendo isso deu bug aqui em", aviso_escala, aviso_escala, 0);}

    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}