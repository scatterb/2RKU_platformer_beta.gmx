// THIS SCRIPT HANDLES THE MOVEMENT WHEN CLIMBING A LADDER


// Links to scripts
scr_getinputs();


// Initialize the variables
hsp = 0;
vsp = 1.2 * (key_down - key_up);
x = (instance_nearest(x, y, obj_ladder) .x)


// During ladder or on top, release player
if (key_jump) || (key_jump_held) || (!place_meeting(x, y, obj_ladder))
{
    hsp = 0;
    vsp = 0;
    state = states.normal;
}


// When bottom of ladder, release player, CULPRIT OF NOT WORKING WITH GAMEPAD?
if (place_meeting(x, y+1, obj_wall) &&  ((key_right) || -(key_left))) 
{
    state = states.normal;
}



// Link to script
scr_collideandmove();
scr_animate();
