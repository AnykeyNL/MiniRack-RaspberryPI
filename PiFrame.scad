// 10" Rack Mount for 2 Raspberry PI's on individual slides
// 
// Designed for easy 3D Printing
// no overhangs and 0.2mm layer height is perfectly fine
//
// Designed by the.anykey@gmail.com

$fn=180;

inner_w         = 222;      // Width within the rack
outer_w         = 254;      // Total with, including mounting
UH              = 43.66;    // height of a UH unit
mount_d         = 6.5;      // rack mount hole diameter
mount_margin    = 8.7375;   // Distance for mount holes from side
depth           = 88;       // Depth of the slides and frame
frontpanel_thick= 3;        // Front panel thickness

// Drawer types - ONLY ENABLE! 
// https://deskpi.com/products/deskpi-kl-p24-raspberry-pi-adapter-board
//drawer_type     = "DeskPI";    

// https://www.waveshare.com/wiki/Pi5-Connector-Adapter
drawer_type     = "WaveShare"; 
                            
// INSTRUCTIONS:
// Remark out the components you do not want. 

// Show front panel
front();

// Show right drawer
translate([5,-50,5])
drawer();

// Show right drawer
translate([-106,0,5])
drawer();


module drawer(){
 difference(){
 union(){
 hull(){
 rotate([90,0,0])
 
 // Rounded sides
 translate([0,0,-depth+3])
 cylinder(d=3.5, h=depth);

 rotate([90,0,0])
 translate([101,0,-depth+3])
 cylinder(d=3.5, h=depth);
 }

 // front flex handle
 translate([40.5,-10,-1.75])
 cube_r(20,20,3.5,5); 
 }
 // Handle side cutouts
 translate([40,-10,-1.75])
 cube([0.5,30,3.5]);
 translate([60,-10,-1.75])
 cube([0.5,30,3.5]);
 
 // Middle slide grove
 translate([50,110,-1.75])
 rotate([90,0,0])
 cylinder(h=105,d=4);
 translate([50,5,-1.75])
 sphere(d=4);

 // lock hole
 translate([50,0,-1.75])
 sphere(d=4);
 
 // SD Card access area
 translate([95-23-15,23.5+48,-4])
 cube_r(30,30,30,5);
}

 // Mounting pins for Raspberry Pi
 translate([95,23.5,1.5])
 pin(5);
 translate([95,23.5+58,1.5])
 pin(5);
 translate([95-49,23.5,1.5])
 pin(5);
 translate([95-49,23.5+58,1.5])
 pin(5);
 
 if (drawer_type == "DeskPI") {
 // Mounting pins for DeskPi HDMI Breakout
 translate([95-49-18.5,23.5,1.5])
 pin(6.5);
 translate([95-49-18.5-17,23.5,1.5])
 pin(6.5);
 }
  
 if (drawer_type == "WaveShare") {
 // Mounting pins for Waceshare PI5 Connector Adapter Breakout
 translate([95-49-9,23.5,1.5])
 pin(6.5);
 translate([95-49-9-27.5,23.5,1.5])
 pin(6.5);
 
 translate([95-49-9,23.5+58,1.5])
 pin(6.5);
 translate([95-49-9-27.5,23.5+58,1.5])
 pin(6.5);
 
 }
 
 
 
 
}

// Pin module
// Using 2.2mm for hole, 
// this should allow a 2.5mm screw to easily screw in without pre-threading
module pin (h){
 difference(){
  cylinder(d=6,h=h);
  cylinder(d=2.2,h=h);
 }
}

module front(){
translate([-outer_w/2,0,0])
rotate([90,0,0])
 difference(){
    union(){
    cube_r(outer_w, UH, 3, 5);
    //Frame Walls    
    translate([outer_w/2-5,0,-depth]) 
    cube([10,UH,depth]);
    translate([outer_w/2-111,0,-depth]) 
    cube([5,UH,depth]);
    translate([outer_w/2+111-5,0,-depth]) 
    cube([5,UH,depth]);
    // floor
    translate([outer_w/2-111,0,-depth]) 
    cube([222,2,depth]);
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
 translate([outer_w/2+111-5,5,-depth+frontpanel_thick-0.5])
 cylinder(h=115,d=4);
    translate([outer_w/2+5,5,-depth+frontpanel_thick-0.5])
    cylinder(h=115,d=4);
    translate([outer_w/2-5,5,-depth+frontpanel_thick-0.5])
    cylinder(h=115,d=4);
 translate([outer_w/2-111+5,5,-depth+frontpanel_thick-0.5])
 cylinder(h=115,d=4);
 
 // Unit holes
 translate([outer_w/2-106,3,-3])
 cube([101,UH-6,10]);
 translate([outer_w/2+5,3,-3])
 cube([101,UH-6,10]);
 
 // SD Card access area
 translate([49+23+6,10,-depth-15])
 rotate([90,0,0])
 cube_r(30,30,30,5);

 translate([111+49+23+6,10,-depth-15])
 rotate([90,0,0])
 cube_r(30,30,30,5);
 }
 
 // lock pin
 translate([55,0,3.4])
 sphere(d=3.5);
 translate([55,0,1])
 cylinder(d=3.5,h=2.4);

 translate([-56,0,3.4])
 sphere(d=3.5);
 translate([-56,0,1])
 cylinder(d=3.5,h=2.4);
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

