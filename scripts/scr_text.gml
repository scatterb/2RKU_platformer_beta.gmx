// THIS SCRIPT DEALS WITH THE NPC'S TEXT ELEMENTS


/*
- Insert this piece of code whenever you want to create a textbox:
    scr_text("Text", speed, x, y)
- More settings in the obj_text
- More details in the bottom of this script
*/


// Text values
txt = instance_create(argument2, argument3, obj_text);
with (txt)
{
    padding = 16;
    maxlength = view_wview[0];
    text = argument0;
    spd = argument1;
    font = fnt_smaller;

    text_length = string_length(text);
    font_size = font_get_size(font);
    
    draw_set_font(font);
    
    // How wide and how high the text is
    text_width = string_width_ext(text, font_size+(font_size/2), maxlength);
    text_height = string_height_ext(text, font_size+(font_size/2), maxlength);
    
    //How big the text box is
    boxwidth = text_width + (padding*1.1);
    boxheight = text_height + (padding*1.1); 
}


/* 
- # is read as a line break

- The size of the box and font is now easiest to change via Fonts > fnt
but woah, does it get ugly when made smaller.

- Make sure that anti-aliasing and high-quality are NOT on at the font,
else it will look blurry at some sizes.

- Also make sure every scaling operation you're doing,
is scaling by precisely an integer.

- For some reason the textbox makes sprites flash if the depth is different than 0.

- The following code helps immensely with the scaling,
situated currently at the creation code of rm_title:

var ScreenWidth = display_get_width();
var ScreenHeight = display_get_height();

if window_get_fullscreen()
{
    fullscreen = true;
    window_set_fullscreen(true);
    display_set_gui_size(ScreenWidth, ScreenHeight);
    surface_resize(application_surface, ScreenWidth, ScreenHeight);
}
else
{
    fullscreen = false;
    window_set_fullscreen(false);
    display_set_gui_size(window_get_width(), window_get_height());
    surface_resize(application_surface, window_get_width(), window_get_height());
}
