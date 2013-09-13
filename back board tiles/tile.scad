//////////////////////////////////////////////////////////////////////////tile board////////////////////////////////////////////////////////////////////////
/*
Modeler:
Date Started:
Date Finished:
Copywright: CC


*    knurled_cyl( Knurled cylinder height,
 *                 Knurled cylinder outer diameter,
 *                 Knurl polyhedron width,
 *                 Knurl polyhedron height,
 *                 Knurl polyhedron depth,
 *                 Cylinder ends smoothed height,
 *                 Knurled surface smoothing amount );


//////////////////////////////////////////////////////////////////////////perameters///////////////////////////////////////////////////////////////////////*/

use <Write.scad>
use <..\DXF_Library\DXFStamp.scad>
use <MCAD\nuts_and_bolts.scad>

//Bolt
use <Fasteners\Knurled_surface_finishing_library\knurledFinishLib.scad>
include <Fasteners\Poor_mans_openscad_screw_library\polyScrewThread.scad>

tile_width = 50;
tile_thickness = 3;
tab_depth = tile_width/8;
tab_width = tile_width/3;
tab_radius = 1;
picture_depth = 2;
scale_factor = 1.02; //[1.02,1.02,1];
word_scale = [1.25,1.25,5];
picture_scale = [tile_width/2,tile_width/2,2];


image = "heart";


////////////////////////////////////////////////////////////////////////////renders/////////////////////////////////////////////////////////////////////////



	tile2();
translate([tile_width+.03,0])
	color("lightblue") tile2();
translate([0,tile_width+.02])
	color("lightgreen") tile2();

translate([tile_width/2,word_scale[2]+tile_width/2,tile_thickness])
	*stamp(image,picture_scale[0],picture_scale[1],picture_scale[2]);

///////////////////////////////////////////////////////////////////////////modules//////////////////////////////////////////////////////////////////////////

module tile(content){
difference(){
	linear_extrude(height = tile_thickness, twist = 0)
		difference(){
			union(){
				square(tile_width,center=true);
				translate([tab_depth+tile_width/2,tile_width/4])
					tab();
				translate([tab_depth+tile_width/2,-tile_width/4])
					tab();
				rotate([0,0,90])
					translate([tab_depth+tile_width/2,0])
						tab();
			}
				translate([-tile_width/2+tab_depth,tile_width/4])
					scale(scale_factor)
						tab();
				translate([-tile_width/2+tab_depth,-tile_width/4])
					scale(scale_factor)
						tab();
				rotate([0,0,90])
					translate([-tile_width/2+tab_depth,0])
						scale(scale_factor)
							tab();
		}
//	#linear_extrude(height = picture_depth, twist = 0)
//		scale(picture_scale)
//			import (..\DXF_Library\DXFLib.dxf,
//				Layer = "heart",
//		center = true);

//stamp(content, picture_scale);

	translate([0,-tile_width/4,tile_thickness])
		scale(word_scale)
			write(content, center = true);
}
}

module tab(){
	resize([tab_depth,tab_width])
		circle(15);
	translate([-tab_depth,-tab_width/4])
		square([tab_depth,tab_width/2]);
}	







module tile2(content){
	difference(){		
		union(){
			translate([tile_width/2,tile_width/2,tile_thickness/2]) 
				cube([tile_width,tile_width,tile_thickness],center=true);
			translate([tab_width*2,tile_width+tab_radius-.01]) 	
				rotate([0,0,90]) 	
					goodTab(); //top male
			translate([-tab_radius+.01,tile_width-tab_width])	
				rotate([0,0,180])	
					goodTab(); //left male
		}
		translate([(tab_width*2+.2),(tab_radius)]) scale(scale_factor)	
			rotate([0,0,90]) 	
				goodTab(); //bottom female
		translate([(tile_width-tab_radius+.01),(tile_width-tab_width+.2)])	scale(scale_factor)
			rotate([0,0,180])	
				goodTab(); //right female


		translate([tile_width/2,tile_width/4,tile_thickness])
			scale(word_scale)
				write(content, center = true);
	//bottom
	translate([tile_width/2,tab_depth+tab_radius,0])
	bolt();
	//left
	translate([-tab_depth+tab_radius,tile_width/2,0])
	bolt();
	//right
	translate([tile_width-tab_depth-tab_radius,tile_width/2,0])
	bolt();
	//top	
	translate([-tab_depth,tile_width/2,0])
	bolt();
	}
}


module goodTab(){
	difference(){
	union(){
	translate([-tab_radius,-tab_width])
		cube([tab_radius,tile_width,tile_thickness]);
	tab2();
	}
	translate([tab_depth-tab_radius,tab_width*2+tab_radius*1.3])	rotate([0,0,180]) tab2();
	translate([tab_depth-tab_radius,tab_radius*-1.3])	rotate([0,0,180]) tab2();
	}
}

module tab2(){
	$fn = 15;
	translate([0,0,-.01])
	hull(){
		cube([tab_depth,tab_width,tile_thickness+.02]);
		translate([tab_depth-tab_radius,-tab_width*.02])	
			cylinder(tile_thickness+.02,r=tab_radius);
		translate([tab_depth-tab_radius,tab_width+tab_width*.02])	
			cylinder(tile_thickness+.02,r=tab_radius);
	}
}

module bolt(){
translate([0,0,5.012+tile_thickness])
scale([.5,.5,.5])
rotate([180])
import("C:/Users/KEVIN/Documents/OpenSCAD/libraries/Fasteners/Knurled_surface_finishing_library/Makerbolt.stl");
}