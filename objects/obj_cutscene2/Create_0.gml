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

pontos_x = [680];
pontos_y = [664];
ponto_atual = 0;
andando_alan = true;
vel_alan = 8;
distancia_alan = 300;
onibus_andando = false;
tocou=false;

dialogos = [
    { nome: "Alan", frase: "O próximo ônibus deve chegar daqui alguns minutos." },
    { nome: "Theo", frase: "Alan, como você planeja entrar lá essas horas?" },
	{ nome: "Alan", frase: "Já sabemos como é o local, só precisamos passar pela segurança." },
	{ nome: "Turing", frase: "Garotos, se Bletchley Park ainda é como na minha época," },
	{ nome: "Turing", frase: "Não vai ser fácil entrar lá sem ser percebido." },
	{ nome: "Theo", frase: "Vou pesquisar se ainda está aberto agora..." },
	{ nome: "Theo", frase: "Eita! O que aconteceu com meu celular? Ele simplesmente desligou!" },
	{ nome: "Alan", frase: "Nós precisamos nos apressar!" },
	{ nome: "Alan", frase: "Ah! Ai está o ônibus! Vamos senhor Turing!" },
];

dialogo_index = 0;
nome = dialogos[0].nome;
frase = dialogos[0].frase;