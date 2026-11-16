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
	show_debug_message("resetou");
}

room_restart();