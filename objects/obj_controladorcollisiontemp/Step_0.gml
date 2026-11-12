if (aviso_espera > 0) aviso_espera--;

if (aviso_ativo) {
    aviso_y += aviso_vel;
    aviso_alpha -= aviso_fade;
    if (aviso_alpha <= 0) aviso_ativo = false;
}

if (instance_exists(obj_turing) && aviso_espera <= 0) {
    var _bateu = false;

    with (obj_turing) {
        _bateu = place_meeting(x - 2, y, obj_collisionblocktemp)
              || place_meeting(x + 2, y, obj_collisionblocktemp)
              || place_meeting(x, y - 2, obj_collisionblocktemp)
              || place_meeting(x, y + 2, obj_collisionblocktemp);
    }

    if (_bateu) {
        aviso_ativo = true;
        aviso_y = 0;
        aviso_alpha = 0.8;
        aviso_espera = 180;
    }
}

