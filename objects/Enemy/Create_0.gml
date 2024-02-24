target_index = 0;
time_since_last_attack = current_time;
hitpoints = 12;

/**
 * Fetch the current target that the enemy needs to move towards.
 *
 * @return struct|undefined
 *     ex. {row: 2, column: 2}
 */
function current_target()
{
	if(target_index < array_length(path))
	{
		return path[target_index];
	}
	
	return undefined;
}

function next_target()
{
	if(target_index < array_length(path))
	{
		target_index += 1;
	}
}