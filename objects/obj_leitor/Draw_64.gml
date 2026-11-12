var _cam = view_camera[0];
var _cx = camera_get_view_x(_cam);
var _cy = camera_get_view_y(_cam);
var _w = camera_get_view_width(_cam);
var _h = camera_get_view_height(_cam);

var _gw = display_get_gui_width();
var _gh = display_get_gui_height();

draw_set_color(c_black);
draw_set_alpha(image_alpha * escuridao);
draw_rectangle(0, 0, _gw, _gh, false);

draw_set_color(c_white);
draw_set_alpha(image_alpha);

draw_sprite_ext(
    sprite_index,
    image_index,
    (x - _cx) * (_gw / _w),
    (y - _cy) * (_gh / _h),
    image_xscale * (_gw / _w),
    image_yscale * (_gh / _h),
    image_angle,
    image_blend,
    image_alpha
);

draw_set_alpha(1);