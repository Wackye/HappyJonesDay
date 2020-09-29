// try to find the bug
PImage coverPhoto;
int gameState;

ArrayList<Enemy> enemies;
ArrayList<Email> emails;
Jones jones;

ArrayList<Cloud> clouds;
float cloudTimer;
float cloudCount;
ArrayList<PImage> people;
ArrayList<PImage> mails;
ArrayList<PImage> people_s;

PFont font;
PImage teacher,quit,hp,arrow;
PImage d0,d1,d2,d3,m0,m1;
PImage cloud1,cloud2,cloud3;
PImage background,enter,enterH,open,sec,end;

final int canvasWidth = 800;
final int canvasHeight = 350;

int readTime;


//control the level
boolean email;
boolean sinewalk;
float emailSpeed;

float latestSpawn;
float latestEmail;

float spawnTimer;
float emailTimer;
int cloudMove;


public class CollideObject
{
  public float x;
  public float y;
  public float w;
  public float h;
  
  CollideObject(){
    x = 0;
    y = 0;
    w = 1;
    h = 1;
  }
}

void setup() {

  // size(document.body.clientWidth,document.body.clientHeight,P2D);
	size(canvasWidth, canvasHeight, P2D);
  people_s = new ArrayList<PImage>();
  for(int i = 0 ; i < 7; i++)  {
    PImage pi_s = new PImage();
    pi_s = loadImage("img/head_s/p"+i+"_s.png");
    people_s.add(pi_s);
  }
  
  people = new ArrayList<PImage>();
  for(int i = 0 ; i < 8; i++)
  {
    PImage pi = new PImage();
    pi = loadImage("img/head/P"+i+".png");
    people.add(pi);
  }
  mails = new ArrayList<PImage>();
  for(int i = 0 ; i < 7; i++)
  {
    PImage pi = new PImage();
    pi = loadImage("img/mail/p"+i+"_mail.png");
    mails.add(pi);
  }
  
  font = createFont("font/GenSenRounded-R.ttc", 32);
  textFont(font);
 
 end = loadImage("img/end.jpg");
 coverPhoto = loadImage("img/coverPhoto.jpg");
 sec = loadImage("img/sec.jpg");
 hp = loadImage("img/hp.png"); 
 quit = loadImage("img/quit.png");
 arrow = loadImage("img/arrow.png");
 teacher = loadImage("img/teacher.png");
 d0 =  loadImage("img/d0.png");
 d1 =  loadImage("img/d1.png");
 d2 = loadImage("img/d2.png");
 d3 = loadImage("img/d3.png");
 m0 = loadImage("img/m0.png");
 m1 =  loadImage("img/m1.png");
 cloud1 =  loadImage("img/cloud1.png");
 cloud2 =  loadImage("img/cloud2.png");
 cloud3 =  loadImage("img/cloud3.png");
 background = loadImage("img/background.jpg");
 enter = loadImage("img/enter0.png");
 enterH = loadImage("img/enter_h.png");
 open = loadImage("img/open.jpg");
 clouds = new ArrayList<Cloud>();
 
 //enemy
 enemies = new ArrayList<Enemy>();
 emails = new ArrayList<Email>();
 
 //player
 jones = new Jones();
 chars = new ArrayList<Charact>();

 rectMode(CENTER);
 imageMode(CENTER);
 initGame();

}

void initGame() {

    // background(255);
    gameState = 0;
    latestSpawn = 0;
    latestEmail = 0;

    pressedAttack = false;
    jones.hp = 3;

    //char
    initChar();
    //background
    
    cloudTimer = 80;
    cloudCount = 0;
    
  email = false;
  sinewalk = false;
  emailSpeed = 4;

  spawnTimer = 5000;
  emailTimer = 4000;
  cloudMove = 1;

}


boolean buttonClick(int mouseX,int mouseY,int x1,int y1,int x2,int y2) {
    return ((mouseX > x1 && mouseX < x2) || (mouseX > x2 && mouseX < x1)) &&
        ((mouseY > y1 && mouseY < y2) || (mouseY > y2 && mouseY < y1));
}

