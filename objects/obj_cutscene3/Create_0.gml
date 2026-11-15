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

dialogo3 = false;
fase3 = 0;
turing_dest_x = 552;
turing_dest_y = 320;
turing_vel = 4;

dialogos3 = [
    { nome: "Alan", frase: "Caramba! Você conseguiu!" },
	/*{ nome: "Turing", frase: "Isso é fascinante!" },
	{ nome: "Turing", frase: "Como conseguiram reunir tantas funções em componentes tão pequenos?" },
	{ nome: "Theo", frase: "Pesquisei e descobri que alguns princípios desses computadores" },
	{ nome: "Theo", frase: "têm relação com seus estudos." },
	{ nome: "Turing", frase: "Meus estudos? Está falando da Máquina de Turing?" },
	{ nome: "Theo", frase: "Exatamente!" },
	{ nome: "Theo", frase: "Seu modelo teórico ajudou a estabelecer fundamentos da computação moderna." },
	{ nome: "Theo", frase: "Até a ideia de armazenar informações lembra alguns conceitos da sua máquina." },
	{ nome: "Turing", frase: "Incrível! Essa memória RAM me lembra a fita da minha máquina!" },*/
	{ nome: "Turing", frase: "É claro que a tecnologia evoluiu muito além do que eu poderia imaginar!" },
	{ nome: "Turing", frase: "No que mais eu influenciei no mundo atual?" }
	
];

transicao = 0;
transicao_feita = false;
alpha_preto = 0;
alpha_msg = 0;
timer_trans = 0;

dialogos5 = [
    { nome: "Turing", frase: "É aqui! Essa é a entrada principal que mais fica perto da Mansão!" },
	{ nome: "Turing", frase: "Ela era sempre usada para transporte de funcionários e serviços." },
	{ nome: "Alan", frase: "Vamos descer então!" },
    { nome: "Theo", frase: "Meu pai vai me matar quando eu chegar em casa hoje..." }
];

em_dialogos5 = false;