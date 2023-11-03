function pulley_d_calc(teeth) = (2*((teeth*2)/(3.14159265*2)-0.254));

module pulley(teeth = 40, h = 12, sides = 0) {
    additional_tooth_width = 0.2; //mm
    additional_tooth_depth = 0.2; //mm

    
    pulley_OD = pulley_d_calc(teeth);
    tooth_depth = 0.764;
    tooth_width = 1.494;
    
	tooth_distance_from_centre = sqrt( pow(pulley_OD/2,2) - pow((tooth_width+additional_tooth_width)/2,2));
	tooth_width_scale = (tooth_width + additional_tooth_width ) / tooth_width;
	tooth_depth_scale = ((tooth_depth + additional_tooth_depth ) / tooth_depth) ;

    module GT2_2mm() {
        linear_extrude(height=h+2) polygon([[0.747183,-0.5],[0.747183,0],[0.647876,0.037218],
        [0.598311,0.130528],[0.578556,0.238423],[0.547158,0.343077],[0.504649,0.443762],[0.451556,0.53975],
        [0.358229,0.636924],[0.2484,0.707276],[0.127259,0.750044],[0,0.76447],[-0.127259,0.750044],
        [-0.2484,0.707276],[-0.358229,0.636924],[-0.451556,0.53975],[-0.504797,0.443762],[-0.547291,0.343077],
        [-0.578605,0.238423],[-0.598311,0.130528],[-0.648009,0.037218],[-0.747183,0],[-0.747183,-0.5]]);
    }   

	difference() {	
		rotate ([0,0,360/(teeth*4)]) 
		cylinder(r=pulley_OD/2,h=h, $fn=teeth*4);
	
		//teeth - cut out of shaft
		
		for(i=[1:teeth]) 
        rotate([0,0,i*(360/teeth)]) 
        translate([0,-tooth_distance_from_centre,-1]) 
        scale ([ tooth_width_scale , tooth_depth_scale , 1 ]) 
        {
         GT2_2mm();
        }
	}	
    if ( sides > 0 ) {
        translate ([0,0, h - sides]) 
        rotate_extrude($fn=teeth*4)  
        polygon([[0,0],[pulley_OD/2,0],[pulley_OD/2 + sides , sides],[0 , sides],[0,0]]);
    }
		
    if ( sides > 0 ) {
        translate ([0,0,0 ]) 
        rotate_extrude($fn=teeth*4)  
        polygon([[0,0],[pulley_OD/2 + sides,0],[pulley_OD/2 , sides],[0 , sides],[0,0]]);
    } 
}

pulley();