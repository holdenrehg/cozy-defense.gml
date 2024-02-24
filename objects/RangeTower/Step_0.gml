// look for an enemy within distance
var attack_range = 400;
var attack_strength = 1;
var attack_speed = 1500; // ms

var nearest_enemy = instance_nearest(x, y, Enemy);
if(!instance_exists(nearest_enemy)) return;

if(point_distance(x, y, nearest_enemy.x, nearest_enemy.y) <= attack_range)
{
	if(current_time - time_since_last_attack > attack_speed)
	{
		// in range, fire!
		instance_create_depth(
			x, y,
			-9999,
			Bullet,
			{target: nearest_enemy, attack_strength: attack_strength}
		);
		time_since_last_attack = current_time;
	}
}