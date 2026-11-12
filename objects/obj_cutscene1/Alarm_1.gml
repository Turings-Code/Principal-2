dialogo_index += 1;

if (dialogo_index < array_length(dialogos)) {
    nome = dialogos[dialogo_index].nome;
    frase = dialogos[dialogo_index].frase;
    contador_texto = 0;
    mostrar_texto = true;
    texto_acelerado = false;
} else {
	if(fase!=0){
	obj_turing.travado=false;}
    caixadetexto = false;
    mostrar_texto = false;

    if (fase == 0) {
        fase = 1;
    } else if (fase == 3) {
        fase = 4;

        if (instance_exists(obj_turing)) {
            obj_turing.travado = false;
        }
		if(!instance_exists(obj_theo)){
			instance_create_layer(1017, 1362, "Instances", obj_theo);}
        if (instance_exists(obj_objetivos)) {
            audio_play_sound(snd_objetivo, 1, false);
            obj_objetivos.define_objetivo("OBJETIVO - Descubra oque aconteceu");
			obj_turing.direcao="cima";
			obj_turing.sprite_index=spr_turingparado;
			obj_mae.x=1213; obj_mae.y=997;
        }
    }
	
	    else if (fase == 5) {
    fase = 6;
    andando_alan = true;
	audio_play_sound(snd_objetivo, 1, false);
    obj_objetivos.define_objetivo("OBJETIVO - Siga o Alan");
    if (instance_exists(obj_turing) && instance_exists(obj_turingcutscene)) {
        var _tx = obj_turing.x;
        var _ty = obj_turing.y;
        obj_turing.x = obj_turingcutscene.x;
        obj_turing.y = obj_turingcutscene.y;
		obj_turing.theosegue=true;
        if (instance_exists(obj_turingcutscene)) {
            with (obj_turingcutscene) { instance_destroy(); }
        }
        if (!instance_exists(obj_alan)) {
            instance_create_layer(_tx, _ty, "Instances", obj_alan);
        }
		if (!instance_exists(obj_falaalan1)) {
            instance_create_layer(3077, 907, "Instances", obj_falaalan1);
        }
    }

    global.alanjoga = false;
}
    else if (fase == 8) {
		var _fundo = layer_background_get_id(layer_get_id("Background"));
                layer_background_sprite(_fundo, spr_cenarioquarto2);
				if(!instance_exists(obj_alan)){
		instance_create_layer(3035, 857, "Instances", obj_alan);}
		audio_play_sound(snd_objetivo, 1, false);
		obj_objetivos.define_objetivo("OBJETIVO - Siga o Alan");
		var _troca = instance_create_layer(656, 1468, "Instances", obj_troca);
_troca.image_xscale = 5;
_troca.image_yscale = 14;
                fase = 9;
        andando_alan2 = true;
    }
}