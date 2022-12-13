//Class for input commands
float speed = 1.5; //1.5 //2

PVector upMove = new PVector (0, -speed * 60);
PVector downMove = new PVector (0, speed);
PVector leftMove = new PVector (-speed, 0);
PVector rightMove = new PVector (speed, 0);

boolean up, down, left, right, space;

float grav = 3;
PVector gravForce = new PVector(0,grav);

void keyPressed()
{
  if (key==CODED) 
  {
    if (keyCode==LEFT) left=true;
    if (keyCode==RIGHT) right=true;
    if (keyCode==UP) up=true; 
    if (keyCode==DOWN) down=true;
  }  
    if (key==' ') 
    {
     player.fire();
     space = true;
    }
}

void keyReleased()
{
  if (key==CODED) {
    if (keyCode==LEFT) left=false;
    if (keyCode==RIGHT) right=false;
    if (keyCode==UP) up=false;
    if (keyCode==DOWN) down=false;
  }   
  
   if (key==' ') 
    {
     space = false;
    }
}
