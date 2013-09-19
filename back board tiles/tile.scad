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

//Bolt
use <knurledFinishLib.scad>
include <polyScrewThread.scad>

tile_width = 50;
tile_thickness = 3;
tab_depth = tile_width/8;
tab_width = tile_width/3;
tab_offset = tab_width*.1;
tab_radius = 1.9; //must be >= tile_thickness/2
picture_depth = 2;
scale_factor = [1.01,1.05,1];
word_scale = [1.8,1.8,2];
picture_scale = [tile_width/2,tile_width/2,1];


image = "heart";


////////////////////////////////////////////////////////////////////////////renders/////////////////////////////////////////////////////////////////////////



	tile2("Heart");/*
translate([tile_width+.03,0])
	color("lightblue") tile2();
translate([0,tile_width+.02])
	color("lightgreen") tile2();
	

translate([tile_width/2,word_scale[2]+tile_width/2,tile_thickness])
	stamp(image,picture_scale[0],picture_scale[1],picture_scale[2]);
*/
///////////////////////////////////////////////////////////////////////////modules//////////////////////////////////////////////////////////////////////////
/*
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
*/






module tile2(content){
	union(){
		difference(){		
			union(){
				translate([tile_width/2,tile_width/2,tile_thickness/2]) 
					cube([tile_width,tile_width,tile_thickness],center=true);
				translate([tab_width,tile_width])	
					tab2(); //top male
				translate([0,tab_width])	
					rotate([0,0,90])	
						tab2(); //left male
			}
			translate([tab_width-((tab_width*scale_factor[1]-tab_width)/2),-.01]) scale(scale_factor)	
				tab2(); //bottom female
			translate([tile_width,.01+tab_width-((tab_width*scale_factor[1]-tab_width-.1)/2)])	scale(scale_factor)
				rotate([0,0,90])	
					tab2(); //right female


			translate([tile_width/2,tile_width/3,tile_thickness])
				scale(word_scale)
					write(content, center = true);
			//bottom
			translate([tile_width/2,tab_depth+tab_radius,0])
			bolt();
			//top	
			translate([tile_width/2,tab_depth+tab_radius+tile_width,0])
			bolt();
			//left
			translate([-tab_depth-tab_radius,tile_width/2,0])
			bolt();
			//right
			translate([-tab_depth-tab_radius+tile_width,tile_width/2,0])
			bolt();
		}
		translate([tile_width/2,word_scale[2]+tile_width/1.6,tile_thickness])
		color("orange") stamp(image,picture_scale[0],picture_scale[1],picture_scale[2]);
	}
}

module tab2(){
	$fn = 25;
	difference(){
		hull(){ 
			difference(){
			translate([0,0,tile_thickness/2])
				hull(){
						sphere(r=tab_radius);
					translate([tab_width,0])	
						sphere(r=tab_radius);
					translate([-tab_offset,tab_depth])	
						sphere(r=tab_radius);
					translate([tab_width+tab_offset,tab_depth])	
						sphere(r=tab_radius);
				}
			translate([-tab_offset-tab_radius,tab_depth,-tab_radius])
			cube([tab_width+tab_offset*2+tab_radius*2,tab_radius,tile_thickness+tab_radius*2]);
			}
			translate([tab_width+tab_offset,tab_depth])	
			intersection(){
				cylinder(tile_thickness,r=tab_radius);
				translate([-tab_radius,0,0])
				cube([tab_radius*2,tab_radius,tile_thickness]);
			}
			translate([-tab_offset,tab_depth])
			intersection(){
				cylinder(tile_thickness,r=tab_radius);
				translate([-tab_radius,0,0])
				cube([tab_radius*2,tab_radius,tile_thickness]);
			}
		}
		translate([-tab_offset-tab_radius,-tab_radius,-tab_radius])
			cube([tab_width+tab_offset*2+tab_radius*2,tab_radius,tile_thickness+tab_radius*2]);
		translate([-tab_offset-tab_radius,-.01,tile_thickness+.01])
			cube([tab_width+tab_offset*2+tab_radius*2,tab_depth+tab_radius+.01,tab_radius]);
		translate([-tab_offset-tab_radius,-.01,-tab_radius])
			cube([tab_width+tab_offset*2+tab_radius*2,tab_depth+tab_radius+.01,tab_radius-.01]);

	}
}

module bolt(){
translate([0,0,3.012+tile_thickness])
scale([.5,.5,.5])
rotate([180,0,0])
//import("bolt_1.stl");
import("Flushbold_Beveled.stl");
}