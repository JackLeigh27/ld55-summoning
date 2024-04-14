/// @description Normalize

if(image_xscale == 1 and image_yscale == 1)
	exit;
	
for(var _x = 0; _x < image_xscale; _x++)
{
	for(var _y = 0; _y < image_yscale; _y++)
	{
		var _hole = instance_create_depth(x + _x*32, y + _y*32, 0, obj_hole);
	}
}

instance_destroy();