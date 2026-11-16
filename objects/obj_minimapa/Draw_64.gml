if (room != rm_entradabletchley2 && room != rm_bletchley1 && room != rm_bletchley2) exit;
if (instance_exists(obj_cutscene1) && obj_cutscene1.caixadetexto) exit;
if (instance_exists(obj_cutscene2) && obj_cutscene2.caixadetexto) exit;
if (instance_exists(obj_cutscene3) && obj_cutscene3.caixadetexto) exit;
if (instance_exists(obj_cutscene4) && obj_cutscene4.caixadetexto) exit;
if (room == rm_introducao || room == rm_menu) exit;

var _spr;

if (room == rm_entradabletchley2) {
    _spr = spr_minimapaentrada2;
} else if (room == rm_bletchley1) {
    _spr = spr_minimapabletchley1;
} else if (room == rm_bletchley2) {
    _spr = spr_minimapabletchley2;
}

var _base_w = instance_exists(obj_viewport) ? obj_viewport.cam_width : camera_get_view_width(view_camera[0]);
var _k = display_get_gui_width() / _base_w;

var _tam = tam * _k;
var _esc = esc * _k;
var _gx = display_get_gui_width() - _tam - margem * _k;
var _gy = margem * _k;

draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(_gx, _gy, _gx + _tam, _gy + _tam, false);
draw_set_color(c_white);

if (instance_exists(obj_turing)) {
    var _sw = sprite_get_width(_spr);
    var _sh = sprite_get_height(_spr);

    var _alvo_x = obj_turing.x * _sw / room_width;
    var _alvo_y = obj_turing.y * _sh / room_height;

    if (!iniciado) {
        suave_x = _alvo_x;
        suave_y = _alvo_y;
        iniciado = true;
    }

    suave_x = lerp(suave_x, _alvo_x, vel_lerp);
    suave_y = lerp(suave_y, _alvo_y, vel_lerp);

    var _l = clamp(suave_x - vis / 2, 0, _sw - vis);
    var _t = clamp(suave_y - vis / 2, 0, _sh - vis);

    draw_sprite_part_ext(_spr, 0, _l, _t, vis, vis, _gx, _gy, _esc, _esc, c_white, 0.9);

    var _px = _gx + clamp((_alvo_x - _l) * _esc, 0, _tam);
    var _py = _gy + clamp((_alvo_y - _t) * _esc, 0, _tam);

    draw_sprite_ext(spr_pontomapa, 0, _px, _py, _esc, _esc, 0, c_white, 0.9);
    draw_sprite_ext(spr_bordamapa, 0, _gx, _gy, _esc, _esc, 0, c_white, 1);
}

draw_set_font(fnt_fonte3);
draw_set_color(c_white);
draw_set_alpha(0.9);
draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_text_transformed(_gx + _tam - 20 * _k, _gy + _tam + 10 * _k, "Bletchley Park", 0.6 * _k, 0.6 * _k, 0);

draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

