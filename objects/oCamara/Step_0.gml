/// @description Update Camara

//Update destinantion
if(instance_exists(follow)){
	xTo = follow.x;
	yTo = follow.y;
}

//Update object Position

x += (xTo - x) / 25;
y += (yTo - y) / 25;

//keep camera center inside room
x = clamp(x, view_w_half + buff,room_width-view_w_half - buff);
y = clamp(y, view_h_half+buff,room_height-view_h_half-buff);

//Screen shake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);

shake_remain = max(0, shake_remain - ((1/shake_lenght) * shake_magnitude));

//Update camara view
camera_set_view_pos(cam, x-view_w_half, y-view_h_half);

if (layer_exists("Mountains")){
	layer_x("Mountains", x/2);
}

if (layer_exists("Trees")){
	layer_x("Mountains", x/4);
}
