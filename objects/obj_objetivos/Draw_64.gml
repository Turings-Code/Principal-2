if (texto == "") exit;
if (instance_exists(obj_cutscene1)) { if (obj_cutscene1.caixadetexto) { exit; } }
if (room == rm_menu) exit;

var _popup = instance_exists(obj_mapabletchley) || instance_exists(obj_leitor);

if (_popup) exit;

var _cam = view_camera[0];
var _f = display_get_gui_width() / camera_get_view_width(_cam);

var _x = margem_x * _f;
var _y = margem_y * _f;
//var _escala = (room == rm_salaentrada || room == rm_onibus) ? 1 : 0.7;
var _escala = 0.7;
var _escala_etapa = _escala * 0.7;

draw_set_font(fnt_fonte);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_alpha(alpha * 0.7);
draw_text_transformed(_x, _y, texto, _escala, _escala, 0);

var _linha = string_height("A") * _escala + 8 * _f;
var _linha_etapa = string_height("A") * _escala_etapa + 4 * _f;
var _ey = _y + _linha;

for (var i = 0; i < array_length(etapas); i++) {
    var _etapa_y = _ey + i * _linha_etapa;
    var _t = etapas[i].texto;

    draw_text_transformed(_x + 5 * _f, _etapa_y, _t, _escala_etapa, _escala_etapa, 0);

    if (etapas[i].feita) {
        var _largura = string_width(_t) * _escala_etapa;
        var _meio_y = _etapa_y + string_height(_t) * _escala_etapa * 0.5;
        draw_line_width(_x + 5 * _f, _meio_y, _x + 5 * _f + _largura, _meio_y, 2 * _f);
    }
}

draw_set_alpha(1);