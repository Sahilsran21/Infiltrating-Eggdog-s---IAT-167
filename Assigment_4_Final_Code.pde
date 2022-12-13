//Assignment 4 Final Code
//Parampreet Sran
//301369984

//Global Variables
int numBasicEnemy = 2;
int MaxHP = 1;
int respawnTimer = -1;
PFont font;
//PFont introTitle;
PImage heartPowerUp, EggdogPortrait, TallPictureFrame, PixelCity, PixelNightTown;
int currentFrame = 0;
int currentFrame1 = 0;

int throwTimer = 0;

PImage[] EggdogGameover = new PImage[31];
PImage[] introPixelCityscape = new PImage[127];

boolean introMusicIsPlaying;

boolean stage = true;
boolean bossStage = false;

import ddf.minim.*;
import controlP5.*;

AudioPlayer introMusic; 
AudioPlayer stageMusic; 
AudioPlayer bossMusic1; 
AudioPlayer bossMusic2; 
AudioPlayer gameOverMusic; 
AudioPlayer victoryMelody;

AudioPlayer healthPowerUp; 

//Minim minim;

Minim minimIntro;
Minim minimStage; 
Minim minimBoss1;
Minim minimBoss2;
Minim minimGameOver;
Minim minimVictoryMelody;

ControlP5 controlP5;
Button start, credits, retry, backToMenu;


//Game state
final int LEVEL_ONE=0;
final int LEVEL_TWO=1;
final int LEVEL_THREE=2;
final int BOSS_LEVEL=3;

final int WON=4;
final int LOST=5;

final int INTRO=6;
final int CREDITS=7;
final int LOADING=8;

int state=INTRO; //IMPORTANT -- Starting Screen for the game

//Declare all objects/ArrayLists
ArrayList <BasicEnemy> BasicEnemy = new ArrayList<BasicEnemy>();
ArrayList <platform> platforms = new ArrayList<platform>();
ArrayList <BossEnemy> BossEnemy = new ArrayList<BossEnemy>();
ArrayList <Spike> Spike = new ArrayList<Spike>();
ArrayList <saw> saw = new ArrayList<saw>();
ArrayList <fireball> fireball = new ArrayList<fireball>();
ArrayList <heart> heart = new ArrayList <heart>();
ArrayList <barrier> barrier = new ArrayList <barrier>();
ArrayList <EnemyProjectile> EnemyProjectile = new ArrayList<EnemyProjectile>();


player player;
score score;








void setup()
{
size(2700,800);  //(2700,800)

//frameRate = 60;

//level1Initialization();
introScreenInitialization();

//Setup minim files
minimStage = new Minim (this);
minimBoss1 = new Minim (this);

//Load Sound effects
healthPowerUp = minimStage.loadFile("Undertale HP sound effect.mp3");

//Load fonts and images
heartPowerUp = loadImage("heart.png");
}





///////////////////Create Menu Screens///////////////////////
void introScreenInitialization()
{  
  
font = loadFont("ProximaNova-Light-100.vlw");
textFont(font);
textSize(80); 
  
//introPixelCityscape = loadImage("IntroPixelCityscape.png");
 
for (int i=0; i< introPixelCityscape.length; i++)
{
 introPixelCityscape[i] = loadImage("tmp-" + i + ".gif");
}

//Start Button
controlP5 = new ControlP5(this);
start = controlP5.addButton("start", 0, 400, 600, 220, 100);
PFont pfont = createFont("ProximaNova-Light-100.vlw",30,true); 
start.getCaptionLabel().setFont(pfont);
start.setColorForeground(color(0, 89, 179)); 
start.setColorLabel(color(77, 210, 255)); //0, 204, 255
start.setColorBackground(color(0, 53, 102));  //0, 53, 102

//Credits Button
//controlP5 = new ControlP5(this);
credits = controlP5.addButton("credits", 0, 800, 600, 220, 100);
PFont pfont1 = createFont("ProximaNova-Light-100.vlw",30,true); 
credits.getCaptionLabel().setFont(pfont1);
credits.setColorForeground(color(0, 89, 179)); 
credits.setColorLabel(color(77, 210, 255)); //0, 204, 255
credits.setColorBackground(color(0, 53, 102));  //0, 53, 102

minimIntro = new Minim (this);

if (introMusicIsPlaying == false)
{
introMusicIsPlaying = true;
introMusic = minimIntro.loadFile("DELTARUNE OST - Rouxls Kaard Shop Hip Shop EXTENDED.mp3");
introMusic.setGain(-10);
introMusic.loop();
}

}



void creditsScreenInitialization()
{
  
introMusicIsPlaying = true;
font = loadFont("ProximaNova-Light-100.vlw");
textFont(font);
textSize(20); 
  
PixelNightTown = loadImage("Pixel Night Town.jpg");

//Back Button
//controlP5 = new ControlP5(this);
credits = controlP5.addButton("back", 0, 600, 620, 220, 100);
PFont pfont = createFont("ProximaNova-Light-100.vlw",30,true); 
credits.getCaptionLabel().setFont(pfont);
credits.setColorForeground(color(0, 89, 179)); 
credits.setColorLabel(color(77, 210, 255)); //0, 204, 255
credits.setColorBackground(color(0, 53, 102));  //0, 53, 102
}



void outroScreenInitialization()
{
  
  
  
}


void loadingScreenInitialization()
{
  
  
  
}


///////////////////Create win/lose screens///////////////////////
void winScreenInitialization()
{  
introMusicIsPlaying = false;

font = loadFont("ProximaNova-Light-100.vlw");
textFont(font);
textSize(60); //35
  
for (int i=0; i< EggdogGameover.length; i++)
{
 EggdogGameover[i] = loadImage("Eggdog - " + i + ".png");
}

controlP5 = new ControlP5(this);
backToMenu = controlP5.addButton("Back To Menu", 0, 600, 600, 240, 100);
PFont pfont3 = createFont("ProximaNova-Light-100.vlw",30,true); 
backToMenu.getCaptionLabel().setFont(pfont3);
backToMenu.setColorForeground(color(0, 89, 179)); 
backToMenu.setColorLabel(color(77, 210, 255)); //0, 204, 255
backToMenu.setColorBackground(color(0, 53, 102));  //0, 53, 102
 

minimVictoryMelody = new Minim (this);
victoryMelody= minimVictoryMelody.loadFile("Undertale Sound Effect - You Win!.mp3");
victoryMelody.setGain(0);
victoryMelody.play();   
}


void loseScreenInitialization()
{
  
introMusicIsPlaying = false;

font = loadFont("ProximaNova-Light-100.vlw");
textFont(font);
textSize(60); //35
  
for (int i=0; i< EggdogGameover.length; i++)
{
 EggdogGameover[i] = loadImage("Eggdog - " + i + ".png");
}


controlP5 = new ControlP5(this);
retry = controlP5.addButton("retry", 0, 600, 600, 220, 100);
PFont pfont3 = createFont("ProximaNova-Light-100.vlw",30,true); 
retry.getCaptionLabel().setFont(pfont3);
retry.setColorForeground(color(0, 89, 179)); 
retry.setColorLabel(color(77, 210, 255)); //0, 204, 255
retry.setColorBackground(color(0, 53, 102));  //0, 53, 102

  
minimGameOver = new Minim (this);
gameOverMusic = minimGameOver.loadFile("Undertale Dogsong.mp3");
gameOverMusic.setGain(0);
gameOverMusic.loop(); 

}



///////////////////Create new layout for each stage///////////////////////

