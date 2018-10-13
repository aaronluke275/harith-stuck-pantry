// Creates a blank camera by assigning "camera" variable to the "camera_create();" function.
camera = camera_create();

// This variable defines the camera scrolling speed per pixel.
camera_speed = 5;

// This function builds a "look-at" (view) matrix.
// This function modifies the view matrix and not the projection matrix.
var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);

// This function builds an orthographic projection matrix. 
// matrix_build_projection_perspective(); isn't used as there's no
// element of 3D effects in this game.
var pm = matrix_build_projection_ortho(1024, 768, 1, 10000);

// Sets the camera's view and projection matrix.
camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);

// Setting the first viewport in the room editor to be the camera and
// follow point for the player.
view_camera[0] = camera;

// Initiallizing "follow" variable as the "oPlayer" object.
follow = oPlayer;

// Setting up the variables to the x and y axis of the object.
xTo = x;
yTo = y;