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

dialogos = [
    { nome: "Turing", frase: "Chegamos! Só precisamos encontrar algum enigma agora." },
    { nome: "Alan", frase: "Vamos logo!" }
];

dialogo_index = 0;
nome = dialogos[0].nome;
frase = dialogos[0].frase;

if (variable_global_exists("viuenigma") && global.viuenigma) {
    caixadetexto = false;
    mostrar_texto = false;
    dialogo_index = array_length(dialogos) - 1;
    alarm[1] = 1;
}

dialogos2 = [
    { nome: "Alan", frase: "É aqui! Esse lugar está meio escuro né?" },
    { nome: "Theo", frase: "Deve ter algum interruptor por aqui." }
];
dialogo2_feito = false;
em_dialogo2 = false;

dialogos3 = [
    { nome: "Turing", frase: "Caramba, que tecnologia fascinante!" },
    { nome: "Theo", frase: "Vamos nos apressar, antes que alguém nos veja!" },
	{ nome: "Alan", frase: "Deve dar pra usar algum computador pra desativar a segurança." },
];

dialogo3_feito = false;
em_dialogo3 = false;

dialogos4 = [
    { nome: "Turing", frase: "Consegui! Agora devemos conseguir pegar o Enigma!" },
    { nome: "Theo", frase: "Vamos voltar até lá então!" }
];

dialogo4_feito = false;
em_dialogo4 = false;