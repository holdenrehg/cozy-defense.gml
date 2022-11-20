focused_tile = noone;

function set_focus(tile)
{
	if(focused_tile != tile) clear_focus();
	focused_tile = tile;
	with(focused_tile) hovered = true;
}

function clear_focus()
{
	with(focused_tile) hovered = false;
	focused_tile = noone;
}