// This line of code defines the scrolling speed of the viewport
// simulating the camera scroll.
x += (xTo - x)/camera_speed;
y += (yTo - y)/camera_speed;

// This line of code literally translates if the "oPlayer object 
// does not equal to -4. When the condition is met, the camera 
// automaticly moves towards the "oPlayer" object's origin points.
if (follow != noone)
{
	xTo = follow.x;
	yTo = follow.y;
}

// This line of code ensures that the camera will move towards the player.
var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camera, vm);