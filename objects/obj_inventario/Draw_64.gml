if (instance_exists(obj_cutscene1) && obj_cutscene1.caixadetexto) exit;
if (instance_exists(obj_cutscene2) && obj_cutscene2.caixadetexto) exit;
if (instance_exists(obj_cutscene3) && obj_cutscene3.caixadetexto) exit;
if (room == rm_introducao || room == rm_menu) exit;

var _popup = instance_exists(obj_leitor);

var _cam = view_camera[0];
var _vx = camera_get_view_x(_cam);
var _vy = camera_get_view_y(_cam);
var _vw = camera_get_view_width(_cam);
var _gw = display_get_gui_width();
var _gh = display_get_gui_height();
var _f = _gw / _vw;

if (ganhouitem) {
    ganhouitem = false;
    aviso_ativo = true;
    aviso_y = 0;
    aviso_alpha = 0.8;
}

if (aviso_ativo) {
    draw_set_font(fnt_fonte);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_set_alpha(aviso_alpha);
    draw_text_transformed(_gw / 2, _gh / 2 - aviso_y * _f, "Novo Item: " + nome_item, aviso_escala * _f, aviso_escala * _f, 0);

    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    aviso_y += aviso_vel;
    aviso_alpha -= aviso_fade;
    if (aviso_alpha <= 0) aviso_ativo = false;
}

if (_popup) exit;

var _esc = image_xscale;

cell_w = sprite_get_width(spr_iconemochila) * _esc;
cell_h = sprite_get_height(spr_iconemochila) * _esc;

var _gx = (x - _vx) * _f;
var _gy = (y - _vy) * _f;
var _ge = _esc * _f;

if (aberto) {
    draw_sprite_ext(spr_iconemochilaab, 0, _gx, _gy, _ge, _ge, 0, c_white, image_alpha);
} else {
    draw_sprite_ext(spr_iconemochila, 0, _gx, _gy, _ge, _ge, 0, c_white, image_alpha);
}

if (aberto) {
    for (var i = 0; i < array_length(itens); i++) {
        var _col, _lin;
        if (i < 4) {
            _col = 0;
            _lin = i + 1;
        } else {
            _col = 1;
            _lin = i - 4;
        }
        draw_sprite_ext(itens[i], 0, _gx + _col * cell_w * _f, _gy + _lin * cell_h * _f, _ge, _ge, 0, c_white, 1);
    }
}