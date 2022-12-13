//Class to control and manipulate the movement of platforms in the game
class platform extends MovingObject
{
//Fields
PVector pos, vel, dim, turnPos, turnPos1;

//turnPos and turnPos1 is used to setup boundaries for how far each platform can move until it must turn back, if it's given velocity properties.
//turnPos is used for x-axis and turnPos1 for y-axis


void update()
{   
pos.add(vel);
checkBoundaries();
}


//Use turnPos to control x axis
void checkBoundaries()
{
if (pos.x > turnPos.x)  
{
vel.x = -vel.x;
}

if (pos.x < turnPos.y)
{
vel.x = -vel.x;
}

//Use turnPos1 to control y axis
if (pos.y > turnPos1.x)  
{
vel.y = -vel.y;
}

if (pos.y < turnPos1.y)
{
vel.y = -vel.y;
}





}


//Methods
boolean isOn(player p)
{
  if (abs((pos.x - p.pos.x)) < (p.dim.x / 2) + (dim.x / 2))
  {
    return true;
  }
  return false; 
}


boolean check(player p)
{
  if (abs((pos.x - p.pos.x)) < (p.dim.x / 2) + (dim.x / 2) &&
      abs(p.pos.y - pos.y + 40) < (p.dim.y / 2) + (dim.y / 2))
  {
      return true;
  }
  return false; 
}



 void drawPlatform(player p)
 {
 pushMatrix();
 //No need for p.position here because everything can be translated together
 //This also fixes the issues of the hidden platforms moving as well 
 //(unless I want to create depth with 2 different speeds
 translate(pos.x,pos.y);  
 fill(92, 138, 138);
 stroke(0);
 strokeWeight(3);
 arc(640,360,dim.x,dim.y,radians(0), radians(180));
 popMatrix();
 }
 
 




//Constructor
 platform(PVector pos, PVector vel, PVector dim, PVector turnPos, PVector turnPos1, float HP)
 {
 super(pos,vel,dim,HP);
 this.pos=pos;
 this.vel=vel;
 this.dim=dim;
 this.turnPos=turnPos;
 this.turnPos1=turnPos1;
 }
}
