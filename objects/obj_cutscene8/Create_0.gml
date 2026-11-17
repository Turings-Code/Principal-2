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
    { nome: "Alan", frase: "Caramba! Ele desapareceu!" },
    { nome: "Theo", frase: "Bom, acho que dessa vez deu tudo certo." },
	{ nome: "Theo", frase: "Alan, melhor sairmos daqui logo." },
];

dialogo_index = 0;
nome = dialogos[0].nome;
frase = dialogos[0].frase;
global.perseguicao=true;