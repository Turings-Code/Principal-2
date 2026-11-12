cam_zoom_vel = 0.03;
cam_vel = 0.08;
contador_texto = 0;
letras_por_frame = 0.3;
vel = 0.5;
texto_acelerado = false;
pausa_timer = 0;
fade_caixa = 0;
mostrar_texto = false;
caixadetexto = false;
som_blip_id = -1;
fase = 0;
dialogo1 = false;
obj_objetivos.define_objetivo("OBJETIVO - Fale com Alan");
audio_play_sound(snd_objetivoconcluido, 1, false);
dialogos = [
    { nome: "Alan", frase: "Droga! O meu bilhete não está funcionando!" },
    { nome: "Theo", frase: "Você está com saldo?" },
	{ nome: "Alan", frase: "Não é isso, o leitor não parece estar funcionado! " },
	{ nome: "Turing", frase: "Deixa eu dar uma olhada nisso." },
];

dialogo_index = 0;
nome = dialogos[0].nome;
frase = dialogos[0].frase;