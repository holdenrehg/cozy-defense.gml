var tile = instance_position(mouse_x, mouse_y, Tile);

if(tile == noone)
{
	clear_focus();
}
else
{
	set_focus(tile);
}
