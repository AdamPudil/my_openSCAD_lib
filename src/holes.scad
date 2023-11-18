$fn = 20;

module screw_slot(width = 3, length = 10, depth = 10) {
  translate([(length - width) / 2, 0, 0])
    cylinder(d = width, h = depth, center = true);
  translate([- (length - width) / 2, 0, 0])
    cylinder(d = width, h = depth, center = true);
  cube([length - width, width, depth], center = true);
}

module smart_hole(d = 10, h = 10, center = true, bridging = true) {
    difference() {
        union() {
            rotate([0,90,0])
                cylinder(d = d, h = h, center = center);
            translate([0,0,sqrt(2*d*d)/4])
                rotate([45,0,0])
                cube([h,d/2,d/2], center = center);
        }
        if(bridging)
            translate([0,0,d])
                cube([h+1,d,d], center = center);
    }
}


smart_hole();
//screw_slot();