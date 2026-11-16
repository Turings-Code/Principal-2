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
    fase = 1;

    if (instance_exists(obj_objetivos)) {
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