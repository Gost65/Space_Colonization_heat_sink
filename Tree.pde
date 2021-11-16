//Here I define my branch with cubes

class Tree {
  ArrayList<Branch> branches = new ArrayList<Branch>();
  ArrayList<Leaf> leaves = new ArrayList<Leaf>();

  Tree() {

    int numb_leaves = 40; //how many leaves I want
    for (int i = 0; i < numb_leaves; i++) {
      leaves.add(new Leaf());
    }
    float starting_height = 10; // I define here the height where the tree starts
    Branch root = new Branch(new PVector(0,starting_height), new PVector(0, -1)); //where the branch begin
    branches.add(root);
    Branch current = new Branch(root);

    while (!closeEnough(current)) {
      Branch trunk = new Branch(current);
      branches.add(trunk);
      current = trunk;
    }
  }

  boolean closeEnough(Branch b) {
    for (Leaf l : leaves) {
      float d = PVector.dist(b.pos, l.pos);
      if (d < max_dist) {
        return true;
      }
    }
    return false;
  }

  void grow() {
    for (Leaf l : leaves) {
      Branch closest = null;
      PVector closestDir = null;
      float record = -1;

      for (Branch b : branches) {
        PVector dir = PVector.sub(l.pos, b.pos);
        float d = dir.mag();
        if (d < min_dist) {
          l.reached();
          closest = null;
          break;
        } else if (d > max_dist) {
        } else if (closest == null || d < record) {
          closest = b;
          closestDir = dir;
          record = d;
        }
      }
      if (closest != null) {
        closestDir.normalize();
        closest.dir.add(closestDir);
        closest.count++;
      }
    }

    for (int i = leaves.size()-1; i >= 0; i--) {
      if (leaves.get(i).reached) {
        leaves.remove(i);
      }
    }

    for (int i = branches.size()-1; i >= 0; i--) {
      Branch b = branches.get(i);
      if (b.count > 0) {
        b.dir.div(b.count);
        PVector rand = PVector.random2D();
        rand.setMag(0.3);
        b.dir.add(rand);
        b.dir.normalize();
        Branch newB = new Branch(b);
        branches.add(newB);
        b.reset();
      }
    }
  }


  void show() {
    for (Leaf l : leaves) {
      l.show();
    }    
    for (int i = 0; i < branches.size(); i++) {
      Branch b = branches.get(i);
      if (b.parent != null) {
        
        //MOST IMPORTANT PARAMETERS
        float thick_starter = 40;//Size of the first cube
        float linear_coeff = 0;
        float distance_smoothing =5; //the branches at the extremity are big when the numbr is hight
        float sw = map(i, linear_coeff, branches.size(), thick_starter, distance_smoothing); //thickness variation
        
        //Original Code
        //strokeWeight(sw);
        //stroke(255); 
        //line(b.pos.x, b.pos.y, b.pos.z, b.parent.pos.x, b.parent.pos.y, b.parent.pos.z);
        //fill(255);
        
        //Solution to export as obj
        //Coordinates of my boxes
        float X = b.pos.x;
        float Y = b.pos.y;
        float Z = b.pos.z;
     
        //float dist_x = Math.round(Math.sqrt(Math.pow(X - b.parent.pos.x,2)+Math.pow(Y - b.parent.pos.y,2)+Math.pow(Z - b.parent.pos.z,2)));
        float dist_x =sw;
        
        //Here we design a cube with its 6 faces
        beginShape(); //FACE 1
        vertex(X, Y, Z); //A
        vertex(X, Y+sw, Z); //B
        vertex(X+sw, Y+sw, Z); //D
        vertex(X+sw, Y, Z);//C
        endShape();
        
        beginShape();//FACE 2
        vertex(X, Y, Z);
        vertex(X, Y+sw, Z);
        vertex(X, Y+sw, Z+dist_x);
        vertex(X, Y, Z+dist_x);
        endShape();
        
        beginShape();//FACE 3
        vertex(X+sw, Y, Z);
        vertex(X+sw, Y+sw, Z);
        vertex(X+sw, Y+sw, Z+dist_x);
        vertex(X+sw, Y, Z+dist_x);
        endShape();
        
        beginShape();//FACE 4
        vertex(X, Y, Z+dist_x);
        vertex(X, Y+sw, Z+dist_x);
        vertex(X+sw, Y+sw, Z+dist_x);
        vertex(X+sw, Y, Z+dist_x);
        endShape();
        
        beginShape();//FACE 5
        vertex(X, Y, Z);
        vertex(X, Y, Z+dist_x);
        vertex(X+sw, Y, Z+dist_x);
        vertex(X+sw, Y, Z);
        endShape();
        
        beginShape();//FACE 6
        vertex(X, Y+sw, Z);
        vertex(X, Y+sw, Z+dist_x);
        vertex(X+sw, Y+sw, Z+dist_x);
        vertex(X+sw, Y+sw, Z);
        endShape();
 //<>//
      }
    }
  }
}
