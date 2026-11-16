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

    if (fase == 2) {
        fase = 3;
        if (instance_exists(obj_objetivos)) {
            audio_play_sound(snd_objetivo, 1, false);
            obj_objetivos.define_objetivo("OBJETIVO - Vá até o portão");
            obj_objetivos.define_etapas([]);
        }
		obj_turing.theosegue=true;
		obj_alan.seguindo=true;
        } else if (fase == 4) {
        fase = 5;
        if (instance_exists(obj_objetivos)) {
            audio_play_sound(snd_objetivo, 1, false);
			obj_turing.theosegue=true;
			obj_alan.seguindo=true;
            obj_objetivos.define_objetivo("OBJETIVO - Descubra como abrir o portão");
            obj_objetivos.define_etapas([]);
        }
    }
	    else if (fase == 6) {
			obj_objetivos.define_objetivo("OBJETIVO - Vá até a Mansão");
			obj_objetivos.define_etapas([]);
        fase = 7;
    }

    if (instance_exists(obj_turing)) {
        obj_turing.travado = false;
    }
}