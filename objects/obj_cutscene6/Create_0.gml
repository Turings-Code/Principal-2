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