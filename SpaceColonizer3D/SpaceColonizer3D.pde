//Pierre Lesbats
//York University
//credit: Daniel Shiffman

//The goal of this code is to generate heat sink with the space colonization 
//algorithm in order to make the best shape of heat sink.
//Using the algorithmto make tree, the trees generated wil be used as heat sink

//Import
import nervoussystem.obj.*;
import peasy.*;
Tree tree;
PeasyCam cam;


//Parameters
boolean record = false; //for Obj file
float min_dist = 5; //for the tree
float max_dist = 250; //for the tree

//Defining my setup
void setup() {
  size(500, 500,P3D); //largeur, hauter
  cam = new PeasyCam(this, 500);
  tree = new Tree(); //makig a new tree
}

//Definig my display
void draw() {
  //Obj converter
  if(record) {
    beginRecord("nervoussystem.obj.OBJExport", "my_tree_report.obj");
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
  //Saing the tree when s is pressed
  if (key == 's') {
    record = true;
    println("obj file generated");
  }
}
