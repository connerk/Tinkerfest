//////////////////////////////////////////////////////////////////////////////Ring//////////////////////
/*//////////////////////////////////////////////////







*/
phi = 1.618; //do not change

pi = 3.141; //do not change

use <write.scad>
use <..\DXF_Library\DXFStamp.scad>

t=2;

///////////////////////////////////////////////////////////////////////////////parameters///////////////////////////////////////////////////////////////////


ring = 1;

		$fn = 40;
		
		inner_diameter = 20;
		
		ring_size = [2,5];
		
		pin_height = 4; //do not change
		
		pin_diameter = 3; //do not change

pendant = 0;

		clasp_width = 2;

		clasp_loop_size = 1.5;

		clasp_loop_thickness = .5;


diamond = 0;
		
		diamond_height_top = 1.5;
		
		diamond_height_bottom = 3;
		
		diamond_diameter_top = 3.5;
		
		diamond_diameter_middle = 5;
		
		diamond_diameter_bottom = 2;
		
		little_diamond_size = 1;
		
		facets = 12;

		base_plate_thickness = 2;

plate = 1;
		
		name_plate_diameter = 12; //15 max
				
		add_word = 0; //if this is 1, you can type a word. if this is zero you can choose a shape
		
		word = "Neal"; //5 letters max
		
		shape = "skullbones"; //available shapes are HEART, CAT, and STAR
		
		plate_thickness = 1.5;

spiral = 0;
		
		density = 50;

		width = .5;

		angle = 45;
		
//////////////////////////////////////////////////////////////////////////////renders///////////////////////////////////////////////////////////////////////

rendered();






//////////////////////////////////////////////////////////////////////////////modules///////////////////////////////////////////////////////////////////////

module rendered(){
	if(ring) ring_base();
	if(pendant) pendant_base();
}

module pendant_base(){
	if(diamond) diamondMod();
	if(plate) plateMod();
}

module clasp(){
	translate([-clasp_width/2,0,0])
		rotate([0,90,0])
			difference(){
				cylinder(clasp_width,
				r=clasp_loop_size+clasp_loop_thickness);
				translate([0,0,-.5])
					cylinder(clasp_width+1,r=clasp_loop_size);
				if(plate){
					translate([0,-clasp_loop_size-clasp_loop_thickness,-.5])
						cube([(clasp_loop_size+clasp_loop_thickness),
						(clasp_loop_size+clasp_loop_thickness)*2,
						clasp_width+1]);
				}
			}
}


module ring_base(){
	translate([0,0,ring_size[1]/2])
		difference(){
			rotate_extrude()
				translate([inner_diameter/2,0,0])
					resize(ring_size)
						circle(1);
			translate([0,(inner_diameter/2)+ring_size[0],0])
				rotate([90,0,0])
					cylinder(pin_height,r=pin_diameter/2+.25, $fn=4);
			if(spiral)rotate([90,0,0]) spiralMod();
		}
	{
		if(diamond)diamondMod();
		if(plate) plateMod();
	}
}

module diamondMod(){
	union(){
		cylinder(diamond_height_top,
					diamond_diameter_top,
					diamond_diameter_middle,
					$fn=facets);
		translate([0,0,diamond_height_top])
			cylinder(diamond_height_bottom,
						diamond_diameter_middle,
						diamond_diameter_bottom,
						$fn=facets);
			if(ring){
				translate([0,0,diamond_height_bottom+diamond_height_top])
					cylinder(pin_height,r=pin_diameter/2, $fn=4);
			}
			if(pendant){
				translate([0,0,diamond_height_bottom+diamond_height_top])	
					clasp();
			}
	}
}

module plateMod(){
	difference(){
		cylinder(plate_thickness,r=name_plate_diameter/2);
		rotate([0,180,0])
			if(add_word)write(word,center=true);
			if(!add_word)translate([name_plate_diameter*.4,name_plate_diameter*.4,-.01])#stamp(shape,name_plate_diameter*.8,name_plate_diameter*.8,plate_thickness-1);
	}
	if(ring){
		translate([0,0,plate_thickness])
			cylinder(pin_height,r=pin_diameter/2,$fn=4);
	}
	if(pendant){
		translate([0,name_plate_diameter/2-(clasp_loop_size+clasp_loop_thickness)-.25,plate_thickness])
			clasp();
	}
	
}

module spiralMod(){
	difference(){
		for(r = [0:360/density:360]){
			rotate([0,r,0])
				translate([inner_diameter/2+ring_size[0]/2,0,0])
					rotate([angle,0,0])
						cube([ring_size[0],ring_size[1],width],center=true);
		}	
		translate([0,0,-inner_diameter/2-ring_size[0]])
			cube([6,5,5],center=true);
	}
}











