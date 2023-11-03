use <pulley.scad>


module belt_connector_round(teeth = 40, h = 8, belt_thick = 1, wall_thick = 5, wall_ang = 90, outer_d = 40) {
    pulley(teeth = 40, h = 8);
    
    wall_inner_r = pulley_d_calc(teeth) / 2 + belt_thick;
    
    if(outer_d / 2 - wall_inner_r > wall_thick) 
    {  
        echo("here");
        wall_center_r = (pulley_d_calc(teeth) + outer_d / 2 - wall_inner_r) / 2 + belt_thick;
        
        rotate_extrude(angle = wall_ang)
        translate([wall_center_r,h / 2,0])
        square([outer_d / 2 - wall_inner_r, h], center = true);
    } else {  
        wall_center_r = (pulley_d_calc(teeth) + wall_thick) / 2 + belt_thick;
        
        rotate_extrude(angle = wall_ang)
        translate([wall_center_r,h / 2,0])
        square([wall_thick, h], center = true);
    }
}

belt_connector_round();