void level1Initialization()
{

//Initialize font for Scoreboard 
font = loadFont("Adventure-48.vlw");
textFont(font);
textSize(40); //35
  
//Initialize objects
player = new player(new PVector(-580,300), new PVector(), new PVector(), 0);
player.jumping = true;
score = new score();
  
barrier.add(new barrier(new PVector(2065,280), new PVector(240,460)));
barrier.add(new barrier(new PVector(2580,0), new PVector(120,350)));

EnemyProjectile.add(new EnemyProjectile(new PVector(560,255), new PVector(-4,-4), 60)); 
EnemyProjectile.add(new EnemyProjectile(new PVector(1180,195), new PVector(-4,-4), 60)); 

platforms.add(new platform(new PVector(700,380), new PVector(0,0), new PVector(5000,80), new PVector(0,0), new PVector(0,0), 0));

platforms.add(new platform(new PVector(-200, 280), new PVector(0,0), new PVector(200,60), new PVector(0,0), new PVector(0,0), 0));
platforms.add(new platform(new PVector(200, 180), new PVector(0,0), new PVector(300, 60), new PVector(0,0), new PVector(0,0), 0));
platforms.add(new platform(new PVector(-250, -100), new PVector(0,0), new PVector(200,60), new PVector(0,0), new PVector(0,0), 0));
platforms.add(new platform(new PVector(-500, -250), new PVector(0,0), new PVector(200,60), new PVector(0,0),new PVector(0,0), 0));
platforms.add(new platform(new PVector(580, 260), new PVector(0,0), new PVector(200,60), new PVector(0,0),new PVector(0,0), 0));
platforms.add(new platform(new PVector(650, 50), new PVector(0,0), new PVector(200,60), new PVector(0,0),new PVector(0,0), 0));
platforms.add(new platform(new PVector(1100,-50), new PVector(0,0), new PVector(250,60), new PVector(0,0),new PVector(0,0), 0));
platforms.add(new platform(new PVector(1200,200), new PVector(0,0), new PVector(200,60), new PVector(0,0),new PVector(0,0), 0));
platforms.add(new platform(new PVector(1600,-170), new PVector(0,0), new PVector(200,60), new PVector(0,0),new PVector(0,0), 0));
platforms.add(new platform(new PVector(2000, 280), new PVector(0,0), new PVector(200,60), new PVector(0,0),new PVector(0,0), 0)); 

platforms.add(new platform(new PVector(1550, -80), new PVector(0,0), new PVector(230,60), new PVector(0,0),new PVector(0,0), 0));

BasicEnemy.add(new BasicEnemy(new PVector(580,280), new PVector(0,0), new PVector(0,0),new PVector(0,0), 2));
BasicEnemy.add(new BasicEnemy(new PVector(1200,220), new PVector(0,0), new PVector(0,0),new PVector(0,0), 2));

Spike.add(new Spike(new PVector(-20,380)));
Spike.add(new Spike(new PVector(60,380)));
Spike.add(new Spike(new PVector(140,380)));
Spike.add(new Spike(new PVector(220,380)));
Spike.add(new Spike(new PVector(300,380)));
Spike.add(new Spike(new PVector(380,380)));

Spike.add(new Spike(new PVector(865,380)));
Spike.add(new Spike(new PVector(945,380)));
Spike.add(new Spike(new PVector(1025,380)));
Spike.add(new Spike(new PVector(1105,380)));
Spike.add(new Spike(new PVector(1185,380)));
Spike.add(new Spike(new PVector(1265,380)));
Spike.add(new Spike(new PVector(1345,380)));

Spike.add(new Spike(new PVector(1365,310)));
Spike.add(new Spike(new PVector(1365,230)));
Spike.add(new Spike(new PVector(1365,150)));
Spike.add(new Spike(new PVector(1365,70)));
Spike.add(new Spike(new PVector(1365,-10)));

Spike.add(new Spike(new PVector(1425,-70)));
Spike.add(new Spike(new PVector(1505,-70)));
Spike.add(new Spike(new PVector(1585,-70)));

Spike.add(new Spike(new PVector(1655,-30)));
Spike.add(new Spike(new PVector(1655,50)));
Spike.add(new Spike(new PVector(1655,130)));
Spike.add(new Spike(new PVector(1655,210)));
Spike.add(new Spike(new PVector(1655,290)));

Spike.add(new Spike(new PVector(1665,380)));
Spike.add(new Spike(new PVector(1745,380)));
Spike.add(new Spike(new PVector(1825,380)));
Spike.add(new Spike(new PVector(1905,380)));
Spike.add(new Spike(new PVector(1985,380)));
Spike.add(new Spike(new PVector(2065,380)));

Spike.add(new Spike(new PVector(1880,-340)));
Spike.add(new Spike(new PVector(1880,-260)));
Spike.add(new Spike(new PVector(1880,-180)));
Spike.add(new Spike(new PVector(1880,-100)));
Spike.add(new Spike(new PVector(1880,-20)));

Spike.add(new Spike(new PVector(1940,100)));
Spike.add(new Spike(new PVector(2020,100)));

EggdogPortrait = loadImage("eggdog.png");
TallPictureFrame = loadImage("Tallpictureframe.png");

saw.add(new saw(new PVector(80,200),new PVector(4,0), new PVector(0,0), new PVector(350,80), new PVector(0,0)));
fireball.add(new fireball(new PVector(0,0),new PVector(0,0), new PVector(0,0), new PVector(0,0),PI,0.07));

heart.add(new heart(new PVector(110, 40),new PVector(60, 60)));

stageMusic = minimStage.loadFile("Flightless.mp3");
stageMusic.setGain(0);
stageMusic.loop();
}


