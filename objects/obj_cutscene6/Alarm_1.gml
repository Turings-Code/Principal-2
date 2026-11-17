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
	    if (em_dialogo2) {
        em_dialogo2 = false;

        if (instance_exists(obj_objetivos)) {
            audio_play_sound(snd_objetivo, 1, false);
            obj_objetivos.define_objetivo("OBJETIVO - Ligue a Luz");
            obj_objetivos.define_etapas([]);
        }

        if (!instance_exists(obj_interruptor)) {
            instance_create_layer(2318, 864, "Instances", obj_interruptor);
        }

        if (instance_exists(obj_turing)) {
            obj_turing.travado = false;
        }
        exit;
    }
	if (em_dialogo3) {
    em_dialogo3 = false;
    if (instance_exists(obj_turing)) {
        obj_turing.travado = false;
    }
	instance_create_layer(2692, 1045, "Instances", obj_pcaparece);
	audio_play_sound(snd_objetivo, 1, false);
	obj_objetivos.define_objetivo("OBJETIVO - Desative a Segurança");
            obj_objetivos.define_etapas([]);
    exit;
}
if (em_dialogo4) {
    em_dialogo4 = false;
	if (instance_exists(obj_objetivos)) {
    obj_objetivos.define_objetivo("OBJETIVO - Volte até o Enigma");
    obj_objetivos.define_etapas([]);
	obj_turing.theosegue=true;
	obj_alan.seguindo=true;
}
    if (instance_exists(obj_turing)) {
        obj_turing.travado = false;
    }
    exit;
}
    fase = 1;

    if (instance_exists(obj_objetivos)&&!global.viuenigma) {
        audio_play_sound(snd_objetivo, 1, false);
        obj_objetivos.define_objetivo("OBJETIVO - Encontre o Enigma");
        obj_objetivos.define_etapas([]);
    }

    if (instance_exists(obj_turing)) {
        obj_turing.theosegue = true;
        obj_turing.travado = false;
    }
    if (instance_exists(obj_alan)) {
        obj_alan.seguindo = true;
    }
}