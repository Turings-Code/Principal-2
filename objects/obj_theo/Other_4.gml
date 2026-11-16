if (room == rm_bletchley2 || room == rm_bletchley1 || room == rm_entradabletchley1 || room == rm_entradabletchley2 || room == rm_rua) {
	if(room!=rm_rua){
		image_xscale=7;
		image_yscale=7;}
    image_blend = make_color_rgb(130, 150, 210);
}
else {
    image_blend = c_white;
}
if(room==rm_mansao){
	image_xscale=8;
	image_yscale=8;
	}