void level2Initialization()
{
  
//Initialize font for Scoreboard 
font = loadFont("Adventure-48.vlw");
textFont(font);
textSize(40); //35

barrier.add(new barrier(new PVector(980,330), new PVector(400,80)));
barrier.add(new barrier(new PVector(980,330), new PVector(160,410)));
barrier.add(new barrier(new PVector(1620,330), new PVector(80,410)));
barrier.add(new barrier(new PVector(2000,0), new PVector(160,310)));
barrier.add(new barrier(new PVector(2450,330), new PVector(250,410)));

platforms.add(new platform(new PVector(700,380), new PVector(0,0), new PVector(2700,80), new PVector(0,0), new PVector(0,0), 0));

platforms.add(new platform(new PVector(-550, 0), new PVector(0,0), new PVector(200,60), new PVector(0,0), new PVector(0,0), 0));
platforms.add(new platform(new PVector(120, -200), new PVector(0,2), new PVector(300,60), new PVector(0,0), new PVector(-200,200), 0));
platforms.add(new platform(new PVector(-250, 200), new PVector(0,-2), new PVector(300, 60), new PVector(0,0), new PVector(200,-200), 0));
platforms.add(new platform(new PVector(120, 300), new PVector(0,0), new PVector(200,60), new PVector(0,0), new PVector(0,0), 0));
platforms.add(new platform(new PVector(120, 300), new PVector(0,0), new PVector(200,60), new PVector(0,0), new PVector(0,0), 0));
platforms.add(new platform(new PVector(640, 280), new PVector(0,0), new PVector(250,60), new PVector(0,0), new PVector(0,0), 0));
platforms.add(new platform(new PVector(620, -100), new PVector(0,0), new PVector(200,60), new PVector(0,0), new PVector(0,0), 0));
platforms.add(new platform(new PVector(1020,-100), new PVector(0,0), new PVector(200,60), new PVector(0,0), new PVector(0,0), 0));

platforms.add(new platform(new PVector(1440, 200), new PVector(4,0), new PVector(200,60), new PVector(1640,1240), new PVector(0,0), 0)); //100 height for testing //250 original height

platforms.add(new platform(new PVector(1440,330), new PVector(0,0), new PVector(200,60), new PVector(0,0), new PVector(0,0), 0));
platforms.add(new platform(new PVector(1950, -70), new PVector(0,0), new PVector(250,60), new PVector(0,0), new PVector(0,0), 0));

platforms.add(new platform(new PVector(540,-30), new PVector(0,0), new PVector(400,60), new PVector(0,0), new PVector(0,0), 0));
platforms.add(new platform(new PVector(1020, -30), new PVector(0,0), new PVector(80,60), new PVector(0,0), new PVector(0,0), 0));
platforms.add(new platform(new PVector(1935, -20), new PVector(0,0), new PVector(255,60), new PVector(0,0), new PVector(0,0), 0));

BasicEnemy.add(new BasicEnemy(new PVector(120,320), new PVector(0,0), new PVector(0,0),new PVector(0,0), 3));
BasicEnemy.add(new BasicEnemy(new PVector(1440,350), new PVector(0,0), new PVector(0,0),new PVector(0,0), 3));

Spike.add(new Spike(new PVector(-650,100)));
Spike.add(new Spike(new PVector(-650,180)));
Spike.add(new Spike(new PVector(-650,260)));
Spike.add(new Spike(new PVector(-650,340)));

Spike.add(new Spike(new PVector(-590,380)));
Spike.add(new Spike(new PVector(-510,380)));
Spike.add(new Spike(new PVector(-430,380)));
Spike.add(new Spike(new PVector(-350,380)));
Spike.add(new Spike(new PVector(-270,380)));
Spike.add(new Spike(new PVector(-190,380)));
Spike.add(new Spike(new PVector(-110,380)));
Spike.add(new Spike(new PVector(-30,380)));
Spike.add(new Spike(new PVector(50,380)));
Spike.add(new Spike(new PVector(130,380)));
Spike.add(new Spike(new PVector(210,380)));

Spike.add(new Spike(new PVector(280,360)));
Spike.add(new Spike(new PVector(280,280)));
Spike.add(new Spike(new PVector(280,200)));
Spike.add(new Spike(new PVector(280,120)));
Spike.add(new Spike(new PVector(280,40)));

Spike.add(new Spike(new PVector(340,-20)));
Spike.add(new Spike(new PVector(420,-20)));
Spike.add(new Spike(new PVector(500,-20)));
Spike.add(new Spike(new PVector(580,-20)));
Spike.add(new Spike(new PVector(660,-20)));

Spike.add(new Spike(new PVector(730,20)));

Spike.add(new Spike(new PVector(660,160)));
Spike.add(new Spike(new PVector(580,160)));

Spike.add(new Spike(new PVector(490,100)));
Spike.add(new Spike(new PVector(490,180)));
Spike.add(new Spike(new PVector(490,260)));
Spike.add(new Spike(new PVector(490,340)));

Spike.add(new Spike(new PVector(540,380)));
Spike.add(new Spike(new PVector(620,380)));
Spike.add(new Spike(new PVector(700,380)));
Spike.add(new Spike(new PVector(780,380)));
Spike.add(new Spike(new PVector(860,380)));

Spike.add(new Spike(new PVector(920,360)));
Spike.add(new Spike(new PVector(920,280)));
Spike.add(new Spike(new PVector(920,200)));
Spike.add(new Spike(new PVector(920,120)));
Spike.add(new Spike(new PVector(920,40)));

Spike.add(new Spike(new PVector(980,-20)));

Spike.add(new Spike(new PVector(1050,20)));
Spike.add(new Spike(new PVector(1050,100)));
Spike.add(new Spike(new PVector(1050,180)));
Spike.add(new Spike(new PVector(1050,260)));
Spike.add(new Spike(new PVector(1050,340)));

Spike.add(new Spike(new PVector(1200,-250)));
Spike.add(new Spike(new PVector(1280,-250)));

Spike.add(new Spike(new PVector(1300,-220)));
Spike.add(new Spike(new PVector(1300,-140)));
Spike.add(new Spike(new PVector(1300,-60)));

Spike.add(new Spike(new PVector(1360,60)));
Spike.add(new Spike(new PVector(1440,60)));

Spike.add(new Spike(new PVector(1510,-80)));
Spike.add(new Spike(new PVector(1510,-160)));
Spike.add(new Spike(new PVector(1510,-240)));

Spike.add(new Spike(new PVector(1520,-250)));
Spike.add(new Spike(new PVector(1600,-250)));
Spike.add(new Spike(new PVector(1680,-250)));
Spike.add(new Spike(new PVector(1760,-250)));
Spike.add(new Spike(new PVector(1840,-250)));
Spike.add(new Spike(new PVector(1920,-250)));
Spike.add(new Spike(new PVector(2000,-250)));

Spike.add(new Spike(new PVector(1750,360)));
Spike.add(new Spike(new PVector(1750,280)));
Spike.add(new Spike(new PVector(1750,200)));
Spike.add(new Spike(new PVector(1750,120)));
Spike.add(new Spike(new PVector(1750,40)));
Spike.add(new Spike(new PVector(1750,-40)));

PixelCity = loadImage("PixelCity.png");
//PixelCity = loadImage("PixelCity-min.png");

;


//4, -2   //0, -2
//platforms.add(new platform(new PVector(120, -200), new PVector(0,2), new PVector(300,60), new PVector(0,0), new PVector(-200,200), 0));

//4, -2 // 4,2
saw.add(new saw(new PVector(-240,223),new PVector(4,-2), new PVector(0,0), new PVector(-370,-90),new PVector(221,-179)));
saw.add(new saw(new PVector(130,-180),new PVector(4,2),new PVector(0,0),new PVector(0,280),new PVector(-180,220)));

fireball.add(new fireball(new PVector(-550,60),new PVector(0,0),new PVector(0,0),new PVector(0,0),PI,0.09));

heart.add(new heart(new PVector(1250, 570),new PVector(60, 60))); 
}


