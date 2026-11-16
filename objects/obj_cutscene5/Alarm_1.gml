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
    dialogo1 = false;
    fase = 2;
	audio_play_sound(snd_objetivo, 1, false);
	obj_binarioaparece.pode2=true;
	obj_objetivos.define_objetivo("OBJETIVO - Reinicie o sistema");
	obj_objetivos.define_etapas([
                "- Transcreva os dígitos para binário",
				"- Aperte o botão para abrir o portão",
            ]);
			
		instance_destroy();
    if (instance_exists(obj_turing)) {
        obj_turing.travado = false;
    }
}