use <agentscad/mx-screw.scad>
use <agentscad/mx-thread.scad>

$fn=180;
inner_w = 222;  // Width within the rack
outer_w = 254;  // Total with, including mounting
UH = 43.66;     // height of a UH unit
mount_d = 6.5;  // rack mount hole diameter
mount_margin = 8.7375;

frontpanel_thick = 3;

//color("yellow", alpha= 0.5)
front();

//color("blue", alpha= 0.5)
//translate([5,0,8])
//drawer();

//translate([-106,0,8])
//drawer();


module drawer(){
 difference(){
 union(){
 hull(){
 rotate([90,0,0])
 //translate([5,5,-110])
 translate([0,0,-110])
 cylinder(d=3.5, h=113);

 rotate([90,0,0])
 //translate([106,5,-110])
 translate([101,0,-110])
 cylinder(d=3.5, h=113);
 }
 
 translate([40.5,-10,-1.75])
 cube_r(20,20,3.5,5); 
 }
 translate([40,-10,-1.75])
 cube([0.5,30,3.5]);
 translate([60,-10,-1.75])
 cube([0.5,30,3.5]);
 
 #translate([50,110,-1.75])
 #rotate([90,0,0])
 #cylinder(h=105,d=4);
 
 #translate([50,5,-1.75])
 sphere(d=4);
 
 #translate([50,0,-1.75])
 sphere(d=5);
 
 
}
 
 translate([95,23.5,1.5])
 pin(5);
 translate([95,23.5+58,1.5])
 pin(5);
 translate([95-49,23.5,1.5])
 pin(5);
 translate([95-49,23.5+58,1.5])
 pin(5);
 
 translate([95-49-18.5,23.5,1.5])
 pin(6.5);
 translate([95-49-18.5-17,23.5,1.5])
 pin(6.5);


 

}

module pin (h){
 difference(){
  cylinder(d=6,h=h);
  cylinder(d=2.2,h=h);
  //screw  = M2_5();
  //mxThreadExternal(screw);
 }
}


module front(){
translate([-outer_w/2,0,0])
rotate([90,0,0])
 difference(){
    union(){
    cube_r(outer_w, UH, 3, 5);
    //Frame Walls    
    translate([outer_w/2-5,0,-110]) 
    cube([10,UH,110]);
    translate([outer_w/2-111,0,-110]) 
    cube([5,UH,110]);
    translate([outer_w/2+111-5,0,-110]) 
    cube([5,UH,110]);
    // floor
    translate([outer_w/2-111,0,-110]) 
    cube([222,2,110]);
    }
 // Left mounting holes
 translate([mount_margin,6.35,0])
 cylinder(d=mount_d,h=frontpanel_thick); 
 translate([mount_margin,6.35+31.75,0])
 cylinder(d=mount_d,h=frontpanel_thick); 
 
 // Right mounting holes
 translate([outer_w-mount_margin,6.35,0])
 cylinder(d=mount_d,h=frontpanel_thick); 
 translate([outer_w-mount_margin,6.35+31.75,0])
 cylinder(d=mount_d,h=frontpanel_thick); 
 
 // Slide holes
 translate([outer_w/2+111-5,5,-110])
 cylinder(h=115,d=4);
    translate([outer_w/2+5,5,-110])
    cylinder(h=115,d=4);
    translate([outer_w/2-5,5,-110])
    cylinder(h=115,d=4);
 translate([outer_w/2-111+5,5,-110])
 cylinder(h=115,d=4);
 
 // Unit holes
 translate([outer_w/2-106,3,-3])
 cube([101,UH-6,10]);
 translate([outer_w/2+5,3,-3])
 cube([101,UH-6,10]);
 }
 
 // lock pin
 #translate([55,0,3])
 #sphere(d=3.5);
 #translate([55,0,1])
 #cylinder(d=3.5,h=2);

 #translate([-56,0,3])
 #sphere(d=3.5);
 #translate([-56,0,1])
 #cylinder(d=3.5,h=2);
 
 
 
}


// Create cube with round corners
module cube_r(x,y,h,r){
  hull(){
  translate([r,r,0])
  cylinder(r=r, h=h);
  translate([x-r,r,0])
  cylinder(r=r, h=h);
  translate([r,y-r,0])
  cylinder(r=r, h=h);
  translate([x-r,y-r,0])
  cylinder(r=r, h=h);
  }
}

