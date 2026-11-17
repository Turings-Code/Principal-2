if (keyboard_check_pressed(ord("E")) && instance_exists(obj_letrae) && instance_exists(obj_turing)) {
    if (point_distance(x, y, obj_turing.x, obj_turing.y) < 250) {

	if (instance_exists(obj_inventario)) {
    obj_inventario.nome_item = "Chave de Segurança";
    obj_inventario.ganhouitem = true;
	global.chaveseguranca=true;
}
obj_objetivos.define_objetivo("OBJETIVO - Desative a Segurança");
obj_objetivos.define_etapas([
    { texto: " - Ache a Chave de Segurança", feita: true },
    " - Passe pelo Sistema de Segurança",
    "e desative"
]);
audio_play_sound(snd_objetivoconcluido, 1, false);
audio_play_sound(snd_itemnovo, 1, false);
	instance_destroy();
    }
}
depth=obj_turing.depth+1;