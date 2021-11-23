//The tree is composed of branches and leaves.
//This code defines the leaves
//Here I define the volume where the tree will grow.
//Apply a factor scale of 10 of your own value to generate a better 3D model.

//For my experiment my heat sink has 40X40mm and 24.5mm in height.
int my_height = 245;
int my_length = 400;
int my_width = 400;

class Leaf {
  PVector pos;
  boolean reached = false;

  Leaf() {
    //Here to modify the volume where the leaves appear:
    //we generate a vector that is the leaf coordinate in the space
    pos = PVector.random3D();//the leaves are generated randomly on the space.
    
    pos.x= random(-my_length/2,my_length/2); //x coordinate
    pos.y= random(-my_height); //y coordinate put - to grow on the good way
    pos.z= random(-my_width/2,my_width/2); //z coordinate
    
    //pos.y -= height/4;//where the leaves are generated in height not where the tree begins
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
