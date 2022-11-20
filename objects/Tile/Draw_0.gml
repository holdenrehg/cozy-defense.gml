if(not hovered)
{
	draw_self();
}
else
{
	shader_set(LightenShader);
	draw_self();
	shader_reset();
}

if(tower != noone)
{
	with(tower)
	{
		x = other.x;
		y = other.y - 20;
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
		draw_self();
	}
}