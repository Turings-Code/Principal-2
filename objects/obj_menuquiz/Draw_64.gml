var _gw = display_get_gui_width();
var _gh = display_get_gui_height();
var _f = _gw / camera_get_view_width(view_camera[0]);
var _cinza = make_color_rgb(137, 141, 155);

draw_set_font(fnt_fonte3);
draw_set_color(c_white);

if (estado < 2 && menu_vis > 0) {
	
   draw_sprite_ext(sprite_index, image_index, _gw / 2, _gh / 2, image_xscale, image_yscale, 0, c_white, menu_vis);

    var _rod = rodadas[min(rodada_atual, array_length(rodadas) - 1)];
    var _ap = areapergunta;

    draw_set_color(_cinza);
    draw_set_alpha(menu_vis);

    desenha_texto_area(_rod.pergunta, _ap[0], _ap[1], _ap[2], _ap[3], texto_escala, true);

    for (var i = 0; i < array_length(areas); i++) {
        var _r = areas[i];
        desenha_texto_area(_rod.alts[i], _r[0], _r[1], _r[2], _r[3], texto_escala, true);
    }
}

if (estado == 2 && !acertou && erro_vis > 0) {
        var _es = erro_escala;
    var _sw = sprite_get_width(spr_porquerrou) * _es;
    var _sh = sprite_get_height(spr_porquerrou) * _es;
    var _m = erro_margem;

    draw_sprite_ext(spr_porquerrou, 0, _gw / 2, _gh / 2, _es, _es, 0, c_white, erro_vis);

    draw_set_color(_cinza);
    draw_set_alpha(erro_vis);
    desenha_texto_area(
        motivo_texto,
        _gw / 2 - _sw / 2 + _m, _gh / 2 - _sh / 2 + _m,
        _gw / 2 + _sw / 2 - _m, _gh / 2 + _sh / 2 - _m,
        texto_escala, true
    );
}

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);