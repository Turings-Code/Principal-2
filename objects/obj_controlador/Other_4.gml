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
if(room==rm_introducao){
	window_set_cursor(cr_default);
}