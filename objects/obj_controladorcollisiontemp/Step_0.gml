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

if (room == rm_entradabletchley1) {
    if (instance_exists(obj_cutscene4) && obj_cutscene4.fase >= 2 && !blocos_criados4) {
        blocos_criados4 = true;
        blocos_inst4 = [];

        for (var i = 0; i < array_length(blocos_def4); i++) {
            var _d4 = blocos_def4[i];
            var _b4 = instance_create_layer(_d4[0], _d4[1], "Instances", obj_collisionblocktemp);
            _b4.image_xscale = _d4[2];
            _b4.image_yscale = _d4[3];
            array_push(blocos_inst4, _b4);
        }
    }
}