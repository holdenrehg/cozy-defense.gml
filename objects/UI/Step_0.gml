var map_controller = instance_find(MapController, 0);
if(map_controller.gameover)
{
	if(keyboard_check_released(vk_space))
	{
		map_controller.reset();
	}
	return; // stop interactions with the map if game over
}

// |-----------------------------------------------------------------------------------
// | Check For Hover
// |-----------------------------------------------------------------------------------

var tile = instance_position(mouse_x, mouse_y, Tile);

if(can_place(tile))
{
	set_focus(tile);
}
else
{
	clear_focus();
}

// |-----------------------------------------------------------------------------------
// | Check For Click
// |-----------------------------------------------------------------------------------

if(mouse_check_button_pressed(mb_left) and focused_tile)
{
	with(focused_tile)
	{
		tower = instance_create_depth(
			x, y, 
			depth, 
			RangeTower, 
			{sprite_index: WizardTowerLevel1Sprite}
		);
	}
}