void level3Initialization()
{
  
//Initialize font for Scoreboard 
font = loadFont("Adventure-48.vlw");
textFont(font);
textSize(40); //35

barrier.add(new barrier(new PVector(0,0), new PVector(400,120)));
barrier.add(new barrier(new PVector(320,500), new PVector(200,250)));
barrier.add(new barrier(new PVector(520,580), new PVector(240,160)));
barrier.add(new barrier(new PVector(2520,450), new PVector(200,300)));
barrier.add(new barrier(new PVector(2450,0), new PVector(250,150)));  
  
platforms.add(new platform(new PVector(700,380), new PVector(0,0), new PVector(2700,80), new PVector(0,0), new PVector(0,0), 0));

platforms.add(new platform(new PVector(-550, 250), new PVector(0,0), new PVector(200,60), new PVector(0,0), new PVector(0,0), 0));
platforms.add(new platform(new PVector(-240, 40), new PVector(3,0), new PVector(200,60), new PVector(-240,40), new PVector(0,0), 0));

platforms.add(new platform(new PVector(300, 40), new PVector(0,3), new PVector(250, 60), new PVector(0,0), new PVector(-200,200), 0));
platforms.add(new platform(new PVector(900, 40), new PVector(4,0), new PVector(250,60), new PVector(600,1300), new PVector(0,0), 0));
platforms.add(new platform(new PVector(1600, 40), new PVector(0,3), new PVector(250,60), new PVector(0,0), new PVector(-200,200), 0));

platforms.add(new platform(new PVector(250, 290), new PVector(3,0), new PVector(200,60), new PVector(250,550), new PVector(0,0), 0));
platforms.add(new platform(new PVector(1050, 290), new PVector(-3,0), new PVector(200,60), new PVector(750,1050), new PVector(0,0), 0));
platforms.add(new platform(new PVector(1250, 290), new PVector(3,0), new PVector(200,60), new PVector(1250,1550), new PVector(0,0), 0));

platforms.add(new platform(new PVector(1950, 50), new PVector(0,0), new PVector(250,60), new PVector(0,0), new PVector(0,0), 0));


platforms.add(new platform(new PVector(-220,140), new PVector(0,0), new PVector(200,60), new PVector(0,0), new PVector(0,0), 0));
platforms.add(new platform(new PVector(0,220), new PVector(0,0), new PVector(240,60), new PVector(0,0), new PVector(0,0), 0));
platforms.add(new platform(new PVector(1970,90), new PVector(0,0), new PVector(180,60), new PVector(0,0), new PVector(0,0), 0));


BasicEnemy.add(new BasicEnemy(new PVector(250,310), new PVector(3,0), new PVector(0,0),new PVector(250,550), 4)); // 5 HP
BasicEnemy.add(new BasicEnemy(new PVector(1050,310), new PVector(-3,0), new PVector(0,0),new PVector(750,1050), 4));
BasicEnemy.add(new BasicEnemy(new PVector(1250,310), new PVector(3,0), new PVector(0,0),new PVector(1250,1550), 4));



Spike.add(new Spike(new PVector(-640,380)));
Spike.add(new Spike(new PVector(-560,380)));
Spike.add(new Spike(new PVector(-480,380)));
Spike.add(new Spike(new PVector(-400,380)));

Spike.add(new Spike(new PVector(-380,290)));
Spike.add(new Spike(new PVector(-380,210)));

Spike.add(new Spike(new PVector(-320,150)));
Spike.add(new Spike(new PVector(-240,150)));
Spike.add(new Spike(new PVector(-200,150)));

Spike.add(new Spike(new PVector(-120,230)));
Spike.add(new Spike(new PVector(-40,230)));
Spike.add(new Spike(new PVector(40,230)));

Spike.add(new Spike(new PVector(110,270)));

Spike.add(new Spike(new PVector(120,380)));
Spike.add(new Spike(new PVector(200,380)));
Spike.add(new Spike(new PVector(280,380)));
Spike.add(new Spike(new PVector(360,380)));
Spike.add(new Spike(new PVector(440,380)));
Spike.add(new Spike(new PVector(520,380)));
Spike.add(new Spike(new PVector(600,380)));
Spike.add(new Spike(new PVector(680,380)));
Spike.add(new Spike(new PVector(760,380)));
Spike.add(new Spike(new PVector(840,380)));
Spike.add(new Spike(new PVector(920,380)));
Spike.add(new Spike(new PVector(1000,380)));
Spike.add(new Spike(new PVector(1080,380)));
Spike.add(new Spike(new PVector(1160,380)));
Spike.add(new Spike(new PVector(1240,380)));
Spike.add(new Spike(new PVector(1320,380)));
Spike.add(new Spike(new PVector(1400,380)));
Spike.add(new Spike(new PVector(1480,380)));
Spike.add(new Spike(new PVector(1560,380)));
Spike.add(new Spike(new PVector(1640,380)));
Spike.add(new Spike(new PVector(1720,380)));
Spike.add(new Spike(new PVector(1800,380)));

Spike.add(new Spike(new PVector(1820,320)));
Spike.add(new Spike(new PVector(1820,240)));
Spike.add(new Spike(new PVector(1820,160)));

Spike.add(new Spike(new PVector(-640,-130)));
Spike.add(new Spike(new PVector(-560,-130)));
Spike.add(new Spike(new PVector(-480,-130)));
Spike.add(new Spike(new PVector(-400,-130)));
Spike.add(new Spike(new PVector(-320,-130)));

Spike.add(new Spike(new PVector(-250,-270)));
Spike.add(new Spike(new PVector(-250,-310)));

Spike.add(new Spike(new PVector(-190,-250)));
Spike.add(new Spike(new PVector(-110,-250)));
Spike.add(new Spike(new PVector(-30,-250)));
Spike.add(new Spike(new PVector(50,-250)));
Spike.add(new Spike(new PVector(130,-250)));
Spike.add(new Spike(new PVector(210,-250)));
Spike.add(new Spike(new PVector(290,-250)));
Spike.add(new Spike(new PVector(370,-250)));
Spike.add(new Spike(new PVector(450,-250)));
Spike.add(new Spike(new PVector(530,-250)));
Spike.add(new Spike(new PVector(610,-250)));
Spike.add(new Spike(new PVector(690,-250)));
Spike.add(new Spike(new PVector(770,-250)));
Spike.add(new Spike(new PVector(850,-250)));
Spike.add(new Spike(new PVector(930,-250)));
Spike.add(new Spike(new PVector(1010,-250)));
Spike.add(new Spike(new PVector(1090,-250)));
Spike.add(new Spike(new PVector(1090,-250)));
Spike.add(new Spike(new PVector(1170,-250)));
Spike.add(new Spike(new PVector(1250,-250)));
Spike.add(new Spike(new PVector(1330,-250)));
Spike.add(new Spike(new PVector(1410,-250)));
Spike.add(new Spike(new PVector(1490,-250)));
Spike.add(new Spike(new PVector(1570,-250)));
Spike.add(new Spike(new PVector(1650,-250)));
Spike.add(new Spike(new PVector(1730,-250)));

Spike.add(new Spike(new PVector(1750,-220)));

Spike.add(new Spike(new PVector(1810,-100)));
Spike.add(new Spike(new PVector(1890,-100)));
Spike.add(new Spike(new PVector(1970,-100)));

//platforms.add(new platform(new PVector(900, 40), new PVector(4,0), new PVector(250,60), new PVector(600,1300), new PVector(0,0), 0));

saw.add(new saw(new PVector(1510,60),new PVector(4,3), new PVector(0,0), new PVector(1510,1710), new PVector(-176,224)));
fireball.add(new fireball(new PVector(-700,200),new PVector(4,0), new PVector(0,0), new PVector(-995,-297.5),PI,0.07)); //11
fireball.add(new fireball(new PVector(-700,200),new PVector(4,0), new PVector(0,0), new PVector(-995,-297.5),PI/6,0.07)); //11

heart.add(new heart(new PVector(1510, 330),new PVector(60, 60))); 
}


void bossLevelInitialization()
{
//Initialize font for Scoreboard 
font = loadFont("Adventure-48.vlw");
textFont(font);
textSize(40); //35 


platforms.add(new platform(new PVector(700,380), new PVector(0,0), new PVector(2700,80), new PVector(200,60), new PVector(0,0), 0));

platforms.add(new platform(new PVector(-550, 40), new PVector(0,3), new PVector(200,60), new PVector(0,0), new PVector(240,-160), 0));
platforms.add(new platform(new PVector(-200, 40), new PVector(0,-3), new PVector(200,60), new PVector(0,0), new PVector(240,-160), 0));
platforms.add(new platform(new PVector(150, 40), new PVector(0,3), new PVector(200, 60), new PVector(0,0), new PVector(240,-160), 0));
platforms.add(new platform(new PVector(650, 40), new PVector(-4,-4), new PVector(200, 60), new PVector(-600,700), new PVector(240,-160), 0));

BossEnemy.add(new BossEnemy(new PVector(650,-50), new PVector(-4,-4), new PVector(0,0), new PVector(-600,700), new PVector(150,-250), 50));

Spike.add(new Spike(new PVector(-640,380)));
Spike.add(new Spike(new PVector(-560,380)));
Spike.add(new Spike(new PVector(-480,380)));
Spike.add(new Spike(new PVector(-400,380)));
Spike.add(new Spike(new PVector(-320,380)));
Spike.add(new Spike(new PVector(-240,380)));
Spike.add(new Spike(new PVector(-160,380)));
Spike.add(new Spike(new PVector(-80,380)));
Spike.add(new Spike(new PVector(0,380)));
Spike.add(new Spike(new PVector(80,380)));
Spike.add(new Spike(new PVector(160,380)));
Spike.add(new Spike(new PVector(240,380)));
Spike.add(new Spike(new PVector(320,380)));
Spike.add(new Spike(new PVector(400,380)));
Spike.add(new Spike(new PVector(480,380)));
Spike.add(new Spike(new PVector(560,380)));
Spike.add(new Spike(new PVector(640,380)));
Spike.add(new Spike(new PVector(720,380)));

//image(heartPowerUp, 1250, 570, 60, 60);  
}













void draw()
{
switch(state)
{
case LEVEL_ONE:
  drawLevel1(player);
  break;
case LEVEL_TWO:
  drawLevel2(player);
  break;
case LEVEL_THREE:
  drawLevel3(player);
  break;
case BOSS_LEVEL:
  drawBossLevel();
  break;
case WON:
  drawWinScreen();
  break;
case LOST:
  drawLoseScreen();  
  break;
case INTRO:
  drawIntroScreen();
  break;
case CREDITS:
  drawCreditsScreen();
  break;
case LOADING:
  drawLoadingScreen();
  break;
  
} 
}


//////////////////////Level Clear Conditions////////////////////
void clearLevel1()
{
  if (state==LEVEL_ONE)
  {
   //Reset the player's HP to full after each level
   stage = true;
   bossStage = false;
   player.HP = 0;
   platforms.clear();
   BasicEnemy.clear();
   Spike.clear();
   fireball.clear();
   saw.clear();
   barrier.clear();
   player.projectiles.clear();
   heart.clear();
   level2Initialization();  //*IMPORTANT - level 2 initialization doesnt start until level 1 is complete
   player.repositionLevel2();
   state=LEVEL_TWO;
  } else state=WON;   
}
  
void clearLevel2()
{
  if (state==LEVEL_TWO)
  {
   stage = true;
   bossStage = false;
   player.HP = 0;
   platforms.clear();
   BasicEnemy.clear();
   Spike.clear();
   fireball.clear();
   saw.clear();
   barrier.clear();
   player.projectiles.clear();
   heart.clear();
   level3Initialization();
   player.repositionLevel3();
   state=LEVEL_THREE;   
  } else state=WON;
}

