// Player Movement Algorithm

// This line of code has two purposes, it is to assign variables to
// certain key movements and also ensures there will be no memory
// leakages when the player doesn't press the keys when the player
// is away from keyboard(afk)
if (hascontrol == true)
{
	key_right = keyboard_check(vk_right);
	key_left = keyboard_check(vk_left);
	key_jump = keyboard_check_pressed(vk_space);
}
else
{
	key_right = 0;
	key_left = 0;
	key_jump = 0;
}

// This line of code defines the player's movement. A special 
// function "var" is added to initialize the "move" variable as 
// this variable only occurs when the player is moving. 
var move = key_right - key_left;

// The horizontol movement is defined as the current integer value
// of the "move" variable that's determined when certain key
// action is applied multiplied by the variable value of "walksp"
// which simulates horizontol movement.
hsp = move * walksp;

// The vertical movement is defined as the gravity which is defined
// based on the value of the "grv" variable
vsp += grv;

// This line of code has an "if statement" and it checks whether the "oPlayer' object 
// has colided with the "oWall" object. When the condition is met, it equalizes the
// "jump_current" variable with the "jump_number" variable.
if (place_meeting(x,y+vsp,oWall)) 
{
	jump_current = jump_number;
	
}

// This line of code has an "if statement" and it checks whether the "key_jump" variable
// has been executed along with checking if the "jump_current" variable has values over "0".
// When the condition is met, the "jump_current" variable will decrease by "1' in order to
// prevent excessive jumping along with setting the "vsp" variable to a negative integer
// value of "7.5" to simulate jumping.
if (key_jump) && (jump_current > 0)
{
	jump_current--;
	vsp = -12;
}

// Horizontol Collision

// This line of code has an "if statement". The "if statement" checks to see
// whether the "oPlayer" object has colided with the "oWall" object.
// When the condition is met, it executes a "while statement" confirms during
// the event of the two objects coliding. The "sign(x)" function is used to return
// the player movement values back to "1" should the player's movement has became
// larger from certain circumstances such as getting a powerup. When that condition is
// met, the player's horizontol speed returns back to "0" meaning that there's no way
// for the "oPlayer" object to move through the "oWall" object.
if (place_meeting(x+hsp, y, oWall))
{
	while (!place_meeting(x+sign(hsp), y, oWall))
	{
		x += sign(hsp);
	}
	hsp = 0;
}

if (place_meeting(x, y+vsp, oWall))
{
	while (!place_meeting(x, y+sign(vsp), oWall))
	{
		y += sign(vsp);
	}
	vsp = 0;
}

// These two functions allow the "oPlayer" object to have movement. 
// Moving the object in the x-axis is done by defining the 
// Moving the object in the y-axis to simulate gravity is done by defining
// the y-axis function to add itself with the "vsp" variable that was defined earlier.
x += hsp;
y += vsp;