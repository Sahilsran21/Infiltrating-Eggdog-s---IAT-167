//Class for all player attributes and actions
class player extends MovingObject
{
//Fields
//Inherited from MovingObject class
int HP = MaxHP;
int hitTimer = 0;
boolean jumping = false;
boolean landed = true;
boolean falling = false;

float leftLegRotationPosition = radians(-60);
float leftLegRotationVelocity = -0.25; //-0.175 -0.05
float rightLegRotationPosition = radians(45);
float rightLegRotationVelocity = 0.13; //0.175 //0.026

float backwardsLeftLegRotationPosition = radians(-70);
float backwardsLeftLegRotationVelocity  = 0.23; //0.16 
float backwardsRightLegRotationPosition = radians(20);
float backwardsRightLegRotationVelocity = -0.195; //-0.13

float crouchingLeftLegPosition = -350; //-340
float crouchingLeftLegVelocity = 2.50;
float crouchingRightLegPosition = -330; //-335
float crouchingRightLegVelocity = 2.50;

float rotationPosition = PI/6;
float rotationVelocity = 0.50;

int jumpCount = 0;

platform platform = null;

ArrayList <projectile> projectiles= new ArrayList<projectile>();

//Methods 
void hit()
{
  if (hitTimer == 0)
  {
  HP++;
  hitTimer = 60;
  
    if (HP == 6)
    {
    //loseScreenInitialization();
    //state=LOST;
    
    winScreenInitialization();
    state = WON;
    }
  }
}


void giveLife()
{
//if (hitTimer == 0)
//{
HP--;
//hitTimer = 60;

//println(HP);
//}

//if (hitTimer == 0 && HP <= 0)
}



void move(PVector acc)
{
  vel.add(acc);
}

void jump()
{
  move(upMove);
  jumping = true;
  landed = false;
  falling = false;
}

void landOn(platform p)
{
 jumping = false;
 platform = p;
 pos.y = p.pos.y + -40 - dim.y /2 - p.dim.y / 2;
 vel.y = 0;
}

void fall()
{ 
 falling = true;
 vel.y *= -1; 
}





void fire()
{
//space = true;
 
  
if (up == true && left == false && right == false)
{
projectiles.add(new projectile(new PVector(pos.x + 70, pos.y - 5), new PVector(16,0), new PVector(0,0))); 
} 
if (up == true && left == true)
{
projectiles.add(new projectile(new PVector(pos.x + 70, pos.y - 5), new PVector(10,0), new PVector(0,0))); 
}  
if (up == true && right == true)
{
projectiles.add(new projectile(new PVector(pos.x + 70, pos.y - 5), new PVector(25,0), new PVector(0,0))); 
} 


//if (jumping == true && jumpCount == 1)//up == true && right == true)
//{
//projectile.add(new projectile(new PVector(pos.x + 70, pos.y - 5), new PVector(25,0))); 
//} 


if (down == true && left == false && right == false)
{
projectiles.add(new projectile(new PVector(pos.x + 90, pos.y + 60), new PVector(16,0), new PVector(0,0)));
}
if (down == true && left == true)
{
projectiles.add(new projectile(new PVector(pos.x + 90, pos.y + 60), new PVector(10,0), new PVector(0,0)));
}
if (down == true && right == true )
{
projectiles.add(new projectile(new PVector(pos.x + 90, pos.y + 60), new PVector(25,0), new PVector(0,0)));
}


if (left == true && down == false && up == false)
{
projectiles.add(new projectile(new PVector(pos.x + 65, pos.y - 5), new PVector(10,0), new PVector(0,0))); 
}

if (right == true && down == false && up == false )
{
projectiles.add(new projectile(new PVector(pos.x + 63, pos.y), new PVector(25,0), new PVector(0,0))); //25
}


if (right == true  && left == true)
{
}
if (up == true  && down == true)
{
}
if (up == false && down == false && left == false && right == false)
{
projectiles.add(new projectile(new PVector(pos.x + 60, pos.y - 10), new PVector(16,0), new PVector(0,0)));
}
}


void killed()
{
  
}

void respawn()
{
  
}

void checkprojectile()
{
for (int i=0; i<projectiles.size(); i++)
{
  projectile throwingStar = projectiles.get(i);
  throwingStar.update();
  
  for (int j=0; j<BasicEnemy.size(); j++)
  {
   BasicEnemy BasicE = BasicEnemy.get(j);
   throwingStar.hitBasicEnemy(BasicE);
  }
  
  for (int k=0; k<BossEnemy.size(); k++)
  {
   BossEnemy BossE = BossEnemy.get(k);
   throwingStar.hitBossEnemy(BossE);
  }
  
  if (!throwingStar.isAlive) projectiles.remove(i);
}
}



void update()
{
super.update();
checkprojectile();
//checkLevelBarriers();
legRotation();
crouchLegMovement();
levelClearConditions();


if (state == BOSS_LEVEL)
{
bossCheckWalls();
}
else
{
checkWalls();
}

rotationPosition += rotationVelocity;


if (hitTimer>0) hitTimer--;
}


void legRotation()
{
//Running Leg Rotation
leftLegRotationPosition += leftLegRotationVelocity;
if (leftLegRotationPosition < radians(-60) || leftLegRotationPosition > (radians(45))) 
{
leftLegRotationVelocity = -leftLegRotationVelocity; 
}

rightLegRotationPosition += rightLegRotationVelocity;
if (rightLegRotationPosition < radians(-10) || rightLegRotationPosition > (radians(45))) 
{
rightLegRotationVelocity = -rightLegRotationVelocity; 
}  


//Backwards Running Leg Rotation
backwardsLeftLegRotationPosition += backwardsLeftLegRotationVelocity;
if (backwardsLeftLegRotationPosition < radians(-70) || backwardsLeftLegRotationPosition > (radians(40))) 
{
backwardsLeftLegRotationVelocity = -backwardsLeftLegRotationVelocity; 
}

backwardsRightLegRotationPosition += backwardsRightLegRotationVelocity;
if (backwardsRightLegRotationPosition < radians(-75) || backwardsRightLegRotationPosition > (radians(20))) 
{
backwardsRightLegRotationVelocity = -backwardsRightLegRotationVelocity; 
}  
}


void crouchLegMovement()
{
crouchingLeftLegPosition += crouchingLeftLegVelocity;
if (crouchingLeftLegPosition < -350 || crouchingLeftLegPosition > -330) //-335
{
crouchingLeftLegVelocity  = -crouchingLeftLegVelocity;
}

crouchingRightLegPosition += crouchingRightLegVelocity;
if (crouchingRightLegPosition < -350 || crouchingRightLegPosition > -330) //-340
{
crouchingRightLegVelocity  = -crouchingRightLegVelocity;
} 
  
}



void levelClearConditions()
{
//Conditions to clear the levels
if (pos.x > 1990 && pos.y > -50 && state==LEVEL_ONE) //1990
{
  clearLevel1();
}

if (pos.x > 1990 && state==LEVEL_TWO) //1950
{
  clearLevel2();
}

if (pos.x > 1990 && state==LEVEL_THREE) //1950
{
  clearLevel3();
}

if (state==BOSS_LEVEL && pos.x > 900) //&& BossEnemy.bossIsDead == true 
{
  clearBossLevel();
} 
  

}



void changeMovementState()
{
//Conditional for different player movement states

if(jumping==true && landed==false && jumpCount == 0)
{
drawPlayerJump1(); 
}

if(jumping == true && jumpCount == 1)
{
drawPlayerJump2();  

//if (left == true)
//{
//rotationPosition = -rotationVelocity;
//}
}


if(left==true && landed==true && down == false && right == false) 
{
drawPlayerRunBackwards();
} 
  
if(right==true && landed==true && down == false && left == false)
{
drawPlayerRun();
} 

if(down==true && landed==true)
{
drawPlayerCrouch();
}

if(left == true && right == true && landed == true)
{
drawPlayer();
}
 
if(up==false && down == false && left == false && right == false && landed == true )
{
drawPlayer();
} 
   
}




void playerPhysics()
{
  
if (up && !player.jumping)
{
player.jump(); 
}

//println(player.vel.y);
if(up && player.jumping && player.vel.y > 8  && jumpCount < 1)   //jumping == true && falling == false) //landed == false &&  player.vel.y > 0 
{
player.jump(); 
jumpCount++;
} 

if (left) player.move(leftMove);
if (right) player.move(rightMove);

player.update();

if (player.platform != null)
{
  if (player.platform.isOn(player))
  {
    player.jumping = true;
  }
}

if (player.jumping)
{
  player.move(gravForce);
  for (int i=0; i < platforms.size(); i++) 
  {
    platform p = platforms.get(i);
    if (p.check(player))
    {
      if (player.vel.y > 0)
      {
        player.landOn(p);
        landed = true;
        falling = false;
        jumpCount = 0; 
      }
      
      else 
      {
        player.fall(); 
      }   
    }
  }
} 

//Side-scrolling mechanic

}



void repositionLevel2()
{
  pos.x=-580;
  pos.y=-50;
}

void repositionLevel3()
{
  pos.x=-580;
  pos.y=175;
}

void repositionBossLevel()
{
  pos.x=-580;
  pos.y=-50;
}



void drawPlayer()
{

if (hitTimer %2 == 0);
{ 
  
pushMatrix();
translate(pos.x, pos.y); 
  

strokeWeight(2);

//right leg
fill(0, 53, 102); 
ellipse(652,400,23,75); 
fill(0, 26, 51);
ellipse(652,425,15,20);

//right arm
if (space == true)
{
pushMatrix();
translate(625, 390);
rotate(radians(-100));
translate(-605, -270);
fill(0, 53, 102); 
ellipse(662,342,20,70); 
fill(0, 26, 51);
ellipse(661,366,13,20);
popMatrix();
}

if (space == false)
{
fill(0, 53, 102); 
ellipse(662,342,20,70); 
fill(0, 26, 51);
ellipse(662,360,15,20);
}

//Body
fill(0, 53, 102); 
ellipse(640,350,55,110); 

//left leg
fill(0, 53, 102); 
ellipse(627,410,23,75); 
fill(0, 26, 51);
ellipse(627,438,13,20);

//left arm
fill(0, 53, 102); 
ellipse(619,345,20,70); 
fill(0, 26, 51);
ellipse(619,370,13,20);

//head
fill(0, 53, 102); 
ellipse(638,300,65,65); 

//Mask
fill(0, 26, 51);
quad(613, 280, 667, 285, 668, 300, 605, 295); 

//Eyes
fill(255);
triangle(645, 283, 667, 285, 668, 300);

popMatrix();  
}
}
 
 
void drawPlayerJump1() 
{

if (hitTimer %2 == 0);
{   
  
pushMatrix();
translate(pos.x,pos.y);


strokeWeight(2);

pushMatrix();
translate(-705,-40);

//right leg
pushMatrix();
translate(width/2, height/2);
rotate(radians(35));
translate(-625, -390);
fill(0, 53, 102); 
ellipse(652,400,23,65); 
popMatrix();
pushMatrix();
translate(width/2, height/2);
rotate(radians(-40));
translate(-630, -350);
fill(0, 53, 102); 
ellipse(652,400,23,75); 
fill(0, 26, 51);
ellipse(652,425,15,20);
popMatrix();

//right arm
pushMatrix();
translate(width/2, height/2);
rotate(radians(35));
translate(-655, -440);
fill(0, 53, 102); 
ellipse(652,400,20,65); 
popMatrix();

if (space == true)
{
pushMatrix();
translate(width/2, height/2);
rotate(radians(-90));   //rotation 0, strange transformation
translate(-605, -285);
fill(0, 53, 102); 
ellipse(662,342,18,50); 
fill(0, 26, 51);
ellipse(662,361,13,18);
popMatrix(); 
  
}

if (space == false)
{
pushMatrix();
translate(width/2, height/2);
rotate(radians(-40));
translate(-595, -335);
fill(0, 53, 102); 
ellipse(662,342,18,60); 
fill(0, 26, 51);
ellipse(662,361,13,18);
popMatrix();
}

popMatrix();

//Body
fill(0, 53, 102); 
ellipse(640,350,55,110); 

//left leg
fill(0, 53, 102); 
ellipse(627,410,23,75); 
fill(0, 26, 51);
ellipse(627,433,13,20);

pushMatrix();
translate(-705,-40);

//left arm
pushMatrix();
translate(width/2, height/2);
rotate(radians(160));
translate(-605, -280);
fill(0, 53, 102); 
ellipse(619,345,20,90); 
fill(0, 26, 51);
ellipse(619,375,13,25);
popMatrix();

popMatrix();


//head
fill(0, 53, 102); 
ellipse(638,300,65,65); 


//Mask
fill(0, 26, 51);
quad(608, 290, 658, 275, 666, 285, 605, 305); 

fill(255);
triangle(635, 282, 658, 275, 666, 285);
popMatrix();

}
}
 
 
void drawPlayerJump2() 
{
 
if (hitTimer %2 == 0);
{  
  
pushMatrix();  
translate(pos.x,pos.y);

translate(650,350);//Center of rotation
rotate(rotationPosition);
translate(-650,-350);

strokeWeight(2);

pushMatrix();
translate(-715,-40);

//right arm
pushMatrix();
translate(width/2, height/2);
rotate(radians(-40));
translate(-635, -350);

fill(0, 53, 102); 
ellipse(662,342,20,70); 
fill(0, 26, 51);
ellipse(662,368,13,20);
popMatrix();

//right leg
pushMatrix();
translate(width/2, height/2);
rotate(radians(-30));
translate(-635, -380);

fill(0, 53, 102); 
ellipse(652,400,23,75); 
fill(0, 26, 51);
ellipse(652,425,15,20);
popMatrix();

pushMatrix();
translate(width/2, height/2);
rotate(radians(20));
translate(-635, -390);
fill(0, 53, 102); 
ellipse(652,400,23,70); 
popMatrix();

popMatrix();

//Body
pushMatrix();
translate(-5,0);
fill(0, 53, 102); 
ellipse(640,350,55,110); 
popMatrix();

pushMatrix();
translate(-715,-40);

//left leg
pushMatrix();
translate(width/2, height/2);
rotate(radians(20));
translate(-657, -380);
fill(0, 53, 102); 
ellipse(652,400,23,70); 
popMatrix();

pushMatrix();
translate(width/2, height/2);
rotate(radians(-30));
translate(-625, -390);

fill(0, 53, 102); 
ellipse(627,410,23,75); 
fill(0, 26, 51);
ellipse(627,437,15,20);
popMatrix();

//left arm
pushMatrix();
translate(width/2, height/2);
rotate(radians(-40));
translate(-615, -360);

fill(0, 53, 102); 
ellipse(619,345,20,70); 
fill(0, 26, 51);
ellipse(619,370,13,20);
popMatrix();

popMatrix();

//head
fill(0, 53, 102); 
ellipse(638,300,65,65); 

//Mask
fill(0, 26, 51);
quad(613, 280, 667, 295, 668, 310, 605, 295); 

//Eyes
fill(255);
triangle(645, 290, 667, 295, 668, 310);

popMatrix();
}
}
 
 
 
void drawPlayerRun() 
{
if (hitTimer %2 == 0);
{ 
  

pushMatrix();
translate(pos.x,pos.y); 


strokeWeight(2);

pushMatrix();
translate(-700,-35);


//right leg
pushMatrix();
translate(width/2 - 50, height/2 - 10);
//rotate(radians(-10));
rotate(rightLegRotationPosition);
translate(-650 + 50,-360);

fill(0, 53, 102); 
ellipse(652,400,23,75); 
fill(0, 26, 51);
ellipse(652,425,15,20);
popMatrix();

popMatrix();
pushMatrix();
translate(10,10);





//right arm 
if (space == true)
{
pushMatrix();
translate(625, 390);
rotate(radians(-110));
translate(-615, -270);
fill(0, 53, 102); 
ellipse(662,342,20,70); 
fill(0, 26, 51);
ellipse(661,366,13,20);
popMatrix();
}

if (space == false)
{
pushMatrix();
translate(680, 380);
rotate(radians(20));
translate(-705,-375);
fill(0, 26, 51);
ellipse(672,310,15,25);
popMatrix();
}

popMatrix();
pushMatrix();

translate(-700,-35);

//Body
pushMatrix();
translate(width/2, height/2);
rotate(radians(30));
translate(-660,-340);

fill(0, 53, 102); 
ellipse(640,350,55,110); 
popMatrix();

//left leg
pushMatrix();
translate(width/2 - 40, height/2 + 20);
rotate(leftLegRotationPosition);
translate(-670 + 40,-360 - 20 );


fill(0, 53, 102); 
ellipse(627,410,23,75); 
fill(0, 26, 51);
ellipse(627,440,13,20);
popMatrix();

//left arm
pushMatrix();
translate(width/2, height/2);
rotate(radians(60));
translate(-660,-315);

fill(0, 53, 102); 
ellipse(619,345,20,70); 
fill(0, 26, 51);
ellipse(619,370,13,20);
popMatrix();

popMatrix();
pushMatrix();
translate(10,10);

//head
fill(0, 53, 102); 
ellipse(638,300,65,65); 

//Mask
fill(0, 26, 51);
quad(613, 280, 667, 285, 668, 300, 605, 295); 

//Eyes
fill(255);
triangle(645, 283, 667, 285, 668, 300);

popMatrix();
popMatrix();
}
}





void drawPlayerRunBackwards() 
{
if (hitTimer %2 == 0);
{ 
  
pushMatrix();
translate(pos.x,pos.y); 


strokeWeight(2);

pushMatrix();
translate(-700,-35);



//right leg
pushMatrix();
translate(width/2 + 18, height/2 + 15);
//rotate(radians(-70));
rotate(backwardsRightLegRotationPosition);
translate(-655 + 18,-335 - 35);

fill(0, 53, 102); 
ellipse(652,400,23,75); 
fill(0, 26, 51);
ellipse(652,425,15,20);
popMatrix();

popMatrix();
pushMatrix();
translate(10,10);





//right arm 
if (space == true)
{
pushMatrix();
translate(625, 390);
rotate(radians(-100));
translate(-595, -280);
fill(0, 53, 102); 
ellipse(662,342,20,70); 
fill(0, 26, 51);
ellipse(661,366,13,20);
popMatrix();
}

if (space == false)
{
pushMatrix();
translate(668, 382);
rotate(radians(20));
translate(-705,-375);
fill(0, 26, 51);
ellipse(672,310,15,25);
popMatrix();
}

popMatrix();
pushMatrix();

translate(-700,-35);

//Body
pushMatrix();
translate(width/2, height/2);
rotate(radians(-30));
translate(-635,-350);

fill(0, 53, 102); 
ellipse(640,350,55,110); 
popMatrix();

//left leg
pushMatrix();
translate(width/2 + 5, height/2 + 20);
rotate(backwardsLeftLegRotationPosition); 
translate(-625 - 5,-370 - 10);





fill(0, 53, 102); 
ellipse(627,410,23,75); 
fill(0, 26, 51);
ellipse(627,440,13,20);
popMatrix();

//left arm
pushMatrix();
translate(width/2, height/2);
rotate(radians(0));
translate(-645,-350);

fill(0, 53, 102); 
ellipse(619,345,20,70); 
fill(0, 26, 51);
ellipse(619,370,13,20);

popMatrix();

popMatrix();
pushMatrix();
translate(-5,10);

//head
fill(0, 53, 102); 
ellipse(638,300,65,65); 

//Mask
fill(0, 26, 51);
quad(613, 280, 667, 285, 668, 300, 605, 295); 

//Eyes
fill(255);
triangle(645, 283, 667, 285, 668, 300);

popMatrix();
popMatrix();
}
}





void drawPlayerCrouch() 
{
if (hitTimer %2 == 0);
{ 
pushMatrix();
translate(pos.x,pos.y); 

strokeWeight(2);

pushMatrix();
translate(-700,30);

//right leg
pushMatrix();
translate(width/2, height/2);
rotate(radians(70));

if (down == true && left == true || right == true)
{
translate(-690,crouchingRightLegPosition); //-340 
}
else
{
translate(-690,-340);
}

fill(0, 53, 102); 
ellipse(652,400,20,75); 
fill(0, 26, 51);
ellipse(652,425,13,20);
popMatrix();

popMatrix();
pushMatrix();
translate(0,80);


//right arm 

if (space == true)
{
pushMatrix();
translate(625, 390);
rotate(radians(-110));
translate(-620, -240);
fill(0, 53, 102); 
ellipse(662,342,20,70); 
fill(0, 26, 51);
ellipse(661,366,13,20);
popMatrix();
}

if (space == false)
{
pushMatrix();
translate(680, 380);
rotate(radians(20));
translate(-672,-370);
fill(0, 26, 51);
ellipse(672,310,15,25);
popMatrix();
}

popMatrix();
pushMatrix();
translate(-700,30);

//Body
pushMatrix();
translate(width/2, height/2);
rotate(radians(80));
translate(-660,-340);

fill(0, 53, 102); 
ellipse(640,350,55,110); 
popMatrix();

//left leg
pushMatrix();
translate(width/2, height/2);
rotate(radians(70));

if (down == true && left == true || right == true)
{
translate(-640,crouchingLeftLegPosition); //-335
}
else
{
translate(-640,-345);
}

fill(0, 53, 102); 
ellipse(627,410,23,75); 
fill(0, 26, 51);
ellipse(627,440,13,20);
popMatrix();

//left arm
pushMatrix();
translate(width/2, height/2);
rotate(radians(-70));
translate(-610,-315);

fill(0, 53, 102); 
ellipse(619,345,20,70); 
fill(0, 26, 51);
ellipse(619,370,13,20);
popMatrix();
popMatrix();

pushMatrix();
translate(0,80);

//head
pushMatrix();
translate(30,10);
fill(0, 53, 102); 
ellipse(638,300,65,65); 

//Mask
fill(0, 26, 51);
quad(613, 280, 667, 285, 668, 300, 605, 295); 

//Eyes
fill(255);
triangle(645, 283, 667, 285, 668, 300);
popMatrix();
popMatrix();


popMatrix();
}
}
 
 
//Constructor
player(PVector pos, PVector vel, PVector dim, float HP)
{
super(pos,vel,dim,HP);
this.pos=pos;
}
  
  
  
  
  
}
