if(room==rm_rua){
	image_xscale=6;
	image_yscale=6;
	x=1211; y=637;
	theosegue=true;
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
    image_blend = make_color_rgb(130, 150, 210);
}
else {
    image_blend = c_white;
}
if(room=rm_bletchley2||room==rm_bletchley1||room==rm_entradabletchley1||room==rm_entradabletchley2){
	image_xscale=7;
	image_yscale=7;
	}
if (instance_exists(obj_trocaroom) && obj_trocaroom.usar_spawn) {
    x = obj_trocaroom.spawn_x;
    y = obj_trocaroom.spawn_y;
    obj_trocaroom.usar_spawn = false;
}