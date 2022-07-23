
void setup() {
  size(600,750);
  noStroke();
  noLoop();
}

void draw() {
  background(255);
  fill(0);
  rect(width/2,0,width/2,height);
  drawyinyang(width/2, height/2, 270, 255, 0, true, 0.4, 7);
}

void drawyinyang(
    float posx, 
    float posy, 
    float r, 
    color c1, 
    color c2,
    boolean invert,
    float scale,
    int depth
    ) 
{
  if (depth == 0) return;
  
  if (invert) {
    // change color order for static renders to see two main patterns
    // you can set invert to false and see both patterns anyways while animating the rotation
    var c = c1;
    c1 = c2;
    c2 = c;
  }
  pushMatrix();
  translate(posx, posy);
  fill(c1);
  arc(0, 0, 2*r, 2*r, PI/2, 3*PI/2); // left tail
  fill(c2);
  arc(0, 0, 2*r, 2*r, -PI/2, PI/2);  // right tail
  arc(0, -r/2, r, r, PI/2, 3*PI/2);  // right head
  fill(c1);
  arc(0, r/2, r, r, -PI/2, PI/2);    // left head
  
  // recursively draw children
  drawyinyang(0, -r/2, r*scale, c1, c2, invert, scale, depth-1);
  drawyinyang(0, r/2, r*scale, c1, c2, invert, scale, depth-1);
  popMatrix();
}
