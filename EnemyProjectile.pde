//Projectile class to control enemy projectile
class EnemyProjectile
{
  //Fields
  PVector pos, vel;
  boolean isAlive; //Check to see if the projectile is out of bounds or not
  int fireRate;
  
  int deathTimer = -1;
  
  float RotationPosition = PI;  //Starting point for the rotating projectile
  float RotationVelocity = -0.25;  //Velocity at which the rotating projectile spins
  
  //Methods
  void drawMe()
  {
  //Draw the egg projectile
  drawEgg();
  RotationPosition += RotationVelocity;
  }
  
  void update()
  {
  moveEgg();
  checkWalls();
  }

    

    
  void moveEgg()
  {
  pos.add(vel);
  }
  
  
  void drawEgg()
  {
   pushMatrix();
   translate(pos.x + 2,pos.y - 20); 
   
   //translate(625, 345); //Center of rotation
   //rotate(RotationPosition);
   //translate(-625,-345);
   
   
   strokeWeight(2);
   fill(242, 242, 242);
   stroke(0);
   ellipse(626,345,20,20);
   arc(626,345,20,30,radians(270), radians(90));
   popMatrix(); 
  }
  
  
  
  
  
  
  
  
  //Detecting when eggs go out of bounds
  void checkWalls()
  {
  if (abs(pos.x) > 2100 ||abs(pos.y) > 800) 
  {
  isAlive = false;
  } 
  }
  
  
  void hit(player P)
  {
  if (P.deathTimer == -1 &&
      abs((pos.x) - (P.pos.x)) < (50/2 + 150/2) &&
      abs((pos.y) - (P.pos.y)) < (50/2 + 50/2))
      {
        isAlive = false;
        P.HP--;
      }     
  }
  
  
   
  
 //Constructor
 EnemyProjectile(PVector pos, PVector vel, int fireRate)
 {
  this.pos = pos;
  this.vel = vel;
  this.fireRate = fireRate;
  isAlive = true;
 } 
}
