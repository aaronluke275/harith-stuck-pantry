// Setting a "camera" variable to the "camera_create();" function.
camera = camera_create();


var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(1024, 768, 1, 10000);

camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);

// Setting the first viewport in the room editor to be the camera and
// follow point for the player.
view_camera[0] = camera;

follow = oPlayer;

xTo = x;
yTo = y;