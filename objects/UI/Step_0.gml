// |-----------------------------------------------------------------------------------
// | Check For Hover
// |-----------------------------------------------------------------------------------

var tile = instance_position(mouse_x, mouse_y, Tile);

if(tile == noone)
{
	clear_focus();
}
else
{
	set_focus(tile);
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
			Tower, 
			{sprite_index: WizardTowerLevel1Sprite}
		);
	}
}
