//Class to enforce invisable barrier collision whenever the player encounters walls in the level
class barrier
{
//Fields
PVector pos;
PVector dim;


//Methods
void update()
{ 
  
  
}



void drawBarrier()
{
pushMatrix();
stroke(0);
fill(38, 77, 115); 
rect(pos.x,pos.y,dim.x,dim.y); 
popMatrix();  
}


void level1BarrierCollision1(player player)
{
if (player.pos.x > 1400 && player.pos.x < 1420 && player.pos.y > -100)
{
player.pos.x= 1400;
}

//if (player.pos.x > 1400 && player.pos.x < 1700 && player.pos.y > -150)
//{
//player.pos.y= -150;
//}

if (player.pos.x < 1710 && player.pos.x > 1690 && player.pos.y > -100)
{
player.pos.x = 1710;
}

}


void level1BarrierCollision2(player player)
{
if (player.pos.x > 1900 && player.pos.x < 1920 && player.pos.y < 40)
{
player.pos.x = 1900;
}

if (player.pos.x > 1900 && player.pos.x < 2100 && player.pos.y < 60) //&& player.pos.y > 120)
{
player.pos.y = 60;
}
}


void level2BarrierCollision1(player player)
{
if (player.pos.x > 300 && player.pos.x < 320 && player.pos.y > -50 )
{
player.pos.x = 300;
}

if (player.pos.x < 540 && player.pos.x > 520 && player.pos.y > -50)
{
player.pos.x = 540;
}

if (player.pos.x > 520 && player.pos.x < 750 && player.pos.y > -50 && player.pos.y < 100)
{
player.pos.y = 100;
}

if (player.pos.x < 790 && player.pos.x > 770 && player.pos.y < 100 && player.pos.y > -100) //Possibly change -300 to -250 based on accuracy and preformance
{
player.pos.x = 790;
}
}


void level2BarrierCollision2(player player)
{
if (player.pos.x < 960 && player.pos.x > 940 && player.pos.y > -50 )
{
player.pos.x = 940;
}

if (player.pos.x < 1100 && player.pos.x > 1080 && player.pos.y > -50) //&& player.pos.y < 100)
{
player.pos.x = 1100;
}
}


void level2BarrierCollision3(player player)
{
if (player.pos.x > 1320 && player.pos.x < 1340 && player.pos.y < -50 )
{
player.pos.x = 1320;
} 

if (player.pos.x > 1320 && player.pos.x < 1550 && player.pos.y < -20) //player.pos.y > -30
{
player.pos.y = -20;
} 

if (player.pos.x < 1570 && player.pos.x > 1550 && player.pos.y < -50)
{
player.pos.x = 1570;
} 
}

void level2BarrierCollision4(player player)
{ 
if (player.pos.x > 1770 && player.pos.x < 1790 && player.pos.y > -120 )
{
player.pos.x = 1770;
}    
}

void level3BarrierCollision1(player player)
{ 
if (player.pos.x > -360 && player.pos.x < -340 && player.pos.y > 100)
{
player.pos.x = -360;
} 

if (player.pos.x < -90 && player.pos.x > -110 && player.pos.y > 100) 
{
player.pos.x = -90;
} 

if (player.pos.x < 160 && player.pos.x > 140 && player.pos.y > 150)  
{
player.pos.x = 160;
} 
}

void level3BarrierCollision2(player player)
{
if (player.pos.x > -650 && player.pos.x < -210 && player.pos.y < -150) //player.pos.y > -30
{
player.pos.y = -150;
}

if (player.pos.x < -190 && player.pos.x > -210 && player.pos.y < -150)  
{
player.pos.x = -190;
}    
}

void level3BarrierCollision3(player player)
{
if (player.pos.x > 1840 && player.pos.x < 1960 && player.pos.y > 50)
{
player.pos.x = 1840;
}  
}

void level3BarrierCollision4(player player)
{
if (player.pos.x > 1755 && player.pos.x < 1785 && player.pos.y < -150)
{
player.pos.x = 1755;
} 

if (player.pos.x > 1800 && player.pos.x < 2000 && player.pos.y < -150) 
{
player.pos.y = -150;
}

}


//Constructor
barrier(PVector pos, PVector dim)
{
this.pos=pos;
this.dim=dim;
}

}
