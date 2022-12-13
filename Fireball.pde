//Class to control the fireball projectile on each level
class fireball extends MovingObject
{
//Fields
PVector pos, vel, turnPos;
float RotationPosition = PI;
float RotationVelocity = 0.15;

//Methods
void update()
{
pos.add(vel);
checkBoundaries(); 


RotationPosition += RotationVelocity;
}
 
 
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
   
}
 
 

boolean fireballCollision(player player)
{
 return (abs((pos.x + 1410) - (player.pos.x)) < (80/2 + 55/2) && 
         abs((pos.y - 100) - (player.pos.y)) < (80/2 + 150/2));  
}
 
boolean fireballCrouchingCollision(player player)
{
 return (abs((pos.x + 1420) - (player.pos.x)) < (80/2 + 165/2) && 
         abs((pos.y - 100) - (player.pos.y)) < (80/2 + 55/2));  
}
 


void drawFireball()
{
pushMatrix();
translate(pos.x,pos.y);

translate(2245, 185); //Center of rotation
rotate(RotationPosition);
translate(-450,-450);

pushMatrix();
strokeWeight(2);
stroke(0);
fill(255, 128, 0);
ellipse(640,360,80,80);

noStroke();
fill(255, 184, 77);
ellipse(640,360,60,60);

fill(255, 204, 128);
ellipse(640,360,30,30);

popMatrix();
popMatrix();  
}





  
//Constructor
fireball(PVector pos, PVector vel, PVector dim, PVector turnPos, float RotationPosition, float RotationVelocity )
{
super(pos, vel, dim, 0);
this.pos=pos;
this.vel=vel;
this.turnPos=turnPos;
this.RotationPosition = RotationPosition;
this.RotationVelocity = RotationVelocity;
}
}
