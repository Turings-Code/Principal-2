if (instance_exists(obj_cutscene1) && obj_cutscene1.caixadetexto) exit;
if (instance_exists(obj_cutscene2) && obj_cutscene2.caixadetexto) exit;
if (instance_exists(obj_cutscene3) && obj_cutscene3.caixadetexto) exit;
if (room == rm_introducao || room == rm_menu) exit;

var _popup = instance_exists(obj_leitor) || (instance_exists(obj_cutscene3) && obj_cutscene3.transicao != 0);
var _gw = display_get_gui_width();
var _gh = display_get_gui_height();

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
    draw_text_transformed(_gw / 2, _gh / 2 - aviso_y, "Novo Item: " + nome_item, aviso_escala, aviso_escala, 0);

    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    aviso_y += aviso_vel;
    aviso_alpha -= aviso_fade;
    if (aviso_alpha <= 0) aviso_ativo = false;
}

if (_popup) exit;

cell_w = sprite_get_width(spr_iconemochila) * escala_gui;
cell_h = sprite_get_height(spr_iconemochila) * escala_gui;

if (aberto) {
    draw_sprite_ext(spr_iconemochilaab, 0, margem_x, margem_y, escala_gui, escala_gui, 0, c_white, image_alpha);
} else {
    draw_sprite_ext(spr_iconemochila, 0, margem_x, margem_y, escala_gui, escala_gui, 0, c_white, image_alpha);
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
        draw_sprite_ext(itens[i], 0, margem_x + _col * cell_w, margem_y + _lin * cell_h, escala_gui, escala_gui, 0, c_white, 1);
    }
}