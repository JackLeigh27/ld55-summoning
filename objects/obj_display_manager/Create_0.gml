/// @description Initialize display system

view_width = GAME_WIDTH;
view_height = GAME_HEIGHT;

view_scale = GAME_SCALE;

window_set_size(view_width * view_scale, view_height * view_scale);
window_center();

surface_resize(application_surface, view_width * view_scale, view_height * view_scale);