//The tree is composed by branches and leaves.
//This code defines the leaves
class Leaf {
  PVector pos;
  boolean reached = false;

  Leaf() {
    pos = PVector.random3D(); //the leaves re generated randomly on the space.
    pos.mult(random(width/2));
    pos.y -= height/2; //where the leaves are generated. not where the tree begins
  }

  void reached() {
    reached = true;
  }
//Graphical part of the leaves to display them on the screen
  void show() {
    fill(255);
    noStroke();
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    ellipse(0,0, 4, 4);
    popMatrix();
  }
}
