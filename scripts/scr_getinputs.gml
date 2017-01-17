// THIS SCRIPT INITIALIZES ALL THE USED KEYBOARD AND GAMEPAD BUTTONS


// Get inputs (in the order of: keyboard > gamepad analog > gamepad d-pad)
key_left = -(keyboard_check(vk_left) ||  (gamepad_axis_value(0, gp_axislh) < 0)  || gamepad_button_check(0, gp_padl)); // makes zero movement when both are pressed
key_right = keyboard_check(vk_right) || (gamepad_axis_value(0, gp_axislh) > 0) || (gamepad_button_check(0,gp_padr));
key_up = keyboard_check(vk_up)|| (gamepad_axis_value(0, gp_axislv) < 0) || (gamepad_button_check(0,gp_padu));
key_jump = keyboard_check_pressed(vk_space) || (gamepad_button_check_pressed(0, gp_face1));
key_jump_held = keyboard_check(vk_space) || (gamepad_button_check(0, gp_face1));
key_down = keyboard_check(vk_down) || (gamepad_axis_value(0, gp_axislv) > 0) || (gamepad_button_check(0,gp_padd));;
key_enter= keyboard_check(vk_enter) || (gamepad_button_check(0, gp_start));


// Sets the analog stick of a gamepad, else the player will move by it's own
gamepad_set_axis_deadzone(0, 0.7); 


// Toggle fullscreen
if keyboard_check_pressed(vk_escape) || (gamepad_button_check_pressed(0, gp_select))
{
   if window_get_fullscreen()
   {
      window_set_fullscreen(false);
   }
   else
   {
      window_set_fullscreen(true);
   }
}

// The worldmap player inputs located in obj_player_map


// In the moment of death restart a room
// -> located in obj_player_death Step

scr_sound_effects();

