use <MCAD\metric_fastners.scad>
use <threads.scad>

//////
//Vars
//////

//Nozzle//
tipNozzleHeight = 5;
tipCrownHeight 	= 4;
tipCrownRad 	= 6;
tipHole 		= .5;
threadDepth		= 1.5;
totalNozzleHeight = tipNozzleHeight + tipCrownHeight;

///////////
//Renders
///////////

//metric_thread(8, 1, 8, internal = true);
//printhead();


/////////
//Modules
/////////

module printhead(){
	nozzle();
	translate([0,0,totalNozzleHeight])
	!barrel();
}

module nozzle(){
	difference(){
		intersection(){
			union(){
				cylinder(tipNozzleHeight,tipHole + .2,tipCrownRad, $fn = 50);
				translate([0,0,tipNozzleHeight]){
					difference(){
						cylinder(tipCrownHeight,r = tipCrownRad);
					rotate([180,0,0])translate([0,0,-tipCrownHeight+1])
						cylinder_chamfer(tipCrownRad,1);
					}
				}
			}
			cylinder(tipNozzleHeight + tipCrownHeight, r = tipCrownRad, $fn = 6);
		}
		cylinder(tipNozzleHeight,r=tipHole, $fn = 30);
		translate([0,0,threadDepth])
		cylinder(totalNozzleHeight,r=1.9, $fn = 30);
	}
}

module barrel(){
	difference(){
		cylinder(15,r=4, $fn=50);
		translate([0,0,14])rotate([180,0,0])cylinder_chamfer(4,1);
		cylinder(15,r=1.75, $fn=30);
	}
}

module millhead(){

}