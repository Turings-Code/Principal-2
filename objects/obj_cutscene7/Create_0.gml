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
	{ nome: "Theo", frase: "Ei Alan! Não mexe nisso! Pode ativar algum alarme!" },
	{ nome: "Theo", frase: "Vamos ter que desativar a segurança para pegar o enigma!" }
];

dialogo_index = 0;
nome = dialogos[0].nome;
frase = dialogos[0].frase;
if(global.viuenigma){
	
	if(instance_exists(obj_enigmafala)){
		with(obj_enigmafala){instance_destroy();}}
} else{
	obj_objetivos.define_objetivo(" ");
	audio_play_sound(snd_objetivoconcluido, 1, false);
	}
if(global.chaveseguranca){
	if(instance_exists(obj_chaveseguranca)){
		with(obj_chaveseguranca){instance_destroy();}}
}