// THIS SCRIPT DEALS WITH MOVEMENT, JUMPING AND CHECKS FOR LADDER COLLISIOON


// Links to script
scr_getinputs();


// Needed for the pause instance
if (global.pause) && instance_exists(obj_player) exit;



// Initializes the basic horizontal movement variables
move = key_left + key_right;
hsp = move * movespeed;


/// Walking audio
/*
if keyboard_check_pressed(vk_left || vk_right) && instance_exists(obj_player)
{
    if (!audio_is_playing(au_walkgrass))
    {
        audio_play_sound(au_walkgrass, 1, true);
    }

}
*/



// Modifies jumping speed and height
if  (vsp < 10)
{
    vsp += grav/1; 
}

if (place_meeting(x, y+1, obj_wall))
{ 
    if (key_jump) vsp = -5.2; // Also modifies the jumping height
}

if (place_meeting(x, y+1, obj_wall))
{ 
    if (key_jump)
    {
        audio_play_sound(au_jump, 10, false);
    }
}




// Varied jump height depending how much button is pressed.
if (vsp < 0) && (!key_jump_held) vsp = max(vsp, 0) // or replace 0 for example with -jumpspeed/2 . 


// Checks if player gets hold of a ladder
if (place_meeting(x, y, obj_ladder) &&  ((key_up) || (key_down)))
{
    hsp = 0;
    vsp = 0;
    state = states.ladder; // States are initialized in the creation code of room rm_iniatialize
}

// Links to scripts
scr_collideandmove();
scr_animate();

