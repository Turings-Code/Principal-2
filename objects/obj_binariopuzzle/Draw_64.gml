var _cam = view_camera[0];
var _gw = display_get_gui_width();
var _gh = display_get_gui_height();
var _f = _gw / camera_get_view_width(_cam);

draw_set_color(c_black);
draw_set_alpha(image_alpha * escuridao);
draw_rectangle(0, 0, _gw, _gh, false);
draw_set_alpha(1);
draw_set_color(c_white);

var _gx = (x - camera_get_view_x(_cam)) * _f;
var _gy = (y - camera_get_view_y(_cam)) * _f;

draw_sprite_ext(sprite_index, image_index, _gx, _gy, image_xscale * _f, image_yscale * _f, image_angle, c_white, image_alpha);

draw_set_color(c_red);
draw_set_alpha(0.5);

draw_rectangle(397, 59, 967, 329, false);
draw_rectangle(547, 560, 654, 650, false);
draw_rectangle(690, 564, 800, 647, false);

draw_set_alpha(1);
draw_set_color(c_white);