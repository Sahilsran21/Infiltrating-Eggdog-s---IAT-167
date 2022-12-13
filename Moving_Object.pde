//Superclass that defines all moving objects in the game
class MovingObject
{
  //fields
  PVector pos, vel, dim;
  float HP;
  
  float damp=0.8;
  int deathTimer = -1;
  int projectileTimer = -1;
  boolean isAlive;
  boolean isDead;
  
  boolean bossIsDead;
  
  //Methods
  void moveCharacter()
  {
  if (left) player.accelerate(leftMove);
  if (right) player.accelerate(rightMove);   
  }
  
  
  void update()
  {
  vel.mult(damp);
  pos.add(vel);
  
  moveCharacter();
  //checkSpikes();
  }
  
  void accelerate(PVector speed)
  {
  vel.add(speed);  
  }
  
  void dead()
  {
  deathTimer = 60;
  vel.x = 0;
  vel.y = 0;
  }
  
  boolean isDead()
  {
    return deathTimer == 0;
  }
  
  
  void checkWalls()
  {
  //Statement to have object unable to surpasses horizontal screen boundaries
    if (pos.x > 2000) 
    {
      pos.x = 2000 ;
    }
    if (pos.x < -600) 
    {
      pos.x = -600;
    }
  }
  
  
  void bossCheckWalls()
  {
  //Statement to have object unable to surpasses horizontal screen boundaries
    if (pos.x > 750) 
    {
      pos.x = 750 ;
    }
    if (pos.x < -600) 
    {
      pos.x = -600;
    }
  }
  
  
  
  
  
  
  
  
  
  
  //Constructor
  MovingObject (PVector pos, PVector vel, PVector dim, float HP)
  {
  this.HP = HP; 
  this.pos=pos;
  this.vel=vel;
  this.dim=dim;
  }
  
}
