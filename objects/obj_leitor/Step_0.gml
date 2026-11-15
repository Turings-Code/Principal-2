// fecha apertando E (depois do delay, e só se não estiver já fechando)
if (delay > 0) {
    delay -= 1;
} 

// fade
if (fading_out) {
    image_alpha -= fade_speed;
    if (image_alpha <= 0) {
        instance_destroy();
    }
} else {
    image_alpha += fade_speed;
    if (image_alpha > 1) {
        image_alpha = 1;
    }
}

if (position_meeting(mouse_x, mouse_y, id)&&sprite_index==spr_leitorfechado) {
    obj_cursormouse.mao = true;
}
if (position_meeting(mouse_x, mouse_y, id)&&sprite_index==spr_leitorabriu&&!instance_exists(obj_menuquiz)) {
    obj_cursormouse.mao = true;
}
if (position_meeting(mouse_x, mouse_y, id)&&sprite_index==spr_leitorabre&&image_index>=17) {
    obj_cursormouse.mao = true;
}