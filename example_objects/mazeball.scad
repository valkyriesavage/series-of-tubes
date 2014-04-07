//translate([-1,0,-62]) {import("maze.stl");}

translate([0,-0,0]) {
	sphere(6, $fn=100);
	translate([0,-15,0]) {
		sphere(5, $fn=100);
	}
}