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
if(!global.puzzlebinario&&!global.entrousala){
obj_turing.travado=true;}
onibus_vel = 0;
onibus_vel_max = 12;
onibus_acel = 0.05;

if(global.entrousala){fase=5;
	obj_turing.theosegue=true;
	obj_alan.seguindo=true;
	}
dialogos = [
    { nome: "Turing", frase: "Geralmente aqui era bastante movimentado." },
	{ nome: "Turing", frase: "Tinham vários seguranças, afinal era um local secreto." },
	{ nome: "Alan", frase: "Como vamos entrar por aqui?" },
	{ nome: "Turing", frase: "Deve ter um portão logo acima." },
];

dialogo_index = 0;
nome = dialogos[0].nome;
frase = dialogos[0].frase;

dialogos2 = [
    { nome: "Alan", frase: "O portão está fechado!" },
    { nome: "Theo", frase: "Achou que estaria aberto, Alan?" },
	{ nome: "Alan", frase: "Deve ter algum controle que faça o portão abrir." },
	{ nome: "Turing", frase: "Preciso achar alguma maneira de abrir o portão." },
];
dialogo2_feito = false;
dialogo2 = false;

dialogos3 = [
    { nome: "Alan", frase: "Fala de exemplo do Alan." },
    { nome: "Turing", frase: "Fala de exemplo do Turing." }
];
dialogo3_feito = false;
