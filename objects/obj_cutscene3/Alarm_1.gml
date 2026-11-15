if (!transicao_feita && frase == "É claro que a tecnologia evoluiu muito além do que eu poderia imaginar!") {
    transicao_feita = true;
    caixadetexto = false;
    mostrar_texto = false;
    transicao = 1;
    exit;
}

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

    if (em_dialogos5) {
    em_dialogos5 = false;
    dialogo3 = false;
    fase3 = 3;

    if (instance_exists(obj_objetivos)) {
        audio_play_sound(snd_objetivo, 1, false);
        obj_objetivos.define_objetivo("OBJETIVO - Desça do Ônibus");
        obj_objetivos.define_etapas([]);
    }
} else {
        if (fase3 == 2) {
            dialogo3 = false;
            fase3 = 3;
        } else {
            dialogo1 = false;
        }

        if (fase == 1) {
            if (!instance_exists(obj_leitoraparece)) {
                instance_create_layer(793, 356, "Instances", obj_leitoraparece);
            }
            audio_play_sound(snd_objetivo, 1, false);
            obj_objetivos.define_objetivo("OBJETIVO - Concerte o Leitor");
            obj_objetivos.define_etapas([
                "- Identifique a função de cada componente do hardware",
                "e concerte o encaixe corretamente",
                "- Passe pela catraca"
            ]);
            global.bilhete = true;
            if (instance_exists(obj_inventario)) {
                obj_inventario.nome_item = "Bilhete";
                obj_inventario.ganhouitem = true;
            }
            audio_play_sound(snd_itemnovo, 1, false);
        }
        fase = 2;
    }

    if (instance_exists(obj_turing)) {
        obj_turing.travado = false;
    }
}