$fn = 20;

module screw_slot(width = 3, length = 10, depth = 10) {
  translate([(length - width) / 2, 0, 0])
    cylinder(d = width, h = depth, center = true);
  translate([- (length - width) / 2, 0, 0])
    cylinder(d = width, h = depth, center = true);
  cube([length - width, width, depth], center = true);
}

screw_slot();