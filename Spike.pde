//Class for the spike obstacle
class Spike
{
//Fields
PVector pos;

//Methods
void update()
{ 
  
  
}

boolean floorSpikeCollision(player player)
{
return (abs((pos.x + 40) - (player.pos.x)) < (80/2 + 50/2)) &&
        abs((pos.y - 60) - (player.pos.y)) < (50/2 + 85/2);
}
boolean floorCrouchingSpikeCollision(player player)
{
return (abs((pos.x + 60) - (player.pos.x)) < (80/2 + 160/2)) &&
        abs((pos.y - 60) - (player.pos.y)) < (50/2 + 50/2);
}


boolean leftSpikeCollision(player player)
{
return (abs((pos.x + 40) - (player.pos.x)) < (50/2 + 50/2)) &&
        abs((pos.y - 30) - (player.pos.y)) < (80/2 + 85/2);
}
boolean leftCrouchingSpikeCollision(player player)
{
return (abs((pos.x + 40) - (player.pos.x)) < (50/2 + 85/2)) &&
        abs((pos.y - 30) - (player.pos.y)) < (80/2 + 50/2);
}


boolean rightSpikeCollision(player player)
{
return (abs((pos.x + 40) - (player.pos.x)) < (50/2 + 50/2)) &&
        abs((pos.y - 50) - (player.pos.y)) < (80/2 + 85/2);
}
boolean rightCrouchingSpikeCollision(player player)
{
return (abs((pos.x + 40) - (player.pos.x)) < (50/2 + 85/2)) &&
        abs((pos.y - 50) - (player.pos.y)) < (80/2 + 50/2);
}


boolean ceilingSpikeCollision(player player)
{
return (abs((pos.x + 40) - (player.pos.x)) < (80/2 + 50/2)) &&
        abs((pos.y - 60) - (player.pos.y)) < (50/2 + 85/2);
}
boolean ceilingCrouchingSpikeCollision(player player)
{
return (abs((pos.x + 40) - (player.pos.x)) < (80/2 + 85/2)) &&
        abs((pos.y - 60) - (player.pos.y)) < (50/2 + 50/2);
}




void floorSpikes()
{
pushMatrix();  
translate(pos.x, pos.y);
stroke(0);
fill(179, 179, 179);
triangle(640,350, 660,300,680,350);
triangle(680,350, 700,300,720,350); 
popMatrix();
}

void wallSpikesLeft()
{
pushMatrix();  
translate(pos.x, pos.y);
stroke(0);
fill(179, 179, 179);
triangle(700,370,650,390,650,350); 
triangle(700,330,650,350,650,310); 
popMatrix();
}

void wallSpikesRight()
{
pushMatrix();  
translate(pos.x, pos.y);
stroke(0);
fill(179, 179, 179); 
triangle(700,290,650,310,700,330); 
triangle(700,330,650,350,700,370); 
popMatrix();   
}

void ceilingSpikes()
{
pushMatrix();  
translate(pos.x, pos.y);
stroke(0);
fill(179, 179, 179);
triangle(640,250, 660,300,680,250);
triangle(680,250, 700,300,720,250); 
popMatrix();  
}
  
//Constructor
Spike(PVector pos)
{
this.pos=pos;
}

}
