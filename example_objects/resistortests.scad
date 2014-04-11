difference() {
	cylinder(r=5, h=50, $fn=100);
	
	cylinder(r=4, h=110, center=true, $fn=100);

	translate([-10, 0, -5]) {
		cube(100);
	}
}