void clearLevel3()
{
  if (state==LEVEL_THREE)
  {
   stage = false;
   bossStage = true;
   player.HP = 0;
   platforms.clear();
   BasicEnemy.clear();
   Spike.clear();
   fireball.clear();
   saw.clear();
   barrier.clear();
   player.projectiles.clear();
   heart.clear();
   
   stageMusic.pause();

   minimBoss2 = new Minim (this);
   bossMusic2 = minimBoss2.loadFile("Downwell.mp3");
   bossMusic2.setGain(-10);
   bossMusic2.loop();   
   
   
   bossLevelInitialization();
   player.repositionBossLevel();
   state=BOSS_LEVEL;    
  } else state=WON;
} 

void clearBossLevel()
{
   if (state==BOSS_LEVEL)
  {
   player.HP = 0;
   platforms.clear();
   BasicEnemy.clear();
   Spike.clear();
   fireball.clear();
   saw.clear();
   barrier.clear();
   player.projectiles.clear();
   heart.clear();
   
   bossMusic2.pause();
   
   winScreenInitialization();
   state=WON;
  }
  
}











///////////////////////////////////////////////Level 1//////////////////////////////////////////////////
void drawLevel1(player p)
{
pushMatrix();
fill(0, 77, 77);
rect(0,0,2700,800);

if (p.pos.x > 0 && p.pos.x < 1240)
{
translate(-p.pos.x, 0);
}

if (p.pos.x > 1240)
{
translate(-1240, 0);
}


//if (p.pos.x > 1100 )
//{
//translate(1101, 0);
//}




//Background details
image(EggdogPortrait, 500, 50, 229.5, 290);
image(TallPictureFrame, 460, 10, 300, 350); 

//Draw Level 1 basic enemies
for (int i=0; i<BasicEnemy.size(); i++)
{
BasicEnemy BasicE = BasicEnemy.get(i);
BasicE.update();
BasicE.drawBasicEnemy();
BasicE.drawBasicEnemy();
//BasicEnemy.fire();
//BasicEnemy.fire();

//Test collision for Basic Enemy 
  if (down == true && BasicE.basicEnemyCrouchCollision(player))
  {
  player.hit(); 
  }

  if (down == false && BasicE.basicEnemyCollision(player))
  {
  player.hit();
  }  
  
}

for (int i=0; i<EnemyProjectile.size(); i++)
{ 
 EnemyProjectile BasicEnemyprojectile  = EnemyProjectile.get(i);
 
  if (throwTimer>0) 
  {
  BasicEnemyprojectile.drawMe();  
  BasicEnemyprojectile.update();
  throwTimer--;    
  }
  
  if (throwTimer==0)
  {
  //EnemyProjectile.add(new EnemyProjectile(new PVector(560,255), new PVector(-4,-4), 120)); 
  println(EnemyProjectile);
  
  throwTimer = 60;
  }
}





//Draw Level 1 Obstacles

//Saw
for (int i=0; i<saw.size(); i++)
{
saw S = saw.get(i);
S.update(); 
S.drawSaw();

//Saw Hit detection
if (down == false && S.sawCollision(player))
{
player.hit(); 
}
if (down == true && S.sawCrouchingCollision(player))
{
player.hit(); 
}
}


//Fireball
for (int i=0; i<fireball.size(); i++)
{
fireball f = fireball.get(i);
f.update(); 
f.drawFireball();

//Fireball Hit detection
if (f.fireballCollision(player))
{
player.hit(); 
}
if (f.fireballCrouchingCollision(player))
{
player.hit(); 
}
}

for (int i=0; i < platforms.size(); i++)
{
 platforms.get(i).drawPlatform(player);
}

//Spike pillars
for (int i=0; i<barrier.size(); i++)
{
barrier b = barrier.get(i);
b.drawBarrier();
b.level1BarrierCollision1(player);
b.level1BarrierCollision2(player);
}


//Foreground
floorDesign(0,0);
floorDesign(1350,0);


//Spikes
//pushMatrix();
for (int i=0; i < 13; i++)
{
 Spike S = Spike.get(i);
 S.update(); //has no effect
 S.floorSpikes();
 
 //Test collision for Spikes
 if (down == true && S.floorCrouchingSpikeCollision(player))
 {
 player.hit();
 }  
 if (down == false && S.floorSpikeCollision(player))
 {
 player.hit();
 } 
}

for (int i=13; i < 18; i++)
{ 
 Spike S = Spike.get(i);
 S.wallSpikesRight();

if (down == true && S.rightCrouchingSpikeCollision(player))
{
player.hit();
}  
if (down == false && S.rightSpikeCollision(player))
{
player.hit();
}    
}

for (int i=18; i < 21; i++)
{ 
 Spike S = Spike.get(i);
 S.floorSpikes();
 
 if (down == true && S.floorCrouchingSpikeCollision(player))
 {
 player.hit();
 }  
 if (down == false && S.floorSpikeCollision(player))
 {
 player.hit();
 }  
}
 
for (int i=21; i < 26; i++)
{ 
 Spike S = Spike.get(i);
 S.wallSpikesLeft();
 
 if (down == true && S.leftCrouchingSpikeCollision(player))
 {
 player.hit();
 }  
 if(down == false && S.leftSpikeCollision(player))
 {
 player.hit();
 }  
}

for (int i=26; i < 32; i++)
{ 
 Spike S = Spike.get(i);
 S.floorSpikes();
 
 if (down == true && S.floorCrouchingSpikeCollision(player))
 {
 player.hit();
 }  
 if (down == false && S.floorSpikeCollision(player))
 {
 player.hit();
 } 
}

for (int i=32; i < 37; i++)
{ 
 Spike S = Spike.get(i);
 S.wallSpikesRight();
 
 if (down == true && S.rightCrouchingSpikeCollision(player))
 {
 player.hit();
 }  
 if (down == false && S.rightSpikeCollision(player))
 {
 player.hit();
 }  
}

for (int i=37; i < 39; i++)
{ 
 Spike S = Spike.get(i);
 S.ceilingSpikes();
 
 if (down == true && S.ceilingCrouchingSpikeCollision(player))
 {
 player.hit();
 } 
 if (down == false && S.ceilingSpikeCollision(player))
 {
 player.hit();
 }  
}
//popMatrix();

//Draw Level 1 Powerups
for (int i=0; i < heart.size(); i++)
{ 
 heart H = heart.get(i);
 H.drawHeart();
 
 if (down == false && H.heartCollision(player) && player.HP > 1 && player.hitTimer == 0) //0
 {
 player.giveLife();
 heart.remove(i);
 healthPowerUp.play(); 
 } 
 if (down == true && H.heartCrouchingCollision(player) && player.HP > 1 && player.hitTimer == 0)
 {
 player.giveLife();
 heart.remove(i);
 healthPowerUp.play(); 
 }  
}


pushMatrix();
if (p.pos.x > 0 && p.pos.x < 1240)
{
translate(p.pos.x, 0);
}
if (p.pos.x > 1240)
{
translate(1240, 0);
}
score.scoreBoard();
score.drawHPHearts();
popMatrix();

stroke(0);

player.playerPhysics();
player.changeMovementState();
popMatrix();
}



