
x = 150;
y = 150;
z = 2;

module stamp(shape,x,y,z){
	scale([x/150,y/150,1]){	
		linear_extrude(height=z){
			import("DXFLib.dxf", layer = shape);
		}
	}
}

module available_shapes(){
	echo("Please choose one of the following available shapes");
	for(i=["star",
				"heart",
				"cat",
				"fallout",
				"ironman",
				"hellokitty",
				"stormtrooper",
				"mushroom"]){
		echo(i);
	}
}


stamp("m4",150,150,2);

