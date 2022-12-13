//Class for the Eggdog boss on the final stage
class BossEnemy extends MovingObject
{
 //Fields
 int HP = 50;
 PVector turnPos, turnPos1;
 boolean bossIsDead;
 
 ArrayList <EnemyProjectile> Bossenemyprojectile = new ArrayList<EnemyProjectile>();
  
  
 //Methods  
 void update()
 {
 pos.add(vel);
 checkBoundaries();
 
 if (deathTimer > 0) deathTimer--;
 }
 
 void dead()
 {
 deathTimer = 60;
 }
 
 void killed()
 {
 bossIsDead = true;
 BossEnemy.remove(this);
 }
 
 void death()
 { 
 bossIsDead = true;
 }
  
 
 void checkBoundaries()  //Boss Enemy's platforms will translate horizontally //and vertically
 {
  if (pos.x > turnPos.x)
  {
  vel.x = -vel.x;
  }
  if (pos.x < turnPos.y) 
  {
  vel.x = -vel.x;
  }
  
  if (pos.y > turnPos1.x)
  {
  vel.y = -vel.y;
  }
  if (pos.y < turnPos1.y) 
  {
  vel.y = -vel.y;
  }
 } 

 

 boolean BossEnemyCollision(player player)
 {
 return (abs((pos.x) - (player.pos.x)) < (150/2 + 55/2) && 
         abs((pos.y) - (player.pos.y)) < (200/2 + 150/2));  
 }
 
 boolean BossEnemyCrouchCollision(player player)
 {
 return (abs((pos.x) - (player.pos.x)) < (150/2 + 150/2) && 
         abs((pos.y) - (player.pos.y + 55)) < (200/2 + 55/2));  
 }
 
 
 
void drawBossEnemy()
{
pushMatrix();
translate(pos.x, pos.y);
stroke(0);
strokeWeight(2);

fill(255);

//Left leg
rect(610, 400, 25, 60, 100);
rect(590, 435, 45, 25, 100);
rect(592, 445, 10, 15, 100);
rect(602, 445, 10, 15, 100);
rect(612, 445, 10, 15, 100);

//body
ellipse(640, 330, 130, 180);

//Right leg
rect(648, 395, 25, 70, 100);
rect(628, 440, 45, 25, 100);
rect(630, 450, 10, 15, 100);
rect(640, 450, 10, 15, 100);
rect(650, 450, 10, 15, 100);


fill(0);
ellipse(600,270,15,15);
ellipse(625,280,15,15);
fill(255);
arc(600,300,60, 50, radians(-270),radians(-70));
fill(0);
ellipse(577,295,12,15);
noFill();
strokeWeight(3);
arc(602,305,63, 30, radians(-270),radians(-160));
arc(610,320,15, 15, radians(-270),radians(-90));

popMatrix();
}

 
  
void drawBossDyingEnemy()
{
   
   
}
  
  
  
  
  
  
//Constructor
BossEnemy(PVector pos, PVector vel, PVector dim, PVector turnPos, PVector turnPos1, int HP)
{
super(pos, vel, dim, 0);
this.pos=pos;
this.turnPos = turnPos;
this.turnPos1 = turnPos1;
this.HP = HP;
}
  
  
}