void draw() {
    
    if (gameState == 0) {
        readTime = millis();
        fill(255, 0, 0);
        image(open,width/2,height/2,width,height);
        image(arrow,width-112,height-48,172,92);
        if (buttonClick(mouseX, mouseY, width-112-172/2, height-48-92/2, width-112+172/2,height-48+92/2)) {
            image(arrow,width-112-8.5,height-48-4,172*1.1,92*1.1);
            if (mousePressed) {
                gameState = 3;
            }
        }
    }
    else if (gameState == 1) {
        image(background,width/2,height/2,width,height);

        // background
        cloudCount+=random(1);
        if(cloudCount > cloudTimer)
        {
            createBackground();
            cloudCount = 0;
        }
        for(Cloud c : clouds)
        {
          c.updateBackground();
        }
        
        // player
        jones.move();
        jones.show();
        
        // enemy
        if ((millis() - latestSpawn) > spawnTimer) {
            spawnEnemy(floor(random(3)),sinewalk);
            latestSpawn = millis();
        }
        // email
        if(email)
        {
          if ((millis() - latestEmail) > emailTimer) {
              spawnEmail(sinewalk);
              latestEmail = millis();
          }
        }
        // character
        for(Charact c : chars){
          c.move(jones);
          c.show();
        };
  

        // bullet
        for(int i=0;i<bullets.size();i++)
        {
          bullets.get(i).show();
          bullets.get(i).update(enemies);    
        }
        
        // enemy
        for(Enemy e : enemies)
        {
          e.move();
          e.show();
        }
        for(Email e : emails)
        {
          e.move();
          e.show();
        }
        // UI
        showHMD();
        
        // cd OK, bigger

        if((millis()-jones.timer) > jones.cd)
          pressedAttack = true;
        if(mousePressed)
        {
          //click attack
          if(buttonClick(mouseX,mouseY,canvasWidth-66-50,canvasHeight-66-50,canvasWidth-66+50,canvasHeight-66+50))
          {
            if(pressedAttack)
            {
              jones.attack();
              jones.timer = millis();
              pressedAttack = false;
            }
          }     
          else if(mouseX < width / 2)
          {
            jones.clickMove(mouseX,mouseY);
          }
        }     
    }
    else if(gameState == 2)
    {
      tint(128,64);
      image(background,width/2,height/2);
     
      // background
      for(Cloud c : clouds) c.show();
      // player
      jones.show();
        
        // bullet
        for(int i=0;i<bullets.size();i++)   bullets.get(i).show(); 
        
        // enemy
        for(Enemy e : enemies) e.show();
 

     noTint();
     image(mails.get(showId),width/2,height/2);
     image(quit,width/2+232,height/2-151+12,62,62);
      
    if(circleCollision2(mouseX,mouseY,width/2+232,height/2-151,76))
    {
      image(quit,width/2+232,height/2-151+12,76,76);
        if(mousePressed)
        {
            gameState = 1;
        }
    }
    }
    else if(gameState == 3)
    {
        image(sec,width/2,height/2,width,height);
        image(arrow,width-112,height-48,172,92);
        if (buttonClick(mouseX, mouseY, width-112-172/2, height-48-92/2, width-112+172/2,height-48+92/2)) {
            image(arrow,width-112-8.5,height-48-4,172*1.1,92*1.1);
            if (mousePressed) {
               if(millis() - readTime > 400)
                gameState = 1;
            }
        }

    }
    else if(gameState == 4)
    {
        // finish
        image(end,width/2,height/2,width,height);

    }
    else if(gameState == 5)
    {
      // clear all things
      // enemies
      enemies.clear();
      emails.clear();
      
      // character
      chars.clear();
      clouds.clear();
      initGame();
      // jones
      jones.hp = 4;
      gameState = 0;
    }
    if(bullets.size() > 10) bullets.remove(0);
    if(enemies.size() > 15) enemies.remove(0);
    if(emails.size() > 10) emails.remove(0);
    if(clouds.size() > 10) clouds.remove(0);
}


boolean circleCollision2(int x1, int y1, int x2, int y2, int r)
{    
    if(pow(x1-x2,2) + pow(y1-y2,2) < pow(r,2))
        return true;
    return false;
}


boolean circleCollision(CollideObject a, CollideObject b)
{    
    if(pow(a.x-b.x,2) + pow(a.y-b.y,2) < b.w * b.w)
        return true;
    return false;
}