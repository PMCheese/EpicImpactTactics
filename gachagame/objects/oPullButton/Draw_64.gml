draw_set_colour(merge_colour(c_ltgray, c_white, hover));

draw_roundrect(x, y, x+width, y+height, 0);

draw_set_colour(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x+width/2, y+height/2, text);
draw_set_halign(fa_left);
draw_set_valign(fa_top);


draw_set_colour(c_white);