include<CNCHeads.scad>
translate([0,0,57*$t])
FDM();

module FDM(){
color("darkgray")import("FDMNozzle.stl");
translate([0,0,totalNozzleHeight])
color("tan")import("FDMBarrel.stl");
}

x = 83;
y = 83;
z = 58*$t;

intersection(){
	translate([-x/2,-y/2,-.1])
	cube([x,y,z]);
	import("cuteocto.stl");
}