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
    { nome: "Turing", frase: "Aqui está o Enigma!" },
    { nome: "Alan", frase: "Droga! Ele está trancado nessa vitrine!" },
	{ nome: "Theo", frase: "Acho melhor não mexer nisso! Pode ativar algum alarme!" },
	{ nome: "Theo", frase: "Vamos ter que desativar a segurança para pegar o enigma!" }
];
obj_alan.seguindo=true;
dialogo_index = 0;
nome = dialogos[0].nome;
frase = dialogos[0].frase;
if(global.viuenigma){
	
	if(instance_exists(obj_enigmafala)){
		with(obj_enigmafala){instance_destroy();}}
} 
if(global.chaveseguranca){
	if(instance_exists(obj_chaveseguranca)){
		with(obj_chaveseguranca){instance_destroy();}}
}
if(global.desativouseguranca){
	instance_create_layer(1406, 2420, "Instances", obj_enigmafalafinal);}
	
	dialogos2 = [
    { nome: "Alan", frase: "Chegamos! A trava não parece mais estar ativa!" },
    { nome: "Theo", frase: "Então é isso! Conseguimos! Agora é só abrir o Enigma!" },
	{ nome: "Turing", frase: "Antes disso, muito obrigado por o que fizeram até aqui." },
	{ nome: "Turing", frase: "Gostaria de ficar mais um pouco, mas tenho que voltar ao meu presente." },
	{ nome: "Theo", frase: "Boa sorte senhor Turing! Não deixe de inventar mais coisas importantes!" },
	{ nome: "Alan", frase: "Até Alan Turing!" },
	{ nome: "Turing", frase: "Só conseguimos enxergar um pouco a frente," },
	{ nome: "Turing", frase: "mas há muito que precisa ser feito." }
];

dialogo2_feito = false;
em_dialogo2 = false;

transicao = 0;
alpha_preto = 0;