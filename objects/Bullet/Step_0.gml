if(!instance_exists(target))
{
	// if the enemy is already dead, self destruct after so many seconds
	// based on `max_life`
	if(current_time - start_time >= max_life)
	{
		instance_destroy();
	}
	return;
};

var target_x = target.x;
var target_y = target.y;
var move_speed = 5;

if(point_distance(x, y, target_x, target_y) < 5)
{
	target.hitpoints = max(target.hitpoints - attack_strength, 0);
	instance_destroy();
}
else
{
	move_towards_point(target_x, target_y, move_speed);
}