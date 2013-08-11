
Shapes = ["star","heart","cat"];


shape = "cat";

x = 150; //default 150
y = 150;	//default 150


stamp("heart",x,y);

module stamp(shape,x,y){
	translate([-x/2,-y/2,0]){
		scale([x/150,y/150,1]){	
			linear_extrude(height=10){
				import("DXFLib.dxf", layer = shape);
			}
		}
	}
}