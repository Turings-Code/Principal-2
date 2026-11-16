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

dialogos = [
	{ nome: "Turing", frase: "Achei! Isso aqui deve abrir abrir o portão!" },
    { nome: "Sistema", frase: "Sistema falhando, reinicialização necessária." },
    { nome: "Turing", frase: "Droga, a tecnologia está falhado em todos os lugares!" },
	{ nome: "Sistema", frase: "Reinicialização manual disponível." },
	{ nome: "Turing", frase: "Acho que vou ter que resolver isso manualmente então.." },
];

dialogo_index = 0;
nome = dialogos[0].nome;
frase = dialogos[0].frase;