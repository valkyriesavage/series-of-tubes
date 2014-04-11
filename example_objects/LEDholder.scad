difference() {
	cube([20,20,2.5]);

	translate([7, -1, 2.5]) {
		rotate([90,0,0]) {
			cylinder(r=1.5, h=50, $fn=20, center = true);
		}
		translate([5, 0,0]) {
			rotate([90,0,0]) {
				cylinder(r=1.5, h=50, $fn=20, center = true);
			}
		}
	}
}