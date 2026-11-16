if(room==rm_menu){
	window_set_cursor(cr_none);
	if(instance_exists(obj_turing)){
		with(obj_turing){instance_destroy();}}
		
		//obj_objetivos.define_objetivo(" ");
//obj_objetivos.define_etapas([]);
}
if(room==rm_quarto){
	window_set_cursor(cr_default);
	alarm[0] = 100;
	obj_turing.travado=true;
}
if(room==rm_entradabletchley1){
	if(global.puzzlebinario){
		if(instance_exists(obj_troca2)){
			with(obj_troca2){instance_destroy();}}
		if(instance_exists(obj_onibus2)){
			with(obj_onibus2){instance_destroy();}}
		if(instance_exists(obj_portaofala)){
			with(obj_portaofala){instance_destroy();}}
			obj_cutscene4.fase=5;
		obj_fundoentrada1.sprite_index=spr_entradabletchley1abre;
		obj_fundoentrada1.image_speed=1;
		if(!instance_exists(obj_troca)){
			var _troca = instance_create_layer(1228, 169, "Instances", obj_troca);
			_troca.image_xscale=28; _troca.image_yscale=16;}
	}
	if(global.entrousala){
		if(instance_exists(obj_onibus2)){
			with(obj_onibus2){instance_destroy();}}
		if(instance_exists(obj_portaofala)){
			with(obj_portaofala){instance_destroy();}}
	}
}
if(room==rm_rua){
	window_set_cursor(cr_default);
}
if(room==rm_introducao){
	window_set_cursor(cr_default);
}
if(room!=rm_menu&&room!=rm_inicio&&room!=rm_introducao){
	if(!instance_exists(obj_turing)){
		instance_create_layer(0, 0, "Instances", obj_turing);}
	if(!instance_exists(obj_trocaroom)){
		instance_create_layer(0, 0, "Instances", obj_trocaroom);}
		}
if(room!=rm_menu&&room!=rm_inicio&&room!=rm_introducao&&room!=rm_quarto){	
	if(!instance_exists(obj_inventario)){
		instance_create_layer(0, 0, "Instances", obj_inventario);}
}
		
if(room==rm_onibus){
	window_set_cursor(cr_default);
	global.alanjoga=false;
}
