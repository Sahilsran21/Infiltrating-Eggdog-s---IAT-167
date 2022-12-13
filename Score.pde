//Standalone class to handle the HP scoreBoard
class score
{
//Fields
int platformScore;
int basicEnemyScore;
int bossScore;


int healthScore;


//Methods
void scoreBoard()
{
pushMatrix();
fill(255, 230, 230);
rect(840,0,440,70);
popMatrix();
}

void drawHPHearts()
{
float max = 72.75;
 
pushMatrix();
float playerHeartPercentage = (float) player.HP/(float)MaxHP;
image(heartPowerUp, 920, 6, 60, 60);
image(heartPowerUp, 993, 6, 60, 60);
image(heartPowerUp, 1066, 6, 60, 60);
image(heartPowerUp, 1139, 6, 60, 60);
image(heartPowerUp, 1212, 6, 60, 60);
noStroke();
fill(255, 230, 230);
rect(842,2, max*playerHeartPercentage, 67);

popMatrix();

pushMatrix();
fill(230, 0, 0);
text("HP: ", 850, 50);
popMatrix();
}

void basicPlatformScoreUpdate(int point)
{
platformScore += point;
}

void basicEnemyScoreUpdate(int point)
{
basicEnemyScore += point;
}


void BossScoreUpdate(int point)
{
bossScore += point;
}


void drawBossHP()
{
  
float max = 72.75;
 
pushMatrix();
//float bossHealthPercentage = (float) BossEnemy.HP/(float)MaxHP;

noStroke();
fill(255, 230, 230);
//rect(842,2, max*bossHealthPercentage, 67); 
popMatrix();
}


  
  
  
}
