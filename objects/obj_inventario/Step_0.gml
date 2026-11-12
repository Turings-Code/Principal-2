/*if (!variable_instance_exists(id, "dbg_t")) dbg_t = 0;
dbg_t += 1;

if (dbg_t mod 60 == 0 || mouse_check_button_pressed(mb_left)) {
    var _c1 = instance_exists(obj_cutscene1) ? string(obj_cutscene1.caixadetexto) : "sem";
    var _c2 = instance_exists(obj_cutscene2) ? string(obj_cutscene2.caixadetexto) : "sem";
    var _c3 = instance_exists(obj_cutscene3) ? string(obj_cutscene3.caixadetexto) : "sem";
    var _spr = sprite_exists(sprite_index) ? sprite_get_name(sprite_index) : "NENHUM";
    var _msk = sprite_exists(mask_index) ? sprite_get_name(mask_index) : "NENHUM";
    show_debug_message("INV room:" + room_get_name(room) + " spr:" + _spr + " mask:" + _msk
        + " xs:" + string(image_xscale) + " ys:" + string(image_yscale)
        + " x:" + string(x) + " y:" + string(y)
        + " mouse:" + string(mouse_x) + "," + string(mouse_y)
        + " bbox:" + string(bbox_left) + "," + string(bbox_top) + "," + string(bbox_right) + "," + string(bbox_bottom)
        + " sobre:" + string(position_meeting(mouse_x, mouse_y, id))
        + " c1:" + _c1 + " c2:" + _c2 + " c3:" + _c3
        + " aberto:" + string(aberto) + " visible:" + string(visible));
}*/

if (instance_exists(obj_cutscene1) && obj_cutscene1.caixadetexto) exit;
if (instance_exists(obj_cutscene2) && obj_cutscene2.caixadetexto) exit;
if (instance_exists(obj_cutscene3) && obj_cutscene3.caixadetexto) exit;
if (room == rm_introducao || room == rm_menu) exit;

var _popup = instance_exists(obj_leitor);

if (!_popup && mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id)) {
    aberto = !aberto;
    abriu_agora = true;
    audio_play_sound(snd_inventario, 1, false);
}

abriu_agora = false;

var _sobre = position_meeting(mouse_x, mouse_y, id);
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
        var _ix = x + _c * cell_w;
        var _iy = y + _l * cell_h;
        if (point_in_rectangle(mouse_x, mouse_y, _ix, _iy, _ix + cell_w, _iy + cell_h)) {
            _sobre_item = true;
            break;
        }
    }
}

if ((_sobre || _sobre_item) && !_popup) {
    if (instance_exists(obj_cursormouse)) {
        obj_cursormouse.mao = true;
    }
}