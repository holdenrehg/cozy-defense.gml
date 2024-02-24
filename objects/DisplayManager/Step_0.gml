var map_controller = instance_find(MapController, 0);
if(map_controller.gameover) return; // stop interactions with the map if game over

var camera = view_camera[0];

// |-----------------------------------------------------------------------------------
// | Left Button Mouse Dragging
// |-----------------------------------------------------------------------------------

if(mouse_check_button_pressed(mb_left))
{
	anchor_x = mouse_x;
	anchor_y = mouse_y;
}

if(mouse_check_button(mb_left))
{
	var xdelta = mouse_x - anchor_x;
	var ydelta = mouse_y - anchor_y;
	
	camera_set_view_pos(
		camera,
		camera_get_view_x(camera) - xdelta,
		camera_get_view_y(camera) - ydelta
	);
}

// |-----------------------------------------------------------------------------------
// | Scroll Wheel Zoom
// |-----------------------------------------------------------------------------------

var zoom_factor = 0.04;

if(mouse_wheel_up())
{
	camera_set_view_size(
		camera,
		camera_get_view_width(camera) * (1 - zoom_factor),
		camera_get_view_height(camera) * (1 - zoom_factor)
	);
}

if(mouse_wheel_down())
{
	camera_set_view_size(
		camera,
		camera_get_view_width(camera) * (1 + zoom_factor),
		camera_get_view_height(camera) * (1 + zoom_factor)
	);
}
