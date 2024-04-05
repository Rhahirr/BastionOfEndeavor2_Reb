#define MAPTEXT(text) {"<span class='maptext'>[##text]</span>"}

/* Bastion of Endeavor Unicode Edit
#define WXH_TO_HEIGHT(measurem) text2num(copytext(x, findtextEx(x, "x") + 1))
*/
#define WXH_TO_HEIGHT(measurem) text2num(copytext_char(x, findtextEx_char(x, "x") + 1))
// End of Bastion of Endeavor Unicode Edit