///////////////////////////////////////////////Level 2////////////////////////////////////////////////
void drawLevel2(player p)
{ 
pushMatrix();
noStroke();
fill(0, 77, 77);
rect(0,0,2700,800);

if (p.pos.x > 0 && p.pos.x < 1240)
{
translate(-p.pos.x, 0);
}

if (p.pos.x > 1240)
{
translate(-1240, 0);
}


//Wanted this image to work smoothly so bad! But with sidescrolling added, 
//it runs too slow. I may make this a scrolling background

pushMatrix();
translate(-p.pos.x / 12,0);
image(PixelCity, 280, 100, 580, 370);   //1920, 1080   //300, 150
popMatrix();

noStroke();
fill(0, 77, 77);
rect(130,100,200,600);
rect(800,100,200,600);

//Draw Level 2 basic enemies
for (int i=0; i<BasicEnemy.size(); i++)
{
BasicEnemy BasicE = BasicEnemy.get(i);
BasicE.update();
BasicE.drawBasicEnemy();
BasicE.drawBasicEnemy();

//Test collision for Basic Enemy
if (down == true && BasicE.basicEnemyCrouchCollision(player))
{
player.hit(); 
}

if (down == false && BasicE.basicEnemyCollision(player))
{
player.hit();
}
}

//Draw Level 2 Obstacles


//Saw
for (int i=0; i<saw.size(); i++)
{
saw S = saw.get(i);
S.update(); 
S.drawSaw();

//Saw Hit detection
if (down == false && S.sawCollision(player))
{
player.hit(); 
}
if (down == true && S.sawCrouchingCollision(player))
{
player.hit(); 
}
}


for (int i=0; i<fireball.size(); i++)
{
fireball f = fireball.get(i);
f.update(); 
f.drawFireball();

//Fireball Hit detection
if (f.fireballCollision(player))
{
player.hit(); 
}
if (f.fireballCrouchingCollision(player))
{
player.hit(); 
}
}


for (int i=0; i < platforms.size(); i++)
{
//Moving Platforms
platforms.get(i).drawPlatform(player);
platforms.get(i).update();
}


//Spike pillars
for (int i=0; i<barrier.size(); i++)
{
barrier b = barrier.get(i);
b.drawBarrier();
b.level2BarrierCollision1(player);
b.level2BarrierCollision2(player);
b.level2BarrierCollision3(player);
b.level2BarrierCollision4(player);
}

//Foreground
floorDesign(0,0);
floorDesign(1350,0);



//Spikes
for (int i=0; i < 4; i++)
{
 Spike S = Spike.get(i);
 S.wallSpikesLeft();
 
 if (down == true && S.leftCrouchingSpikeCollision(player))
 {
 player.hit();
 }  
 if(down == false && S.leftSpikeCollision(player))
 {
 player.hit();
 }  
}
  
for (int i=4; i < 15; i++)
{
 Spike S = Spike.get(i);
 S.floorSpikes();
 
 if (down == true && S.floorCrouchingSpikeCollision(player))
 {
 player.hit();
 }  
 if (down == false && S.floorSpikeCollision(player))
 {
 player.hit();
 } 
}
 
for (int i=15; i < 20; i++)
{
 Spike S = Spike.get(i);
 S.wallSpikesRight();
 
 if (down == true && S.rightCrouchingSpikeCollision(player))
 {
 player.hit();
 }  
 if (down == false && S.rightSpikeCollision(player))
 {
 player.hit();
 }  
}

for (int i=20; i < 25; i++)
{
 Spike S = Spike.get(i);
 S.floorSpikes();
 
 if (down == true && S.floorCrouchingSpikeCollision(player))
 {
 player.hit();
 }  
 if (down == false && S.floorSpikeCollision(player))
 {
 player.hit();
 } 
}

for (int i=25; i < 26; i++)
{
 Spike S = Spike.get(i);
 S.wallSpikesLeft();
 
 if (down == true && S.leftCrouchingSpikeCollision(player))
 {
 player.hit();
 }  
 if(down == false && S.leftSpikeCollision(player))
 {
 player.hit();
 }  
}
 
for (int i=26; i < 28; i++)
{
 Spike S = Spike.get(i);
 S.ceilingSpikes();
 
 if (down == true && S.ceilingCrouchingSpikeCollision(player))
 {
 player.hit();
 } 
 if (down == false && S.ceilingSpikeCollision(player))
 {
 player.hit();
 }  
}

for (int i=28; i < 32; i++)
{
 Spike S = Spike.get(i);
 S.wallSpikesLeft();
 
 if (down == true && S.leftCrouchingSpikeCollision(player))
 {
 player.hit();
 }  
 if(down == false && S.leftSpikeCollision(player))
 {
 player.hit();
 }  
}
 
for (int i=32; i < 37; i++)
{
 Spike S = Spike.get(i);
 S.floorSpikes();
 
 if (down == true && S.floorCrouchingSpikeCollision(player))
 {
 player.hit();
 }  
 if (down == false && S.floorSpikeCollision(player))
 {
 player.hit();
 } 
}
 
for (int i=37; i < 42; i++)
{
 Spike S = Spike.get(i);
 S.wallSpikesRight();
 
 if (down == true && S.rightCrouchingSpikeCollision(player))
 {
 player.hit();
 }  
 if (down == false && S.rightSpikeCollision(player))
 {
 player.hit();
 }  
}

for (int i=42; i < 43; i++)
{
 Spike S = Spike.get(i);
 S.floorSpikes();
 
 if (down == true && S.floorCrouchingSpikeCollision(player))
 {
 player.hit();
 }  
 if (down == false && S.floorSpikeCollision(player))
 {
 player.hit();
 } 
}

for (int i=43; i < 48; i++)
{
 Spike S = Spike.get(i);
 S.wallSpikesLeft();
 
 if (down == true && S.leftCrouchingSpikeCollision(player))
 {
 player.hit();
 }  
 if(down == false && S.leftSpikeCollision(player))
 {
 player.hit();
 }  
}

for (int i=48; i < 50; i++)
{
 Spike S = Spike.get(i);
 S.ceilingSpikes();
 
 if (down == true && S.ceilingCrouchingSpikeCollision(player))
 {
 player.hit();
 } 
 if (down == false && S.ceilingSpikeCollision(player))
 {
 player.hit();
 }  
}
 
for (int i=50; i < 53; i++)
{
 Spike S = Spike.get(i);
 S.wallSpikesRight();
 
 if (down == true && S.rightCrouchingSpikeCollision(player))
 {
 player.hit();
 }  
 if (down == false && S.rightSpikeCollision(player))
 {
 player.hit();
 }  
}
 
for (int i=53; i < 55; i++)
{
 Spike S = Spike.get(i);
 S.ceilingSpikes();
 
 if (down == true && S.ceilingCrouchingSpikeCollision(player))
 {
 player.hit();
 } 
 if (down == false && S.ceilingSpikeCollision(player))
 {
 player.hit();
 }  
} 


for (int i=55; i < 58; i++)
{
 Spike S = Spike.get(i);
 S.wallSpikesLeft();
 
 if (down == true && S.leftCrouchingSpikeCollision(player))
 {
 player.hit();
 }  
 if(down == false && S.leftSpikeCollision(player))
 {
 player.hit();
 }  
} 
 
for (int i=58; i < 65; i++)
{
 Spike S = Spike.get(i);
 S.ceilingSpikes();
 
 if (down == true && S.ceilingCrouchingSpikeCollision(player))
 {
 player.hit();
 } 
 if (down == false && S.ceilingSpikeCollision(player))
 {
 player.hit();
 }  
} 
 
for (int i=65; i < 70; i++)
{
 Spike S = Spike.get(i);
 S.wallSpikesRight();
 
 if (down == true && S.rightCrouchingSpikeCollision(player))
 {
 player.hit();
 }  
 if (down == false && S.rightSpikeCollision(player))
 {
 player.hit();
 }  
} 

//Draw Level 2 Powerups
for (int i=0; i < heart.size(); i++)
{ 
 heart H = heart.get(i);
 H.drawHeart();
 
 if (down == false && H.heartCollision(player) && player.HP > 1 && player.hitTimer == 0) //0
 {
 player.giveLife();
 heart.remove(i);
 healthPowerUp.play(); 
 } 
 if (down == true && H.heartCrouchingCollision(player) && player.HP > 1 && player.hitTimer == 0)
 {
 player.giveLife();
 heart.remove(i);
 healthPowerUp.play(); 
 }  
}

pushMatrix();
if (p.pos.x > 0 && p.pos.x < 1240)
{
translate(p.pos.x, 0);
}
if (p.pos.x > 1240)
{
translate(1240, 0);
}
score.scoreBoard();
score.drawHPHearts();
popMatrix();

stroke(0);

player.playerPhysics();
player.changeMovementState();

popMatrix();
}




