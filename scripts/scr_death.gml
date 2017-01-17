// THIS SCRIPT RELATES TO THE CHECKPOINT AND RESTARTING A LEVEL


// Link to script
scr_getinputs();

// Death animation that floats dead player around

if !instance_exists(obj_player_death)
{
    var randomangle = random(360);
    var o;
    o = instance_create(x,y,obj_player_death);
    o.angle = randomangle;
    with (obj_player_death)
    {
        direction = angle;
        image_angle = angle;
        speed = 0.3;
        image_speed = 0.12;
    }
}




// Creates the Game Over text (see obj_gameover)
instance_create(0, 0, obj_gameover);  // x and y coordinate are irrelevant here


// Destroy the living model of player
with (obj_player)
{
    instance_destroy();
    audio_play_sound(au_dropdeath, 10, false);
}

if key_jump || key_jump_held //keyboard_check_pressed(vk_space)
{
    audio_stop_sound(au_dropdeath);
}

// Stop music playing / start from beginning
audio_stop_sound(mu_rm_1);
audio_stop_sound(mu_rm_2);
audio_stop_sound(mu_rm_3);

// Checks if a checkpoint has been saved
/*
if (object_exists(obj_player) || (object_exists(obj_player_death)))
{
    if (global.checkpointR != 0) &&  (key_jump) || (key_jump_held)//(keyboard_check_pressed(vk_space))
    {
        room_goto(global.checkpointR);
        if (object_exists(obj_player))
        {
            obj_player.x = global.checkpointx;
            obj_player.y = global.checkpointy;
        }
    }
    else
    {
        //room_restart();
    }
}
*/
