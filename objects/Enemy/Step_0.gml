// ----------------------------------------------------------------------------
// Check Health
// ----------------------------------------------------------------------------

if(hitpoints <= 0)
{
	instance_destroy();
	return;
}

// ----------------------------------------------------------------------------
// Attacking
// ----------------------------------------------------------------------------

var castle = instance_find(Castle, 0);
var attack_range = 200;
var attack_strength = 1;
var attack_speed = 2000; // ms

if(point_distance(x, y, castle.x, castle.y) < attack_range)
{
	// close enough to attack the castle
	if(current_time - time_since_last_attack > attack_speed)
	{
		castle.hitpoints = max(castle.hitpoints - attack_strength, 0);
		time_since_last_attack = current_time;
		return; // stop moving if close enough to attack
	}
}

// ----------------------------------------------------------------------------
// Movement
// ----------------------------------------------------------------------------

var target = current_target();
if(target == undefined)
{
	speed = 0; // since we are using move_towards_point
	return; // no where to go!
}

var map_controller = instance_find(MapController, 0);
var tile = map_controller.get_tile(target.row, target.column);
var target_x = tile.x;
var target_y = tile.y - (tile.sprite_height / 4);
var move_speed = 1;

if(point_distance(x, y, target_x, target_y) < 2)
{
	// we are close, move on to the next target
	next_target();
}
else
{
	move_towards_point(target_x, target_y, move_speed);
}
