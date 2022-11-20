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