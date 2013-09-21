// Codes by Andy Ide
// www.3dfuture.com.au
// January 2012
// Many many thnaks to HarlanDMii for his excelletn Write Module
// His site is http://www.thingiverse.com/thing:16193




// You need Write.scad for this script to run.
// Get it from http://www.thingiverse.com/thing:16193
use <../Write_Library/Write.scad>


// Edit this to change the nameplate
text = " JOAT Labs ";
font = "orbitron.dxf";  //Desired Font (letters, knewave, orbitron, blackrose, braille).dxf


// Optional edits 
// These are to edit the style of the Nameplate

// Thickness of the border
border=5; 

// Space between the Letters and the border
spacing=.8; 

// How big the letters are
text_y_height=20;

// The space between the letters.
letterspace = 1;

holeSpace = 1;
addHoles = 1;
addPin = 1;

module NamePlate(text, font, border, spacing, text_y_height, letterspace, textwidth, width, holeSpace, addHoles, addPin){
	textwidth=(.6875*text_y_height*letterspace);  
	width=textwidth*(len(text));
	difference(){
		translate([-width/2,-text_y_height/2,0]){
			translate([0,0,000.1])
			color("Blue"){
					write(text,t=6,font = font,h=text_y_height,space=letterspace);
			}

			translate([-(border+spacing),-(border+spacing),0]){
				difference(){
					cube([width+((border+spacing)*2),text_y_height+((border+spacing)*2),4]);
					translate([border,border,2])	
						cube([width+spacing*2,text_y_height+spacing*2,3]);
					
				}
			}
		}
		echo ("Mounting Holes:", addHoles);
		#if (addHoles) Mounting_Holes(width,border,spacing,holeSpace);
		translate([0,0,0])
		#if (addPin) pin_recess();
	}
}

module Mounting_Holes(width,border,spacing,holeSpace){
	for (i=[-1,1]){
		echo (i*((width+border+spacing)/2-holeSpace));
		echo (holeSpace); 
		translate([i*((width+border+spacing)/2-holeSpace),0,-2]){
			cylinder(6,2,2);
		}
	}
}

module pin_recess(){
	pin_thickness = 0.6; 	//thickness of safety pin
	pin_length 	= 24; 		//length of safety pin
	pin_width 	= 5.05; 	//width of pin.  name tag pins zig-zag to keep them laying flat and to offer a space to adhere the pin
	pin_recess_thickness = (pin_thickness * 3); 
	pin_fulcrum_thickness = 3.09;
	translate([1.5,text_y_height/3,pin_recess_thickness/2-.001]){
		union(){
			cube([pin_length, pin_fulcrum_thickness+.2,pin_recess_thickness],center = true);
			translate([0,0,pin_recess_thickness/3])
				cube([pin_length, pin_width+.2,pin_thickness+.2],center = true);#
			translate([-pin_length/2-1,0,0])
				cube([7, pin_width+.2,pin_recess_thickness+.1],center = true);
		}
	}
}