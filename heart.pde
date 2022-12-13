//Class for the heart HP item
class heart
{
//Fields
PVector pos;
PVector dim;

//Methods
void drawHeart()
{
pushMatrix();
image(heartPowerUp, pos.x, pos.y, dim.x, dim.y); 
//translate(pos.x,pos.y);
popMatrix();
}


boolean heartCollision(player player)
{
return (abs((pos.x - 600 ) - (player.pos.x)) < (dim.x/2 + 50/2)) &&
        abs((pos.y - 400) - (player.pos.y)) < (dim.y/2 + 85/2);
}

boolean heartCrouchingCollision(player player)
{
return (abs((pos.x - 600) - (player.pos.x)) < (dim.x/2 + 125/2)) &&
        abs((pos.y - 400) - (player.pos.y)) < (dim.y/2 + 50/2);
}


//Constructor
heart(PVector pos, PVector dim)
{
this.pos=pos;
this.dim=dim;
}
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
