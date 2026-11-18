if(room==rm_rua){
	image_xscale=6;
	image_yscale=6;
	x=1211; y=637;
	theosegue=true;
	}
if(room==rm_salaentrada){
	image_xscale=8;
	image_yscale=8;
	x=393; y=800;
	global.entrousala=true;
	}
if(room==rm_mansao){
	image_xscale=8;
	image_yscale=8;
	}
if(room==rm_salafinal){
	image_xscale=8;
	image_yscale=8;
	if(global.viuenigma&&!global.chaveseguranca){
		instance_create_depth(1378, 1087, -5000, obj_chaveseguranca);}
	}
if(room!=rm_quarto){
	global.alanjoga=false;}
if(room==rm_onibus){
	image_xscale=7;
	image_yscale=7;
	x=1068; y=397;
	theosegue=false;
	}
if (room == rm_bletchley2 || room == rm_bletchley1 || room == rm_entradabletchley1 || room == rm_entradabletchley2 || room == rm_rua) {
	vel = 7;
    image_blend = make_color_rgb(130, 150, 210);
}
else {
	vel = 8;
    image_blend = c_white;
}
if(room=rm_bletchley2||room==rm_bletchley1||room==rm_entradabletchley1||room==rm_entradabletchley2||room==rm_entradabletchley12){
	image_xscale=7;
	image_yscale=7;
	}
if (instance_exists(obj_trocaroom) && obj_trocaroom.usar_spawn) {
    x = obj_trocaroom.spawn_x;
    y = obj_trocaroom.spawn_y;
    obj_trocaroom.usar_spawn = false;
}
if(room==rm_entradabletchley2){
	obj_turing.theosegue=true;
	obj_alan.seguindo=true;
	}
	
	if (room == rm_mansao && global.perseguicao) {
    with (obj_npc) { instance_destroy(); }
	var _troca = instance_create_layer(1287, 5520, "Instances", obj_troca2);
_troca.image_xscale = 27;
_troca.image_yscale = 7;

var _colisao = instance_create_layer(346, 4963, "Instances", obj_collisionblock);
_colisao.image_xscale = 6;
_colisao.image_yscale = 8;
    with (obj_alan) { instance_destroy(); }

    
}
if(room==rm_entradabletchley2&&global.perseguicao){
	var _obj = instance_create_layer(-6, 1445, "Instances", obj_troca2);
_obj.image_xscale = 12;
_obj.image_yscale = 19;}
if(room==rm_bletchley1&&global.perseguicao){
	if(instance_exists(obj_troca4)){
		with(obj_troca4){instance_destroy();}}
}
if(global.perseguicao){
	global.alanjoga=true;
	if(instance_exists(obj_alan)){
		with(obj_alan){instance_destroy();}}
}
