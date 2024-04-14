/// @description Initialize game

// Setup required game objects
instance_create_depth(x,y,depth,obj_display_manager);
instance_create_depth(x,y,depth,obj_entity_manager);
instance_create_depth(x,y,depth,obj_input_manager);

scr_game_start();

show_debug_overlay(false);

high_score = 0;

randomize();