depth=-y;
var _fundo = layer_background_get_id(layer_get_id("Background"));
var _spr_fundo = layer_background_get_sprite(_fundo);

if (_spr_fundo == spr_mansaofundoligado) {
    sprite_index = spr_mesacomputadoracesa;
} else if (_spr_fundo == spr_mansaofundodesligado) {
    sprite_index = spr_mesacomputador;
}