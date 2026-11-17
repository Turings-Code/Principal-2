var _cam = view_camera[0];
var _gw = display_get_gui_width();
var _gh = display_get_gui_height();

draw_set_color(c_black);
draw_set_alpha(image_alpha * escuridao);
draw_rectangle(0, 0, _gw, _gh, false);
draw_set_alpha(1);
draw_set_color(c_white);

draw_sprite_ext(sprite_index, 0, _gw / 2, _gh / 2, image_xscale, image_yscale, 0, c_white, image_alpha);

var _a = area_tela;
var _meio_x = (_a[0] + _a[2]) / 2;
var _indice = min(pergunta_atual, array_length(perguntas) - 1);

draw_set_font(fnt_fonte);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_set_alpha(image_alpha);

draw_text_transformed(_meio_x, _a[1] + 40, "Pergunta " + string(_indice + 1) + " de " + string(array_length(perguntas)), 0.8, 0.8, 0);

draw_text_transformed(_meio_x, _a[1] + 110, "Qual o próximo valor da sequência?", 0.8, 0.8, 0);

draw_text_transformed(_meio_x, _a[1] + 190, perguntas[_indice].sequencia, 0.9, 0.9, 0);

var _barra = ((current_time div 500) mod 2 == 0) ? "|" : " ";
var _txt = (digitado == "") ? "Resposta" : digitado + _barra;

draw_set_alpha(image_alpha * ((digitado == "") ? 0.5 : 1));
draw_text_transformed(_meio_x, _a[3] - 50, _txt, 0.9, 0.9, 0);

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);