var castle = instance_find(Castle, 0);
var window_width = window_get_width();
var window_height = window_get_height();

draw_set_font(DefaultFont);
draw_set_color(c_black);
draw_text(window_width - 600, 50, "Castle Health: " + string(castle.hitpoints));

// |-----------------------------------------------------------------------------------
// | Check For Game Over
// |-----------------------------------------------------------------------------------

var map_controller = instance_find(MapController, 0);

if(map_controller.gameover)
{
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(0, 0, window_width, window_height, false);
	draw_set_color(c_white);
	draw_text(50, 50, "Game Over");
	draw_text(50, 100, "Press space to try again");
}