with (obj_diagolopercebeu) {
    caixadetexto = false;
    mostrar_texto = false;
    frase = "Nada";
    ja_falou = false;
    tela_agendada = false;
    fade_caixa = 0;
    contador_texto = 0;
    texto_acelerado = false;
    pausa_timer = 0;
    ativo = false;
    numero_npc = 0;
}
if(room==rm_mansao){
	obj_turing.x=1348;
	obj_turing.y=5270;
	obj_turing.theosegue=false;
	obj_alan.seguindo=false;
}

room_restart();