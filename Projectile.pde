//Handles Player throwing projectile 
class projectile extends MovingObject
{
  //Fields
  PVector pos, vel;
  boolean isAlive;
  boolean bossIsDead;
  
  int deathTimer = -1;
  
  float RotationPosition = PI;
  float RotationVelocity = 0.25;
  
  //Methods
  void drawMe()
  {
  //Draw the throwing star projectile
  drawThrowingStar();
  RotationPosition += RotationVelocity;
  }
  
  void update()
  {
  moveThrowingStar();
  checkWalls();
  drawMe();
  }
  
  void moveThrowingStar()
  {
  pos.add(vel);
  }
  
  
  void drawThrowingStar()
  {
   pushMatrix();
   translate(pos.x + 2,pos.y - 20); 
   
   translate(625, 345); //Center of rotation
   rotate(RotationPosition);
   translate(-625,-345);
   
   
   strokeWeight(2);
   fill(102, 102, 102);
   noStroke();
   rect(620,340,13,13);

   stroke(0);
   triangle(620,340,626,320,632,340);
   triangle(620,350,626,370,632,350);
   triangle(620,340,600,345,620,350);
   triangle(632,340,652,345,632,350);
   ellipse(626,345,20,20);
   ellipse(626,345,10,10);

   popMatrix(); 
  }
  
  //move
  
  
  
  
  
  //Detecting when throwing stars go out of bounds
  void checkWalls()
  {
  if (abs(pos.x) > 2100 ||abs(pos.y) > 800) //make sure height is correct to accomodate eggdog's projectile
  {
  isAlive = false;
  } 
  }
  
  
  void hitBasicEnemy(BasicEnemy BasicE)
  {
  if (BasicE.deathTimer == -1 &&
      abs((pos.x) - (BasicE.pos.x)) < (50/2 + 75/2) &&
      abs((pos.y) - (BasicE.pos.y)) < (50/2 + 75/2))
      {
        isAlive = false;
        
        BasicE.HP--;
      }
      
      if (BasicE.HP == 0)
      {
       BasicE.dead();
       BasicE.drawBasicDyingEnemy();
       
       BasicE.killed();
      }  
  }
  
  
  void hitBossEnemy(BossEnemy BossE)
  {
     if (BossE.deathTimer == -1 &&
     abs((pos.x) - (BossE.pos.x + 40)) < (50/2 + 150/2) &&
     abs((pos.y) - (BossE.pos.y)) < (50/2 + 200/2))
     {
       isAlive = false;
        
       BossE.HP--;
     }
      
     if (BossE.HP == 0)
     {
     BossE.dead();
     BossE.drawBossDyingEnemy();
       
     BossE.killed();
     BossE.death();
     }  
    
  }
  
  
  
  
  //Constructor
  projectile(PVector pos, PVector vel, PVector dim)
  {
  super(pos, vel, dim, 0);
   this.pos = pos;
   this.vel = vel;
   isAlive = true;
   //bossIsDead = true;
  }
  
  
  
}
