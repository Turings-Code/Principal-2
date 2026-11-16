if (instance_exists(obj_cutscene1) && obj_cutscene1.caixadetexto) exit;
if (instance_exists(obj_cutscene2) && obj_cutscene2.caixadetexto) exit;
if (instance_exists(obj_cutscene3) && obj_cutscene3.caixadetexto) exit;
if (instance_exists(obj_cutscene4) && obj_cutscene4.caixadetexto) exit;
if (instance_exists(obj_cutscene5) && obj_cutscene5.caixadetexto) exit;
if (room == rm_introducao || room == rm_menu) exit;

var _popup = instance_exists(obj_leitor) || (instance_exists(obj_cutscene3) && obj_cutscene3.transicao != 0)
|| (instance_exists(obj_folhabinarios)) || (instance_exists(obj_mapabletchley));

var _bl = array_get_index(itens, spr_iconebilhete);
if (global.bilhete && _bl == -1 && array_length(itens) < max_slots) {
    array_push(itens, spr_iconebilhete);
}
else if (!global.bilhete && _bl != -1) {
    array_delete(itens, _bl, 1);
}

cell_w = sprite_get_width(spr_iconemochila) * escala_gui;
cell_h = sprite_get_height(spr_iconemochila) * escala_gui;

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

var _sobre = point_in_rectangle(_mx, _my, margem_x, margem_y, margem_x + cell_w, margem_y + cell_h);
var _sobre_item = false;

if (aberto) {
    for (var _k = 0; _k < array_length(itens); _k++) {
        var _c, _l;
        if (_k < 4) {
            _c = 0;
            _l = _k + 1;
        } else {
            _c = 1;
            _l = _k - 4;
        }
        var _ix = margem_x + _c * cell_w;
        var _iy = margem_y + _l * cell_h;
        if (point_in_rectangle(_mx, _my, _ix, _iy, _ix + cell_w, _iy + cell_h)) {
            _sobre_item = true;
            break;
        }
    }
}

if (!_popup && mouse_check_button_pressed(mb_left) && _sobre) {
    aberto = !aberto;
    audio_play_sound(snd_inventario, 1, false);
}

if ((_sobre || _sobre_item) && !_popup) {
    if (instance_exists(obj_cursormouse)) {
        obj_cursormouse.mao = true;
    }
}