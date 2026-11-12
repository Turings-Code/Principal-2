dialogo_index += 1;

if (dialogo_index < array_length(dialogos)) {
    nome = dialogos[dialogo_index].nome;
    frase = dialogos[dialogo_index].frase;
    contador_texto = 0;
    mostrar_texto = true;
    texto_acelerado = false;
} else {
    caixadetexto = false;
    mostrar_texto = false;

    if (fase == 0) {
        fase = 1;
    } else if (fase == 3) {
        fase = 4;

        if (instance_exists(obj_turing)) {
            obj_turing.travado = false;
        }

        if (instance_exists(obj_objetivos)) {
            audio_play_sound(snd_objetivo, 1, false);
            obj_objetivos.define_objetivo("OBJETIVO - Descubra oque aconteceu");
			obj_turing.direcao="cima";
			obj_turing.sprite_index=spr_turingparado;
        }
    }
	
	    else if (fase == 5) {
    fase = 6;
    andando_alan = true;
    obj_objetivos.define_objetivo("OBJETIVO - Siga o Alan");
    if (instance_exists(obj_turing) && instance_exists(obj_turingcutscene)) {
        var _tx = obj_turing.x;
        var _ty = obj_turing.y;
        obj_turing.x = obj_turingcutscene.x;
        obj_turing.y = obj_turingcutscene.y;
        if (instance_exists(obj_turingcutscene)) {
            with (obj_turingcutscene) { instance_destroy(); }
        }
        if (!instance_exists(obj_alan)) {
            instance_create_layer(_tx, _ty, "Instances", obj_alan);
        }
    }

    global.alanjoga = false;
}
}