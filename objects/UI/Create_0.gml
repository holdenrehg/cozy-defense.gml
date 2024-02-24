focused_tile = noone;

function set_focus(tile)
{
	if(focused_tile != tile) clear_focus();
	focused_tile = tile;
	with(focused_tile) hovered = true;
}

function clear_focus()
{
	if(focused_tile == noone) return;
	with(focused_tile) hovered = false;
	focused_tile = noone;
}

/**
 * Check if a tower is allowed to be placed onto the given tile.
 *
 * Can only place towers onto tiles that:
 *     1. Don't already have an existing tower.
 *     2. Are grass sprites (not roads).
 */
function can_place(tile)
{
	if(tile == noone) return false;
	return tile.tower == noone and tile.sprite_index == GrassSprite;
}