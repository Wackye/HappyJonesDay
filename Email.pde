

class Email extends Enemy {
  float speed; 
  Email(int locx,int locy, boolean sine)
  {
    super(locx,locy,0,sine);
    w = 65;
    h = 65;
    speed = random(emailSpeed)+2;
  }
  
  void move()
  {
    x-=speed;
    if(!attacked)
      {
        if(circleCollision(jones,this))
        {
          jones.hp--;
          attacked = true;
          if(jones.hp <= 0) gameState = 0;
        }
      }
    
  }
  
  void show() 
  {
    if(!attacked)
    {
      image(m0,x,y,w,h);
    }
    else if(deadTime > 20)
    {
      tint(255,deadTime);
      image(m1,x,y,w,h);
      noTint();
      deadTime-=3;
      speed = 2;
    }
    else{
      w = 0;
      h = 0;
    }
  }
} 

void spawnEmail(boolean sine) {
    Email e = new Email(canvasWidth, floor(random(canvasHeight) * 5 / 6),sine);
    emails.add(e);
}