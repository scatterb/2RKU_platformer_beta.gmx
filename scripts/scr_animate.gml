// MOST OF THE ANIMATION RELATED TO THE PLAYER OBJECT
// - If some animation speed needs adjusting just modify the image_speed value


// Link to script
scr_collideandmove();
                   
  
// Flips player sprites correct way when turning        
if (move!= 0) image_xscale = move; 


// Determines when idle and run animation are used
if (place_meeting(x, y+1, obj_wall)) && (global.immortal == 0)
{
    if (hsp!=0) sprite_index = spr_player_run; else sprite_index = spr_player_idle;
    // Replace hsp with move to continue run animation whilst up against wall 
}


// When player jumps, jump animation is used
if (vsp < 0) && (global.immortal == 0)
{
    sprite_index = spr_player_jump;
}


// When player is descending after a jump, fall animation is used
if (vsp > 0) && (global.immortal == 0)
{
    sprite_index = spr_player_fall;
}


// Invincible animation
if (global.immortal == 1)
{
    image_speed = 0.7;
    sprite_index = spr_invincible;
}

// Slows down the invincible animation towards the end
if (global.immortal == 1) && (alarm < 100)
{
    image_speed = 0.1;
    sprite_index = spr_invincible;
    
}


// Altered animation speeds
if (sprite_index = spr_player_idle)
{
    image_speed = 0.01;
}
if (sprite_index = spr_player_run)
{
    image_speed = 0.2;
}

// Ladder movement animation
if state == states.ladder
{
    image_speed = 0;
    sprite_index = spr_player_climb
    if keyboard_check(vk_up) || (gamepad_axis_value(0, gp_axislv) < 0) || (gamepad_button_check(0,gp_padu))//if vsp > 0
    {
        image_speed = 0.5;
    }
}




