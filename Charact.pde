ArrayList<Charact> chars;
int showId = 0;
String[] charName = {"giho", "wei", "carol","yi","wayne","horse","ming"};
int[] seconds = {15,25,35,50,60,75,90};

class Charact extends CollideObject{
    
  String name;
  float sec;
  int id;
  PImage img;
  float count;
  int state;
  boolean got;
  
  Charact(String name,float sec, PImage img, int idx)
  {
        this.name = name;
        this.sec = sec;
        this.id = idx;
        this.x = width+200;
        this.y = floor(random((float)canvasHeight) * 0.8 + (float)canvasHeight / 5);
        this.img = img;
        this.count = millis();
        this.state = 0;
        this.w = 72;
        this.h = 72;
        this.got = false;
    }
  
   void move(Jones jones)
    {
        if(state == 0 && (millis() - count) / 1000 > sec)
        {
          state = 1;
          // start move
        }
        
        if(state == 1 && !got)
        { 
          x--;
          if(circleCollision(jones,this))
          {
            state = 2;
            gameState = 2;
            showId = id;
            got = true;
            
            switch(id)
            {
              case 2:
                sinewalk = true;
                break;
              case 4:
                email = true;
                spawnTimer = 8000;
              case 6:
                emailSpeed = 4;
                cloudMove = 3;
                break;
            }
          }
        }
    }

  void show()
  {
      if(state == 1) {
        image(img,x,y,w,h); 
      }
  }
}

void initChar()
{
    for(int i = 0; i < 7; i++)
    {
        Charact c = new Charact(charName[i],seconds[i],people_s.get(i),i);
        chars.add(c);
    }
}