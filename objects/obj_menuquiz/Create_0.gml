image_xscale = 4.6;
image_yscale = 4.6;
image_speed = 0;
image_index = 0;
depth = -3010;
fade_speed = 0.1;

areapergunta = [442, 90, 927, 233];

areas = [
    [94, 324, 414, 454],
    [186, 531, 508, 662],
    [951, 320, 1271, 453],
    [858, 536, 1179, 667]
];

rodadas = [
    {
        pergunta: "Qual componente conecta todos os outros e permite que funcionem juntos?",
        alts: ["Placa-mãe", "Fonte de energia", "Cooler", "Cabo HDMI"],
        correta: 0,
        motivo: "A placa-mãe é a placa onde todos os componentes são conectados e se comunicam."
    },
    {
        pergunta: "Onde ficam guardados o sistema e os dados do leitor, mesmo com ele desligado?",
        alts: ["Memória RAM", "SSD", "CPU", "Módulo NFC"],
        correta: 1,
        motivo: "O SSD guarda os dados de forma permanente, e eles não se perdem ao desligar."
    },
    {
        pergunta: "Qual componente guarda temporariamente os dados que o leitor está usando agora?",
        alts: ["SSD", "Placa-mãe", "Memória RAM", "Módulo NFC"],
        correta: 2,
        motivo: "A RAM é uma memória rápida e temporária, apagada quando o leitor desliga."
    },
    {
        pergunta: "Qual componente lê o cartão do bilhete único por aproximação?",
        alts: ["CPU", "Memória RAM", "Placa-mãe", "Módulo NFC"],
        correta: 3,
        motivo: "O módulo NFC capta o sinal do cartão quando ele é aproximado do leitor."
    },
    {
        pergunta: "Qual componente processa as informações e decide se o saldo libera a catraca?",
        alts: ["Módulo NFC", "CPU", "SSD", "Placa-mãe"],
        correta: 1,
        motivo: "A CPU é o processador, responsável por executar os cálculos e tomar as decisões."
    }
];

rodada_atual = 0;
rodadas_completas = 0;
estado = 0;
menu_vis = 0;
acertou = false;
timer = 0;
pausa_acerto = 30;
pausa_erro = 240;
texto_escala = 0.8;
erro_escala = 5.6;
erro_margem = 40;
erro_vis = 0;
motivo_texto = "";

if (instance_exists(obj_leitor)) {
    obj_leitor.image_speed = 0;
    obj_leitor.image_index = 0;
}

desenha_texto_area = function(_txt, _x1, _y1, _x2, _y2, _escmax, _centro) {
    var _w = _x2 - _x1;
    var _h = _y2 - _y1;
    var _e = _escmax;

    while (_e > 0.15 && string_height_ext(_txt, -1, _w / _e) * _e > _h) {
        _e -= 0.05;
    }

    if (_centro) {
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_text_ext_transformed((_x1 + _x2) / 2, (_y1 + _y2) / 2, _txt, -1, _w / _e, _e, _e, 0);
    } else {
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        draw_text_ext_transformed(_x1, _y1, _txt, -1, _w / _e, _e, _e, 0);
    }
};