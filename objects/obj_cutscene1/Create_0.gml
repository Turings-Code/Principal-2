cam_zoom_vel = 0.03;
cam_vel = 0.08;
contador_texto = 0;
letras_por_frame = 0.3;
vel = 0.5;
texto_acelerado = false;
pausa_timer = 0;
fade_caixa = 0;
mostrar_texto = true;
caixadetexto = true;
som_blip_id = -1;
fase = 0;

theo_dest_x = 2726;
theo_dest_y = 1486;
theo_vel = 6;

dialogos = [
    { nome: "Alan", frase: "Então... Até outro dia Theo!" }
];

dialogos2 = [
    { nome: "Mãe", frase: "Aaaaaahh!" },
    { nome: "Alan", frase: "O que aconteceu?" },
    { nome: "Alan", frase: "Preciso dar uma olhada." }
];

dialogo_index = 0;
nome = dialogos[0].nome;
frase = dialogos[0].frase;

dialogos3 = [
    { nome: "Mãe", frase: "Alan, quem é esse cara?" },
    /*{ nome: "Alan", frase: "Senhor Turing?" },
    { nome: "Turing", frase: "Garotos! O que aconteceu?" },
    { nome: "Theo", frase: "Porque você está aqui senhor Turing?" },
	{ nome: "Mãe", frase: "Vocês dois! Porque esse estranho está na nossa casa?" },
	{ nome: "Alan", frase: "Você veio junto com a gente?" },
	{ nome: "Turing", frase: "Droga! O Enigma deve ter me trazido junto para o seu presente." },
	{ nome: "Theo", frase: "E oque fazemos agora?" },
	{ nome: "Turing", frase: "Só uma coisa consegue me transportar de volta, o Enigma." },
	{ nome: "Alan", frase: "É isso! Ainda temos um Enigma aqui! Acho que podemos concertá-lo!" },
	{ nome: "Mãe", frase: "Você está falando daquele caixote quebrado que deixou em cima da cama?" },
	{ nome: "Theo", frase: "Isso Tia! Vamos lá, senhor Turing!" },
	{ nome: "Mãe", frase: "Aquela caixa já estava toda quebrada garotos! Já joguei fora." },
	{ nome: "Alan", frase: "Nãããão! Onde que você jogou?" },
	{ nome: "Mãe", frase: "Pra que esse escândalo filho? O lixeiro já deve ter levado." },
	{ nome: "Theo", frase: "O lixeiro levou? E agora?" },
	{ nome: "Alan", frase: "Como nós achamos outro Enigma?" },
	{ nome: "Turing", frase: "Não podemos ir até Bletchley Park? Aonde estamos?" },
	{ nome: "Alan", frase: "Nós estamos em Wolverton." },
	{ nome: "Turing", frase: "Wolverton? Eu já ouvi falar dessa cidade! Não é muito longe de Bletchley."},
	{ nome: "Mãe", frase: "Vocês querem ir para Bletchley Park? É só agendar uma visita ué." },
	{ nome: "Theo", frase: "Tem como agendar visitas pra lá?" },
	{ nome: "Mãe", frase: "Claro que sim! Sempre tem uns turistas por lá." },
	{ nome: "Alan", frase: "Vamos agendar então! Venha aqui comigo, senhor Turing!" },*/
];

pontos_x = [1625, 2278, 2800, 2838, 3069];
pontos_y = [1370, 1365, 1350, 968, 917];
ponto_atual = 0;
andando_alan = false;
vel_alan = 8;
distancia_alan = 300;

dialogoalan = false;
fase_antes = 0;

dialogos4 = [
    { nome: "Alan", frase: "Fala de exemplo do Alan." },
    { nome: "Turing", frase: "Fala de exemplo do Turing." }
];