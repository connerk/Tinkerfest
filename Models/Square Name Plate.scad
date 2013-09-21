use </Name Plate/Nameplate.scad>












/**** These are to edit the style of the Nameplate *****/

/** Text on the Plate **/
text = "Tinker Fest!";
font = "orbitron.dxf";  //Desired Font (letters, knewave, orbitron, blackrose, braille).dxf
/** Thickness of the border **/
border=3; 

/** Space between the Letters and the border **/
spacing=3; 

/** How big the letters are **/
textheight=20;

/** The space between the letters **/
letterspace = 1;

/** Space between the mounting holes **/
addHoles = 1;
holeSpace = 4;

/** This creates a hole to add a pin for making name tags **/
addPin = 1;







NamePlate(text, font, border, spacing, textheight, letterspace, holeSpace=holeSpace, addHoles=addHoles, addPin=addPin);