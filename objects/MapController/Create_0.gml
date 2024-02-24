TILE_INDEX = {
	tile0: undefined,
	tile1: GrassSprite,
	tile2: Road1Sprite,
	tile3: Road2Sprite,
	tile4: Road3Sprite,
	tile5: Road4Sprite,
};

tiles = []; // populated by draw_map, stores Tile instances
gameover = false;

function draw_map()
{
	var tile_layout = make_map_layout();
	var tile_width = 240;
	var tile_height = 138;
	var castle_position = {x: 11, y: 13};
	
	for(var row = 0; row < array_length(tile_layout); row++)
	{
		for(var column = 0; column < array_length(tile_layout[row]); column++)
		{
			var tile_index = "tile" + string(tile_layout[row][column]);
			var sprite = variable_struct_get(TILE_INDEX, tile_index);
			
			if(sprite == undefined) continue;
			
			var tile = instance_create_depth(
				200 + (tile_width / 2 * column),
				200 + (tile_height / 2 * row),
				-row,
				Tile,
				{
					sprite_index: sprite,
				}
			);
			
			tiles[row][column] = tile;
			
			if(row == 13 and column == 11)
			{
				with(tile)
				{
					tower = instance_create_depth(
						x, y, 
						depth, 
						Castle, 
						{sprite_index: CastleSprite}
					);
				}
			}
		}
	}
}

/**
 * Generates a map layout array.
 *
 * Returns a 2D array of integers where each number references
 * a sprite index. This represents where each tile is going to
 * be placed in the map.
 *
 * For example, a 0 will represent nothing while a 1 may
 * reference a grass tile.
 */
function make_map_layout()
{
	return [
		[0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 1, 0, 2, 0, 1, 0, 0, 0, 0, 0, 0],
		[0, 1, 0, 1, 0, 2, 0, 1, 0, 0, 0, 0, 0],
		[1, 0, 1, 0, 1, 0, 2, 0, 1, 0, 0, 0, 0],
		[0, 1, 0, 1, 0, 1, 0, 2, 0, 1, 0, 0, 0],
		[0, 0, 1, 0, 1, 0, 1, 0, 2, 0, 1, 0, 0],
		[0, 0, 0, 1, 0, 1, 0, 1, 0, 2, 0, 1, 0],
		[0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 3, 0, 1],
		[0, 0, 0, 0, 0, 1, 0, 1, 0, 5, 0, 1, 0],
		[0, 0, 0, 0, 0, 0, 1, 0, 4, 0, 1, 0, 1],
		[0, 0, 0, 0, 0, 0, 0, 1, 0, 2, 0, 1, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 2, 0, 1],
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
	];
}

function get_tile(row, column)
{
	return tiles[row][column];
}

/**
 * Rebuilds this map again. Acts like resetting the level.
 */
function reset()
{
	instance_destroy(Tile);
	instance_destroy(Castle);
	instance_destroy(Tower);
	instance_destroy(Enemy);
	
	tiles = [];
	enemies_spawned = 0;
	
	draw_map();
	gameover = false;
}

// ----------------------------------------------------------------------------
// Spawner Code
// ----------------------------------------------------------------------------

enemies_spawned = 0;
enemies_to_spawn = 10;
last_spawn_time = current_time;
spawn_speed = 5000; // ms
spawn_speed_variation = 1200;
spawn_location = {row: 1, column: 3};
enemy_path = [
	{row: 2, column: 4},
	{row: 3, column: 5},
	{row: 4, column: 6},
	{row: 5, column: 7},
	{row: 6, column: 8},
	{row: 7, column: 9},
	{row: 8, column: 10},
	{row: 9, column: 9},
	{row: 10, column: 8},
	{row: 11, column: 9},
	{row: 12, column: 10},
];

function spawn()
{
	// enemies are spawned if we haven't reached `enemies_to_spawn` and
	// we haven't spawned any in the last `spawn_speed` ms
	if(
		enemies_to_spawn - enemies_spawned > 0 and 
		current_time - last_spawn_time >= spawn_speed + random_range(-spawn_speed_variation, spawn_speed_variation)
	) {
		var tile = get_tile(spawn_location.row, spawn_location.column);
		instance_create_depth(
			tile.x, tile.y - (tile.sprite_height / 4), 
			-9999, // force enemies in front of all tiles for now
			Enemy,
			{path: enemy_path}
		);
		enemies_spawned += 1;
		last_spawn_time = current_time;
	}
}