///////////////////////////////////////////////Level 3////////////////////////////////////////////////
void drawLevel3(player p)
{
pushMatrix();
fill(0, 77, 77);
rect(0,0,2700,800);

if (p.pos.x > 0 && p.pos.x < 1240)
{
translate(-p.pos.x, 0);
}

if (p.pos.x > 1240)
{
translate(-1240, 0);
}
 

//Draw Level 3 basic enemies
for (int i=0; i<BasicEnemy.size(); i++)
{
BasicEnemy BasicE = BasicEnemy.get(i);
BasicE.update();
BasicE.drawBasicEnemy();
BasicE.drawBasicEnemy();
BasicE.drawBasicEnemy();

//Test collision for Basic Enemy
if (down == true && BasicE.basicEnemyCrouchCollision(player))
{
player.hit(); 
}

if (down == false && BasicE.basicEnemyCollision(player))
{
player.hit();
}
}


//Draw Level 3 Obstacles

//Saw
for (int i=0; i<saw.size(); i++)
{
saw S = saw.get(i);
S.update(); 
S.drawSaw();

//Saw Hit detection
if (down == false && S.sawCollision(player))
{
player.hit(); 
}
if (down == true && S.sawCrouchingCollision(player))
{
player.hit(); 
}
}


for (int i=0; i<fireball.size(); i++)
{
fireball f = fireball.get(i);
f.update(); 
f.drawFireball();

//Fireball Hit detection
if (f.fireballCollision(player))
{
player.hit(); 
}
if (f.fireballCrouchingCollision(player))
{
player.hit(); 
}
}

for (int i=0; i < platforms.size(); i++)
{
 platforms.get(i).drawPlatform(player);
 platforms.get(i).update();
}


//Spike pillars
for (int i=0; i<barrier.size(); i++)
{
barrier b = barrier.get(i);
b.drawBarrier();
b.level3BarrierCollision1(player);
b.level3BarrierCollision2(player);
b.level3BarrierCollision3(player);
b.level3BarrierCollision4(player);
}


//Foreground
floorDesign(0,0);
floorDesign(1350,0);


//Spikes
for (int i=0; i < 4; i++)
{
 Spike S = Spike.get(i);
 S.floorSpikes();
 
 if (down == true && S.floorCrouchingSpikeCollision(player))
 {
 player.hit();
 }  
 if (down == false && S.floorSpikeCollision(player))
 {
 player.hit();
 } 
}

for (int i=4; i < 6; i++)
{
Spike S= Spike.get(i);
S.wallSpikesRight();

 if (down == true && S.rightCrouchingSpikeCollision(player))
 {
 player.hit();
 }  
 if (down == false && S.rightSpikeCollision(player))
 {
 player.hit();
 } 
}

for (int i=6; i < 12; i++)
{
 Spike S = Spike.get(i);
 S.floorSpikes();
 
 if (down == true && S.floorCrouchingSpikeCollision(player))
 {
 player.hit();
 }  
 if (down == false && S.floorSpikeCollision(player))
 {
 player.hit();
 } 
}

for (int i=12; i < 13; i++)
{
 Spike S = Spike.get(i);
 S.wallSpikesLeft();
 
 if (down == true && S.leftCrouchingSpikeCollision(player))
 {
 player.hit();
 }  
 if(down == false && S.leftSpikeCollision(player))
 {
 player.hit();
 }  
}

for (int i=13; i < 35; i++)
{
 Spike S = Spike.get(i);
 S.floorSpikes();
 
 if (down == true && S.floorCrouchingSpikeCollision(player))
 {
 player.hit();
 }  
 if (down == false && S.floorSpikeCollision(player))
 {
 player.hit();
 } 
}

for (int i=35; i < 38; i++)
{
Spike S= Spike.get(i);
S.wallSpikesRight();

 if (down == true && S.rightCrouchingSpikeCollision(player))
 {
 player.hit();
 }  
 if (down == false && S.rightSpikeCollision(player))
 {
 player.hit();
 } 
}

for (int i=38; i < 43; i++)
{
 Spike S = Spike.get(i);
 S.ceilingSpikes();
 
 if (down == true && S.ceilingCrouchingSpikeCollision(player))
 {
 player.hit();
 } 
 if (down == false && S.ceilingSpikeCollision(player))
 {
 player.hit();
 }  
}

for (int i=43; i < 45; i++)
{
 Spike S = Spike.get(i);
 S.wallSpikesLeft();
 
 if (down == true && S.leftCrouchingSpikeCollision(player))
 {
 player.hit();
 }  
 if(down == false && S.leftSpikeCollision(player))
 {
 player.hit();
 }  
}

for (int i=45; i < 71; i++)
{
 Spike S = Spike.get(i);
 S.ceilingSpikes();
 
 if (down == true && S.ceilingCrouchingSpikeCollision(player))
 {
 player.hit();
 } 
 if (down == false && S.ceilingSpikeCollision(player))
 {
 player.hit();
 }  
}

for (int i=71; i < 72; i++)
{
Spike S= Spike.get(i);
S.wallSpikesRight();

 if (down == true && S.rightCrouchingSpikeCollision(player))
 {
 player.hit();
 }  
 if (down == false && S.rightSpikeCollision(player))
 {
 player.hit();
 } 
}

for (int i=72; i < 75; i++)
{
 Spike S = Spike.get(i);
 S.ceilingSpikes();
 
 if (down == true && S.ceilingCrouchingSpikeCollision(player))
 {
 player.hit();
 } 
 if (down == false && S.ceilingSpikeCollision(player))
 {
 player.hit();
 }  
}


//Draw Level 3 Powerups
for (int i=0; i < heart.size(); i++)
{ 
 heart H = heart.get(i);
 H.drawHeart();
 
 if (down == false && H.heartCollision(player) && player.HP > 1 && player.hitTimer == 0) //0
 {
 player.giveLife();
 heart.remove(i);
 healthPowerUp.play(); 
 } 
 if (down == true && H.heartCrouchingCollision(player) && player.HP > 1 && player.hitTimer == 0)
 {
 player.giveLife();
 heart.remove(i);
 healthPowerUp.play(); 
 }  
} 

pushMatrix();
if (p.pos.x > 0 && p.pos.x < 1240)
{
translate(p.pos.x, 0);
}
if (p.pos.x > 1240)
{
translate(1240, 0);
}
score.scoreBoard();
score.drawHPHearts();
popMatrix();

stroke(0);

player.playerPhysics();
player.changeMovementState();

popMatrix();
} 


///////////////////////////////////////////////Boss Level////////////////////////////////////////////////
void drawBossLevel()
{
pushMatrix();
fill(0, 77, 77);
rect(0,0,2700,800);

strokeWeight(3);

 for (int i=0; i < platforms.size(); i++)
{
 platforms.get(i).drawPlatform(player);
 platforms.get(i).update();
}


//Draw final Level boss enemies
for (int i=0; i<BossEnemy.size(); i++)
{
BossEnemy BossE = BossEnemy.get(i);
BossE.update();
BossE.drawBossEnemy();

  if (down == true && BossE.BossEnemyCrouchCollision(player))
  {
  player.hit(); 
  }

  if (down == false && BossE.BossEnemyCollision(player))
  {
  player.hit();
  }
}


  


//Foreground
floorDesign(0,0);
floorDesign(1350,0);


//Spikes
for (int i=0; i < Spike.size(); i++)
{
 Spike S = Spike.get(i);
 S.floorSpikes();
 
 if (down == true && S.floorCrouchingSpikeCollision(player))
 {
 player.hit();
 }  
 if (down == false && S.floorSpikeCollision(player))
 {
 player.hit();
 } 
}


//Draw Boss Level Powerups
for (int i=0; i < heart.size(); i++)
{ 
 heart H = heart.get(i);
 H.drawHeart();
 
 if (down == false && H.heartCollision(player) && player.HP > 1 && player.hitTimer == 0) //0
 {
 player.giveLife();
 heart.remove(i);
 healthPowerUp.play(); 
 } 
 if (down == true && H.heartCrouchingCollision(player) && player.HP > 1 && player.hitTimer == 0)
 {
 player.giveLife();
 heart.remove(i);
 healthPowerUp.play(); 
 }  
}  

player.playerPhysics();
player.changeMovementState();

score.scoreBoard();
score.drawHPHearts();

popMatrix();
}












