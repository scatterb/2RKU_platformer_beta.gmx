// THIS SCRIPT DEALS WITH ALL THE COLLISIONS OF THE PLAYER,
// EXLUDING THE ENEMY COLLISIONS


// Carry player with moving platforms
var hsp_final = hsp + hsp_carry;
hsp_carry = 0;


//Horizontal collision
if (place_meeting(round(x+hsp_final), round(y), obj_wall))
{
    while (!place_meeting(round(x+sign(hsp_final)), round(y), obj_wall))
    {
        x += sign(hsp_final);
    }
    hsp_final = 0;
    hsp = 0;
}
x += hsp_final;


// Vertical collision
if (place_meeting(round(x), round(y+vsp), obj_wall))
{
    while (!place_meeting(round(x), round(y+sign(vsp)), obj_wall)) y += sign(vsp);
    vsp = 0;
}
y += vsp;

// Link to script
scr_sound_effects();
