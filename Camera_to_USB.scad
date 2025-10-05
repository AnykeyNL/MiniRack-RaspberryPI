
$fn=180;


rotate([90,0,0])
translate([-27/2,0,0])
camera();

difference(){
hull(){
translate([-22/2,0,0])
cube([22,1,10]);
translate([-17/2,10,0])
cube([17,2,10]);
}
translate([-15/2,10,0])
cube([15,16,10]);
}

translate([-15/2-0.25,12,0])
cylinder(h=10,d=1.5);
translate([15/2+0.25,12,0])
cylinder(h=10,d=1.5);

translate([-12.5/2,10,0])
cube([12.5,10,2.4]);

module camera(){
difference(){
cube_r(25+2,24+1,7,2.5);
translate([1,1,2])
cube_r(25,28,4.4,2.5);
translate([1.5,1,6.2])
cube_r(24,28,4.4,2.5);
}
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