///////////////////////////////////////////Intro Screen///////////////////////////////////////////
void drawIntroScreen()
{
pushMatrix();
fill(0, 77, 77);
rect(0,0,2700,800);

//image(introPixelCityscape,0, 0, 1380, 730);  

 if (frameCount % 1 == 0) 
 {
 currentFrame1++;
 }
 if (currentFrame1 == introPixelCityscape.length)
 {
 currentFrame1 = 0;
 } 
 
pushMatrix();
PImage Cityscape = introPixelCityscape [currentFrame1];
image(Cityscape, -200,-100, 1920,1080); 
popMatrix();

textSize(80); 
fill(0);
text("Infiltrating Eggdog's", 380, 120);

textSize(45); 
text("Eggdog has taken our eggs. ", 430, 280);
text("The township has enlisted you to infultrate his", 300, 330);
text("compound and retrieve what is rightfully ours.", 300, 380);

textSize(55);
fill(255);
text("Good Luck!", 600, 500); //460 //"Stay Sharp!"




   
popMatrix(); 
}



///////////////////////////////////////////Credits Screen///////////////////////////////////////////
void drawCreditsScreen()
{  
//Add photo of pixel city
image(PixelNightTown, 0, 0, 1460, 800);

fill(255);
textSize(50); 

text("Credits", 600, 70);

textSize(35); 
text("Songs used:", 20, 110);

textSize(30); 
text("Rouxls Kaard Shop Theme - Deltarune OST", 20, 160);
text("Flightless Theme - Nitrome", 20, 200);
text("Re-Tail - Animal Crossing: New Leaf", 20, 240);
text("Slumber Party - Downwell OST", 20, 280);
text("Dogsong - Undertale OST", 20, 320);

textSize(35); 
text("Images Used:", 20, 375);

textSize(25); 
text("Eggdog.png", 20, 410);
text("https://www.thingiverse.com/thing:3511936", 20, 430);

text("Tallpictureframe.png", 20, 470);
text("https://www.kisspng.com/png-picture-frame-cross-stitch-pattern-gold-frame-309861/", 20, 490);

text("heart.png", 20, 530);
text("https://www.trzcacak.rs/imgb/iiTRoo/", 20, 550);

text("PixelCity.jpg", 20, 590);
text("http://hdqwalls.com/8-bit-pixel-art-city-wallpaper", 20, 610);

text("IntroPixelCityscape.gif", 20, 650);
text("https://imgur.com/gallery/nQ25Yl2", 20, 670);

text("Pixel Night City Background.jpg", 20, 710);
text("https://wallpaperplay.com/board/animated-pixel-wallpapers", 20, 730);

text("Eggdog GameOver Screen animation", 20, 770);
text("Created by myself using Adobe Photoshop CC 2019", 20, 790);

textSize(35); 
text("Fonts used:", 850, 110);
  
textSize(30);  
text("https://www.dafont.com/adventure.font", 850, 150);
text("https://fonts.adobe.com/fonts/proxima-nova", 850, 180);

textSize(35); 
text("Sound Effects used:", 850, 230);

textSize(25); 
text("Sahelanthropus Sound Effects - Metal Gear Solid 5", 850, 260);
text("https://www.youtube.com/watch?v=yEInmTL-Xvo", 850, 290);

text("Restoring Health - Undertale Sound Effect", 850, 330);
text("https://www.youtube.com/watch?v=kYfaFrXEeiU", 850, 360);

text("You Win! - Undertale Sound Effect", 850, 400);
text("https://www.youtube.com/watch?v=CQjPLr95ZVQ", 850, 430);


  
}

///////////////////////////////////////////Credits Screen///////////////////////////////////////////
void drawLoadingScreen()
{
  
  
  
  
}


///////////////////////////////////////////Win Screen///////////////////////////////////////////
void drawWinScreen()
{
pushMatrix();
fill(0, 77, 77);
rect(0,0,2700,800);  

//Draw Image of sunny side up eggdog instead //and cartons of eggs in background

if (stage == true)
{
stageMusic.pause(); 
}

if (bossStage == true)
{
bossMusic2.pause();
}

fill(255);
text("Congladurations!", 500, 120);
text("A winner is you!", 520, 220);
text("Free eggs for everyone!", 400, 320);


pushMatrix();
fill(242, 242, 242);
ellipse(1100,600,300,150);
fill(255, 204, 0);
ellipse(1100,600,120,70);

pushMatrix();
translate(500,300);
fill(0);
ellipse(580,280,15,15);
ellipse(615,290,15,15);

translate(0,5);
ellipse(577,295,12,15);
noFill();
strokeWeight(3);
arc(602,305,63, 30, radians(-270),radians(-160));
arc(610,320,15, 15, radians(-270),radians(-90));
popMatrix();
popMatrix();
popMatrix();
}


///////////////////////////////////////////Lose Screen///////////////////////////////////////////
void drawLoseScreen()
{
pushMatrix();
fill(0, 77, 77);
rect(0,0,2700,800);  


 if (frameCount % 6 == 0) 
 {
 currentFrame++;
 }
 if (currentFrame == EggdogGameover.length)
 {
 currentFrame = 0;
 } 

pushMatrix();
translate(300, -200);
PImage EggdogDance = EggdogGameover[currentFrame];
image(EggdogDance, 450,385); 
image(EggdogDance, -610,385); 
popMatrix();

if (stage == true)
{
stageMusic.pause(); 
}

if (bossStage == true)
{
bossMusic2.pause();
}

fill(255);
text("Too Bad!", 600, 120);
text("A loser is you!", 530, 220);
text("Eggdog is keeping his eggs!", 370, 320);

  
 
popMatrix();
}

  
  
  
  
  
  
  
  
  
void controlEvent(ControlEvent theEvent) 
{
    if (theEvent.getController().getName() =="start") 
    { 
    state = LEVEL_ONE;
     
    controlP5.getController("start").hide();
    controlP5.getController("credits").hide();
    
    level1Initialization();
    introMusic.pause(); 
    }
 
    
    if (theEvent.getController().getName() =="credits") 
    {
    state = CREDITS;   
    controlP5.getController("start").hide();
    controlP5.getController("credits").hide();
    
    creditsScreenInitialization();
    }
    
    if (theEvent.getController().getName() =="back") 
    {
    state = INTRO; 
    controlP5.getController("back").hide();
    
    introScreenInitialization();
    }
    
    if (theEvent.getController().getName() =="retry") 
    {  
    state = LEVEL_ONE;  //Instead of INTRO, put it right back to STAGE_ONE so that I can bypass dealing with music not playing
    controlP5.getController("retry").hide();
    
    level1Initialization();
    gameOverMusic.pause(); 
    }  
    
    if (theEvent.getController().getName() =="Back To Menu") 
    {  
    state = INTRO;
    controlP5.getController("Back To Menu").hide();
    
    introScreenInitialization();
    }   
}






















void floorDesign(int floorX, int floorY)
{
pushMatrix();
translate(floorX, floorY);

noStroke();
fill(38, 77, 115);
rect(0,730,1350,70);

pushMatrix();
stroke(0);
strokeWeight(2);
fill(57, 115, 172);
ellipse(25,750,20,15);
ellipse(25,780,20,15);
translate(150,0);
ellipse(25,750,20,15);
ellipse(25,780,20,15);
translate(150,0);
ellipse(25,750,20,15);
ellipse(25,780,20,15);
translate(150,0);
ellipse(25,750,20,15);
ellipse(25,780,20,15);
translate(150,0);
ellipse(25,750,20,15);
ellipse(25,780,20,15);
translate(150,0);
ellipse(25,750,20,15);
ellipse(25,780,20,15);
translate(150,0);
ellipse(25,750,20,15);
ellipse(25,780,20,15);
translate(150,0);
ellipse(25,750,20,15);
ellipse(25,780,20,15);
translate(150,0);
ellipse(25,750,20,15);
ellipse(25,780,20,15);
popMatrix();

pushMatrix();
stroke(48, 104, 156);
strokeWeight(3);

line(0,750,5,750);
line(0,780,5,780);

line(45,750,155,750);
line(45,780,155,780);
translate(150,0);
line(45,750,155,750);
line(45,780,155,780);
translate(150,0);
line(45,750,155,750);
line(45,780,155,780);
translate(150,0);
line(45,750,155,750);
line(45,780,155,780);
translate(150,0);
line(45,750,155,750);
line(45,780,155,780);
translate(150,0);
line(45,750,155,750);
line(45,780,155,780);
translate(150,0);
line(45,750,155,750);
line(45,780,155,780);
translate(150,0);
line(45,750,155,750);
line(45,780,155,780);
translate(150,0);
line(45,750,150,750);
line(45,780,150,780);
popMatrix();  
popMatrix();
}   
  
