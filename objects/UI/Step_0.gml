var tile = instance_position(mouse_x, mouse_y, Tile);

if(tile == noone)
{
	clear_focus();
}
else if(tile != focused_tile)
{
	clear_focus();
	set_focus(tile);
}
