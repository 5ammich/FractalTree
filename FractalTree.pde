private double fractionLength = .8; 
private int smallestBranch = 8; 
private double branchAngle = .5;  
public  int lengthAdder = 10;
public boolean off = false;
public boolean on = false;
public boolean yes = false;
public void setup() 
{   
  size(1000,1000);    
} 
public void draw() 
{   
  background(0);  
  strokeWeight(2);
  stroke(0,255,0);   
  line(mouseX,mouseY,mouseX,mouseY-100); 
  if (off == true && on == false){
  drawBranches(mouseX,mouseY-100,lengthAdder,2*Math.PI/2); 
  drawBranches(mouseX,mouseY-100,lengthAdder,3*Math.PI/2);  //will add later 
  drawBranches(mouseX,mouseY-100,lengthAdder,5*Math.PI/2);
  drawBranches(mouseX,mouseY-100,lengthAdder,4*Math.PI/2);
    if (lengthAdder < 100){
      lengthAdder +=10; 
    }
    if (yes == true){
      branchAngle+=0.1;
    }
    else if (yes == false){
      branchAngle = 0.5;
    }
  }
  if (off == false && on == true){
    drawBranches(mouseX,mouseY-100,lengthAdder,3*Math.PI/2);
    if (lengthAdder < 100){
      lengthAdder +=10; 
    }
    if (yes == true){
      branchAngle+=0.1;
    }
    else if (yes == false){
      branchAngle = 0.5;
    }
  }

} 
public void mousePressed(){
  if (mouseButton == LEFT){
    off = false;
    on = true;
    lengthAdder = 10;

  }
  else if (mouseButton == RIGHT){
    on = false;
    off = true;
    lengthAdder = 10;
  }
  
}
public void keyPressed(){
  if (key == 'r' || key == 'R'){
    yes = !yes;
    
  }
  
}
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);

  branchLength = branchLength * fractionLength;
  line(x,y,endX1,endY1);
  line(x,y,endX2,endY2);
  if (branchLength > smallestBranch){
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  }
} 
