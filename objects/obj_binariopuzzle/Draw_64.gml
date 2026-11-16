var _cam = view_camera[0];
var _gw = display_get_gui_width();
var _gh = display_get_gui_height();
var _f = _gw / camera_get_view_width(_cam);

draw_set_color(c_black);
draw_set_alpha(image_alpha * escuridao);
draw_rectangle(0, 0, _gw, _gh, false);
draw_set_alpha(1);
draw_set_color(c_white);

var _gx = (x - camera_get_view_x(_cam)) * _f;
var _gy = (y - camera_get_view_y(_cam)) * _f;

draw_sprite_ext(sprite_index, image_index, _gx, _gy, image_xscale * _f, image_yscale * _f, image_angle, c_white, image_alpha);

var _a = area_texto;
var _indice = min(pergunta_atual, array_length(numeros) - 1);

draw_set_font(fnt_fonte);
draw_set_color(c_white);
draw_set_alpha(image_alpha);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _larg = _a[2] - _a[0];
var _meio_x = (_a[0] + _a[2]) / 2;

var _pergunta = reiniciado ? "Sistema Reiniciado!" : "Converta " + string(numeros[_indice]) + " para binário";
draw_text_ext(_meio_x, _a[1] + 90, _pergunta, -1, _larg - 40);

if (!reiniciado) {
    var _txt = (digitado == "") ? "Resposta" : digitado;
    draw_set_alpha(image_alpha * ((digitado == "") ? 0.5 : 1));
    draw_text(_meio_x, _a[3] - 50, _txt);
}

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);