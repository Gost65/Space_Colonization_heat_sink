//Pierre Lesbats
//York University
//credit: Daniel Shiffman

//The goal of this code is to generate a heat sink with the space colonization 
//algorithm in order to make the best shape of a heat sink.
//Using the algorithm to make a tree, the trees generated will be used as a heat sink.

//Import
import nervoussystem.obj.*;
import peasy.*;
Tree tree;
PeasyCam cam;


//Parameters
boolean record = false; //for Obj file
float min_dist = 5; //for the tree
float max_dist = 250; //for the tree

//Defining the visualization
void setup() {
  size(600, 600,P3D); //largeur, hauter
  cam = new PeasyCam(this, 300);
  tree = new Tree(); //makig a new tree
}

//Definig the display
void draw() {
  //Obj converter
  if(record) {
    beginRecord("nervoussystem.obj.OBJExport", "tree_400x400x245.obj");
  }
    background(51);
    //Tree generation
    tree.show();
    tree.grow();
    
  if (record) {
    endRecord();
    record = false;
  }
}

void keyPressed()
{
  //Saving the tree when 's' is pressed
  if (key == 's') {
    record = true;
    println("obj file generated");
  }
}
