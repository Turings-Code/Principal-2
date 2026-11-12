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
	if(fase==1){
		if(!instance_exists(obj_leitoraparece)){
			instance_create_layer(682, 441, "Instances", obj_leitoraparece);}
		audio_play_sound(snd_objetivo, 1, false);
		obj_objetivos.define_objetivo("OBJETIVO - Concerte o Leitor");
		obj_objetivos.define_etapas([
    "- Identifique a função de cada componente do hardware",
    "e concerte o encaixe corretamente",
    "- Passe pela catraca"
]);
	}
    fase = 2;
	
    if (instance_exists(obj_turing)) {
        obj_turing.travado = false;
    }
}