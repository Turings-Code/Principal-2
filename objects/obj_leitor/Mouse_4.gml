if(sprite_index==spr_leitorfechado){
	sprite_index=spr_leitorabre;}
if(sprite_index==spr_leitorabre){
	sprite_index=spr_leitorabriu}
if(sprite_index==spr_leitorabriu){
	if(!instance_exists(obj_menuquiz)){
	instance_create_layer(0, 0, "Instances", obj_menuquiz);}}