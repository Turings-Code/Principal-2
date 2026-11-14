 
if(room==rm_rua){
	image_xscale=6;
image_yscale=6;} 
else if(room==rm_onibus){
	image_xscale=7;
image_yscale=7;}
else{
	image_xscale=8;
image_yscale=8;}
velocidade = 6;
atraso_passos = 25;
distancia_minima = 140;



historico_x = array_create(0, 0);
historico_y = array_create(0, 0);
direcao_theo = "baixo";
sprite_index = spr_theoparado;

grade = -1;
grade_room = -1;
grade_timer = 0;
cel = 64;
margem_grade = 50;
caminho = path_add();
caminho_ok = false;
caminho_timer = 0;	
usando_caminho = false;
grade_fino = -1;
margem_fina = 8;