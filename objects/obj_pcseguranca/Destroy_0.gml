if (instance_exists(obj_turing)) {
    obj_turing.travado = false;
}

audio_play_sound(snd_objetivoconcluido, 1, false);

global.iniciar_dialogo4 = true;
global.desativouseguranca=true;
obj_objetivos.define_objetivo(" ");