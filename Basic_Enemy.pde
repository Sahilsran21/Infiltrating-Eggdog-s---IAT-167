//Class to define the Basic enemies who sit on the platforms
class BasicEnemy extends MovingObject
{
 //Fields
 int HP = 2;
 PVector turnPos;
 
 //ArrayList <EnemyProjectile> BasicEnemyprojectile = new ArrayList<EnemyProjectile>();
  
  
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
 BasicEnemy.remove(this);
 }
  
 void checkBoundaries()  //BasicEnemy's platforms will only translate horizontally
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
 
  
 void spawn()
 {
   
   
   
 }
 
 // if issues, figure out this one
 boolean basicEnemyCollision(player player)
 {
 return (abs((pos.x) - (player.pos.x)) < (75/2 + 55/2) && 
         abs((pos.y) - (player.pos.y)) < (75/2 + 150/2));  
 }
 
 boolean basicEnemyCrouchCollision(player player)
 {
  return (abs((pos.x) - (player.pos.x)) < (75/2 + 150/2) && 
          abs((pos.y) - (player.pos.y + 55)) < (75/2 + 55/2)); 
 }
 

//void fire()
//{
//BasicEnemyprojectile.add(new EnemyProjectile(new PVector(pos.x + 70, pos.y - 5), new PVector(-16,0))); 
//}

 
void checkProjectile()
{
   
   
}
  
 
 
void drawBasicEnemy()
{
pushMatrix();
translate(pos.x, pos.y);

stroke(0);
strokeWeight(3);

fill(255); 
arc(638, 340, 75, 75, radians(-180), radians(0));

fill(0);
ellipse(620,315,10,10);
ellipse(638,318,10,10);

noFill();
strokeWeight(2);
arc(620,325,15, 20, radians(-340),radians(-180));
arc(635,327,15, 20, radians(-340),radians(-180));


fill(255);
strokeWeight(3);
pushMatrix();
translate(width/2, height/2);
rotate(-13);
translate(-1265,-722);

rect(620, 315, 30, 20, 50);


popMatrix();
popMatrix();
}
 
  
 void drawBasicDyingEnemy()
 {
   
   
 }
  
  
  
  
  
  
//Constructor
BasicEnemy(PVector pos, PVector vel, PVector dim, PVector turnPos, int HP)
{
super(pos, vel, dim, 0);
this.pos = pos;
this.turnPos = turnPos;
this.HP=HP;
}
  
  
}
