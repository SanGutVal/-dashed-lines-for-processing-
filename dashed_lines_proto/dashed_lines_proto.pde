
Node n1, n2, n3, n4;


void setup() {
  size(800, 600);
  strokeCap(SQUARE);
  
  fill(255, 0, 0, 50);
  strokeWeight(3);

  n1 = new Node(width / 2, height / 2, 5);
  n2 = new Node(3 * width / 4, 3 * height / 4, 5);
  n3 = new Node(width / 2 + 200, height / 2, 5);
  n4 = new Node(width / 2, height / 2 + 200, 4);

  dash(20, 10, 5, 10);  // sets dash size and spacing in pixels
}

void draw() {
  background(255);

  n1.render();
  n2.render();
  n3.render();
  n4.render();

  //drawDashedLine();
  //drawDashedRectangle();
  //drawDashedEllipse();
  drawDashedArc();
  //drawDashedQuad();
  //drawDashedTriangle();
  
}



void mousePressed() {
  if (n1.inside(mouseX, mouseY)) {
    n1.dragged = true;
  } else if (n2.inside(mouseX, mouseY)) {
    n2.dragged = true;
  } else if (n3.inside(mouseX, mouseY)) {
    n3.dragged = true;
  } else if (n4.inside(mouseX, mouseY)) {
    n4.dragged = true;
  }
}

void mouseReleased() {
  n1.dragged = false;
  n2.dragged = false;
  n3.dragged = false;
  n4.dragged = false;
}


///////////////////////////////////////
void drawDashedLine() {
  stroke(0);
  strokeWeight(5);
  dashLine(n1.x, n1.y, n2.x, n2.y);
}

void drawDashedRectangle() {
  rectMode(CORNERS);
  dashRect(n1.x, n1.y, n2.x, n2.y);
}

void drawDashedEllipse() {
  pushStyle();
  ellipseMode(RADIUS);
  dashEllipse(n1.x, n1.y, n2.x - n1.x, n2.y - n1.y);
  popStyle();
}

void drawDashedArc() {
  float alpha13 = atan2(n3.y - n1.y, n3.x - n1.x);
  float alpha14 = atan2(n4.y - n1.y, n4.x - n1.x);

  // Handle lines
  pushStyle();
  strokeWeight(1);
  stroke(127, 127);
  line(n1.x, n1.y, n3.x, n3.y);
  line(n1.x, n1.y, n4.x, n4.y);
  popStyle();
  
  // Processing's native arc: uses thetas instead of polar angles
  pushStyle();
  ellipseMode(RADIUS);
  fill(0, 255, 0, 50);
  noStroke();
  arc(n1.x, n1.y, n2.x - n1.x, n2.y - n1.y, alpha13, alpha14);
  popStyle();
  
  //// Dashed arc implementation: uses same convention
  //noFill();
  //stroke(0);
  //dashArc(n1.x, n1.y, n2.x - n1.x, n2.y - n1.y, alpha13, alpha14);
  
  // Now custom version using polar angles:
  pushStyle();
  fill(255, 0, 0, 50);
  noStroke();
  ellipseMode(RADIUS);
  //noFill();
  stroke(0);
  dashArcPolar(n1.x, n1.y, n2.x - n1.x, n2.y - n1.y, alpha13, alpha14, 0);
  popStyle();
}

void drawDashedQuad() {
  //noFill();
  dashQuad(n1.x, n1.y, n2.x, n2.y, n3.x, n3.y, n4.x, n4.y);
}

void drawDashedTriangle() {
  dashTriangle(n1.x, n1.y, n2.x, n2.y, n3.x, n3.y);
}