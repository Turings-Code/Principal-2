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
ativar = false;

dialogos = [
    { nome: "Mãe", frase: "Garotos! Onde Vocês se meteram?" },
    { nome: "Mãe", frase: "Entrem no carro já!" },
	{ nome: "Alan", frase: "Mãe, a gente foi salvar a tecnologia!" },
	{ nome: "Mãe", frase: "Entra no carro agora!" },
	{ nome: "Alan", frase: "Então até mais, Bletchley Park." },
];

dialogo_index = 0;
nome = dialogos[0].nome;
frase = dialogos[0].frase;

fade_final = 0;
finalizando = false;