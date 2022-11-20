focused_tile = noone;

function clear_focus()
{
	if(focused_tile == noone) return;
	with(focused_tile) hover = false;
	focused_tile = noone;
}

function set_focus(tile)
{
	with(tile) hover = true;
	focused_tile = tile;
}