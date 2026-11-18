var _cam = view_camera[0];
var _gw = display_get_gui_width();
var _gh = display_get_gui_height();
var _f = _gw / camera_get_view_width(_cam);

var _cx = _gw / 2;
var _cy = _gh / 2;

var _esc_caixa = 5.5 * _f;
var _caixa_y = 55 * _f;
var _esc_texto = 0.8;

var _nome = string_trim(nome);
var _spr_caixa = spr_caixadefalaalan;

if (_nome == "Mãe") {
    _spr_caixa = spr_caixadefalamae;
} else if (_nome == "Turing") {
    _spr_caixa = spr_caixadefalaturing;
} else if (_nome == "Theo") {
    _spr_caixa = spr_caixadefalatheo;
}

if (caixadetexto) {
    if (fade_caixa < 1) {
        fade_caixa += 0.1;
        if (fade_caixa > 1) {
            fade_caixa = 1;
        }
    }

    draw_sprite_ext(_spr_caixa, 0, _cx, _cy + _caixa_y, _esc_caixa, _esc_caixa, 0, c_white, fade_caixa);
} else {
    fade_caixa = 0;
}

if (caixadetexto && mostrar_texto) {
    var _texto_visivel = string_copy(frase, 1, floor(contador_texto));

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    var _texto_x = _cx - 190 * _f;
    var _texto_y = _cy + _caixa_y + 85 * _f;
    var _texto_largura_max = 590 / _esc_texto;

    draw_set_color(make_color_rgb(137, 141, 155));
    draw_set_font(fnt_fonte);
    draw_text_ext_transformed(_texto_x, _texto_y, _texto_visivel, -1, _texto_largura_max, _esc_texto * _f, _esc_texto * _f, 0);

    draw_set_font(fnt_fonte2);
    draw_text_transformed(_texto_x + 40 * _f, _texto_y - 69 * _f, nome, _esc_texto * _f, _esc_texto * _f, 0);
}

if (finalizando) {
    draw_set_alpha(fade_final);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);
}