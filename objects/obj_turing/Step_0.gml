depth = -y;

var _baixo = global.alanjoga ? spr_alanbaixo : spr_turingbaixo;
var _cima = global.alanjoga ? spr_alancima : spr_turingcima;
var _esquerda = global.alanjoga ? spr_alanesquerda : spr_turingesquerda;
var _direita = global.alanjoga ? spr_alandireita : spr_turingdireita;
var _parado = global.alanjoga ? spr_alanparado : spr_turingparado;
var _parado_cima = global.alanjoga ? spr_alanparadocima : spr_turingparadocima;
var _parado_esquerda = global.alanjoga ? spr_alanparadoesquerda : spr_turingparadoesquerda;
var _parado_direita = global.alanjoga ? spr_alanparadodireita : spr_turingparadodireita;

if (travado) {
    if (!sprite_cutscene) {
        if (direcao == "cima") {
            sprite_index = _parado;
        } else if (direcao == "baixo") {
            sprite_index = _parado_cima;
        } else if (direcao == "esquerda") {
            sprite_index = _parado_esquerda;
        } else if (direcao == "direita") {
            sprite_index = _parado_direita;
        }
    }
    scr_collision_move(0, 0);
    if (audio_is_playing(snd_passosgrama)) audio_stop_sound(snd_passosgrama);
    if (audio_is_playing(snd_passospedra)) audio_stop_sound(snd_passospedra);
    if (audio_is_playing(snd_passosmadeira)) audio_stop_sound(snd_passosmadeira);
    if (audio_is_playing(snd_passostapetes)) audio_stop_sound(snd_passostapetes);
    exit;
}

var move_x = 0;
var move_y = 0;

if (keyboard_check(ord("S"))) {
    move_y = vel;
    sprite_index = _baixo;
    direcao = "cima";
}

if (keyboard_check(ord("W"))) {
    move_y = -vel;
    sprite_index = _cima;
    direcao = "baixo";
}

if (keyboard_check(ord("A"))) {
    move_x = -vel;
    sprite_index = _esquerda;
    direcao = "esquerda";
}

if (keyboard_check(ord("D"))) {
    move_x = vel;
    sprite_index = _direita;
    direcao = "direita";
}

if (move_x != 0 && move_y != 0) {
    move_x *= 0.9;
    move_y *= 0.9;
}

if (move_x == 0 && move_y == 0) {
    if (direcao == "cima") {
        sprite_index = _parado;
    } else if (direcao == "baixo") {
        sprite_index = _parado_cima;
    } else if (direcao == "esquerda") {
        sprite_index = _parado_esquerda;
    } else if (direcao == "direita") {
        sprite_index = _parado_direita;
    }
}

var perto_e = instance_exists(obj_aparecee) && distance_to_object(obj_aparecee) < 80;
var perto_f = instance_exists(obj_aparecef) && distance_to_object(obj_aparecef) < 80;

var mostrar_e = perto_e;
var mostrar_f = perto_f;

if (perto_e && perto_f) {
    var _ae = instance_nearest(x, y, obj_aparecee);
    var _af = instance_nearest(x, y, obj_aparecef);

    if (point_distance(x, y, _ae.x, _ae.y) <= point_distance(x, y, _af.x, _af.y)) {
        mostrar_f = false;
    } else {
        mostrar_e = false;
    }
}

if (mostrar_e) {
    var _ae2 = instance_nearest(x, y, obj_aparecee);
    var _ex = _ae2.x + offset_letrae_x;
    var _ey = _ae2.y + offset_letrae_y;

    if (!instance_exists(obj_letrae)) {
        instance_create_layer(_ex, _ey, "Instances", obj_letrae);
        audio_play_sound(snd_interacao, 0.5, false);
    } else {
        if (obj_letrae.x != _ex || obj_letrae.y != _ey) {
            audio_play_sound(snd_interacao, 0.5, false);
        }
        obj_letrae.fading_out = false;
        obj_letrae.x = _ex;
        obj_letrae.y = _ey;
    }
} else if (instance_exists(obj_letrae)) {
    obj_letrae.fading_out = true;
}

if (mostrar_f) {
    var _af2 = instance_nearest(x, y, obj_aparecef);
    var _fx = _af2.x + offset_letraf_x;
    var _fy = _af2.y + offset_letraf_y;

    if (!instance_exists(obj_letraf)) {
        instance_create_layer(_fx, _fy, "Instances", obj_letraf);
    } else {
        obj_letraf.fading_out = false;
        obj_letraf.x = _fx;
        obj_letraf.y = _fy;
    }
} else if (instance_exists(obj_letraf)) {
    obj_letraf.fading_out = true;
}

scr_collision_move(move_x, move_y);

var _andando = move_x != 0 || move_y != 0;
var _na_grama = place_meeting(x, y, obj_passosgrama);

if (_andando) {
    if (place_meeting(x, y, obj_passosmadeira)) {
        if (audio_is_playing(snd_passosgrama)) audio_stop_sound(snd_passosgrama);
        if (audio_is_playing(snd_passospedra)) audio_stop_sound(snd_passospedra);
        if (audio_is_playing(snd_passostapetes)) audio_stop_sound(snd_passostapetes);

        if (!audio_is_playing(snd_passosmadeira)) {
            audio_play_sound(snd_passosmadeira, 1, true);
        }
    }
    else if (place_meeting(x, y, obj_passostapete)) {
        if (audio_is_playing(snd_passosgrama)) audio_stop_sound(snd_passosgrama);
        if (audio_is_playing(snd_passospedra)) audio_stop_sound(snd_passospedra);
        if (audio_is_playing(snd_passosmadeira)) audio_stop_sound(snd_passosmadeira);

        if (!audio_is_playing(snd_passostapetes)) {
            audio_play_sound(snd_passostapetes, 1, true);
        }
    }
    else if (_na_grama) {
        if (audio_is_playing(snd_passospedra)) audio_stop_sound(snd_passospedra);
        if (audio_is_playing(snd_passosmadeira)) audio_stop_sound(snd_passosmadeira);
        if (audio_is_playing(snd_passostapetes)) audio_stop_sound(snd_passostapetes);

        if (!audio_is_playing(snd_passosgrama)) {
            audio_play_sound(snd_passosgrama, 1, true);
            audio_sound_pitch(snd_passosgrama, 1.5);
            audio_sound_gain(snd_passosgrama, 0.5, 0);
        }
    }
    else {
        if (audio_is_playing(snd_passosgrama)) audio_stop_sound(snd_passosgrama);
        if (audio_is_playing(snd_passosmadeira)) audio_stop_sound(snd_passosmadeira);
        if (audio_is_playing(snd_passostapetes)) audio_stop_sound(snd_passostapetes);

        if (!audio_is_playing(snd_passospedra)) {
            audio_play_sound(snd_passospedra, 1, true);
            audio_sound_gain(snd_passospedra, 0.3, 0);
        }
    }
}
else {
    if (audio_is_playing(snd_passosgrama)) audio_stop_sound(snd_passosgrama);
    if (audio_is_playing(snd_passospedra)) audio_stop_sound(snd_passospedra);
    if (audio_is_playing(snd_passosmadeira)) audio_stop_sound(snd_passosmadeira);
    if (audio_is_playing(snd_passostapetes)) audio_stop_sound(snd_passostapetes);
}