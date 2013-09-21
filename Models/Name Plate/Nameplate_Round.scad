// Codes by Andy Ide
// www.3dfuture.com.au
// January 2012
// Many many thnaks to HarlanDMii for his excelletn Write Module
// His site is http://www.thingiverse.com/thing:16193




// You need Write.scad for this script to run.
// Get it from http://www.thingiverse.com/thing:16193
use <Write.scad>


// Edit this to change the nameplate
text = "Peyton";
font = "orbitron.dxf";  //Desired Font (letters, knewave, orbitron, blackrose, braille).dxf


// Optional edits 
// These are to edit the style of the Nameplate

// Thickness of the border
border=1; 

// Space between the Letters and the border
spacing=5; 

// How big the letters are
textheight=30;

// The space between the letters.
letterspace = 1;


// Calc the width of the text.
// A BIG thanks to HarlanDMii for this code
textwidth=(.6875*textheight*letterspace);  
width=textwidth*(len(text))+textwidth;



// The Blue make the text stand out in Openscad.
translate([0,0,3])
color("Blue"){
		write(text,t=6,font = font,h=textheight,space=letterspace, center = true);
}
offset 		= 2;	//vertical offset of text
left 			= 45; 	//degrees of rotation of left cylinders
leftedges 	= 100; 	//$fn value of left cylinders
right 		= 45;	//degrees of rotation of right cylinders
rightedges 	= 100; 	//$fn value of right cylinders

// The work bit!
translate([(-width/2),-offset,0]){

	difference(){
		hull(){
			rotate([0,0,left]) cylinder(4,textheight/2+5+border+spacing,textheight/2+border+spacing,$fn=leftedges);
			translate([width,0,0])
			rotate([0,0,right]) cylinder(4,textheight/2+border+spacing+5,textheight/2+border+spacing, $fn=rightedges);
		}
		translate([0,0,2])	
		hull(){
			rotate([0,0,left]) cylinder(4,textheight/2+spacing-4,textheight/2+spacing,$fn=leftedges);
			translate([width,0,0])
			rotate([0,0,right]) cylinder(4,textheight/2+spacing-4,textheight/2+spacing, $fn=rightedges);
		}		
		translate([0,0,-1])	cylinder(5,2,2);
		translate([width,0,-1])	cylinder(5,2,2);
		
	}
}



