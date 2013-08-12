module stamp(shape,x,y,z){
	translate([-x/2,-y/2,0]){
		scale([x/150,y/150,1]){	
			linear_extrude(height=z){
				import("DXFLib.dxf", layer = shape);
			}
		}
	}
}

module available_shapes(){
	echo("Please choose one of the following available shapes");
	for(i=["star","heart","cat"]){
		echo(i);
	}
}