//Class to control the saw projectile on each level
class saw extends MovingObject
{
//Fields
PVector pos, vel, dim, turnPos ,turnPos1;
float RotationPosition = PI;
float RotationVelocity = 0.15; //0.07


//Methods
void update()
{ 
pos.add(vel);
checkPlatformEdges(); 

RotationPosition += RotationVelocity;
}


void checkPlatformEdges()
{
//Use PVector TurnPos for the x axis of movement for the saw
if (pos.x > turnPos.x)  //350 //platform.dim.x
{
vel.x = -vel.x;
RotationVelocity = -RotationVelocity;
}

if (pos.x < turnPos.y) //80 //-dim.x
{
vel.x = -vel.x;
RotationVelocity = -RotationVelocity;
}

//Use PVector TurnPos1 for the y axis of movement for the saw
if (pos.y > turnPos1.x) 
{
vel.y = -vel.y;
}

if (pos.y < turnPos1.y) 
{
vel.y = -vel.y;
}

}


boolean sawCollision(player player)
{
 return (abs((pos.x - 25) - (player.pos.x)) < (70/2 + 55/2) && 
         abs((pos.y - 70) - (player.pos.y)) < (70/2 + 85/2));  
}

boolean sawCrouchingCollision(player player)
{
return (abs((pos.x ) - (player.pos.x)) < (70/2 + 150/2)) &&
        abs((pos.y - 80) - (player.pos.y)) < (70/2 + 50/2);
}



void drawSaw()
{
pushMatrix();
translate(pos.x, pos.y);
  
translate(625, 340); //Center of rotation
rotate(RotationPosition);
translate(-625,-340);
  
pushMatrix();
strokeWeight(2);

fill(102, 102, 102);

noStroke();

stroke(0);
ellipse(625,340,50,50);

triangle(610,320,625,290,640,320);
triangle(610,360,625,390,640,360);
triangle(645,325,675,340,645,355);
triangle(605,325,575,340,605,355);
triangle(605,325,575,340,605,355);

triangle(625,320,605,340,590,305);
triangle(645,340,625,360,660,375);
triangle(645,340,625,320,660,305);
triangle(590,375,605,340,625,360);

fill(140,140,140);
ellipse(625,340,20,20);

popMatrix();
popMatrix();
}
  


//Constructor
saw(PVector pos, PVector vel, PVector dim, PVector turnPos, PVector turnPos1)
{
super(pos, vel, dim, 0);
this.pos=pos;
this.vel=vel;
this.turnPos=turnPos;
this.turnPos1=turnPos1;
}

}
