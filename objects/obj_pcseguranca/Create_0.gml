image_xscale = 4.6;
image_yscale = 4.6;
image_speed = 0;
image_alpha = 0;
fading_out = false;
escuridao = 0.7;

area_tela = [300, 163, 1085, 494];

perguntas = [
    { sequencia: "2, 4, 8, 16, ?", resposta: "32" },
    { sequencia: "1, 4, 9, 16, 25, ?", resposta: "36" },
	{ sequencia: "2, 3, 5, 7, 11, ?", resposta: "13" },
    { sequencia: "1, 1, 2, 3, 5, 8, ?", resposta: "13" },
	{ sequencia: "1, 2, 6, 24, 120, ?", resposta: "720" },
];

pergunta_atual = 0;
digitado = "";
concluido = false;
keyboard_string = "";