//////////////////////////////////////////////////////////////////////////tile board////////////////////////////////////////////////////////////////////////
/*
Modeler:
Date Started:
Date Finished:
Copywright: CC
*/

//////////////////////////////////////////////////////////////////////////perameters////////////////////////////////////////////////////////////////////////

tile_width = 50;
tile_thickness = 5;
tab_depth = 5;
tab_width = 10;
picture_depth = 2;
scale_factor = [1.1,1.1,1.1];
word_scale = [1.25,1.25,5];
picture_scale = [.33,.33,.33];

use <Write.scad>




////////////////////////////////////////////////////////////////////////////renders/////////////////////////////////////////////////////////////////////////


tile("heart");


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
//	linear_extrude(height = picture_depth, twist = 0)
//		scale(picture_scale)
//			import (DXFLib.dxf,
//				Layer = content,
//				center = true);

	translate([0,-tile_width/4,tile_thickness])
		scale(word_scale)
			write(content, center = true);
}
}

module tab(){
	resize([tab_depth,tab_width])
		circle(5);
	translate([-tab_depth,-tab_width/4])
		square([tab_depth,tab_width/2]);
}	