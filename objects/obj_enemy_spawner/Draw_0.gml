/// @description Draw

sprite_index = object_get_sprite(enemy_type);
shader_set(choose(shd_enemy_spawner_blue,shd_enemy_spawner_white,shd_enemy_spawner_pink));

var _percent = alarm[0] / spawn_duration;

//draw_sprite_part_ext(sprite_index,0,0,sprite_height*_percent,sprite_width,sprite_height-sprite_height*_percent,x-sprite_xoffset*SCALE_BASE,y-sprite_yoffset*SCALE_BASE,SCALE_BASE,SCALE_BASE,image_blend,image_alpha);
draw_sprite_part_ext(sprite_index,0,0,sprite_height*_percent,sprite_width,sprite_height-sprite_height*_percent,x-sprite_xoffset*SCALE_BASE,y+sprite_height*_percent*SCALE_BASE-sprite_yoffset*SCALE_BASE,SCALE_BASE,SCALE_BASE,image_blend,image_alpha);

shader_reset();