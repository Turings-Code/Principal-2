draw_set_font(fnt_fonte);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_set_alpha(alpha_texto);
draw_text(display_get_gui_width() / 2, display_get_gui_height() / 2, "Após uma longa jornada...");
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);