//Import
import nervoussystem.obj.*;
import peasy.*;

//SetUp
Tree tree;
PeasyCam cam;

//Parameters
boolean record = false; //for Obj file
float min_dist = 5; //for the tree
float max_dist = 250; //for the tree

void setup() {
  size(400, 400,P3D);
  cam = new PeasyCam(this, 500);
  tree = new Tree();
}

void draw() {
  //Obj converter
  if(record) {
    beginRecord("nervoussystem.obj.OBJExport", "my_tree_small.obj");
  }
    background(51);
    tree.show();
    tree.grow();
    
  if (record) {
    endRecord();
    record = false;
  }
}

void keyPressed()
{
  if (key == 's') {
    record = true;
    println("obj file generated");
  }
}
