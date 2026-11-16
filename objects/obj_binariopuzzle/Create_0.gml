image_xscale=5.6;
image_yscale=5.6;

image_alpha = 0;
fade_speed = 0.1;
fading_out = false;
delay = 10; 

escuridao = 0.7;
obj_objetivos.define_objetivo("OBJETIVO - Reinicie o sistema");
                        obj_objetivos.define_etapas([
                            "- Transcreva os dígitos",
							"para binário",
                            "- Aperte o botão para",
							"abrir o portão",
                        ]);

area_texto = [397, 59, 967, 329];
botao1 = [547, 560, 654, 650];
botao0 = [690, 564, 800, 647];

numeros = [5, 10, 13, 7, 18, 25, 30];
respostas = [];
for (var i = 0; i < array_length(numeros); i++) {
    var _n = numeros[i];
    var _b = "";
    while (_n > 0) {
        _b = string(_n mod 2) + _b;
        _n = _n div 2;
    }
    array_push(respostas, _b);
}

pergunta_atual = 0;
digitado = "";
concluido = false;

image_speed = 0;
image_index = 0;
area_final = [428, 619, 538, 704];
reiniciado = false;

area_instrucao = [1020, 0, 1354, 344];
area_pular = [1030, 365, 1342, 462];