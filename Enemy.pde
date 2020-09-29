
class Enemy extends CollideObject {
  int type;
  boolean walk;
  float walkY;
  float walkScale;
  float walkPhase;
  boolean attacked;
  float deadTime = 255;
  Enemy(int locx,int locy,int ty, boolean sine) {
        this.x = locx;
        this.y = locy;
        this.w = 80;
        this.h = 80;
        this.type = ty;
        this.walk = sine; 
        this.walkY = this.y;
        this.walkScale = random(50)+20;
        this.walkPhase = 0;
    }
  void move() 
  {
      if(!attacked)
      {
        x--;
        if(walk)
        {
            y = walkY + floor(cos(walkPhase) * walkScale);
            walkPhase += 0.05;
            if(walkPhase > 3.14 * 2) walkPhase = 0;
        }
        
        if(circleCollision(jones,this))
        {
          jones.hp--;
          attacked = true;
          if(jones.hp <= 0) gameState = 5;
        }
      }
  }

  void show() 
  {
    if(!attacked)
    {
      switch(type)
      {
        case 0:
          image(d0,x,y,w,h);
          break;
        case 1:
          image(d1,x,y,w,h);
          break;
        case 2:
          image(d2,x,y,w,h);
          break;
      }
    }
    else if(deadTime > 0 && w > 1 && h > 1)
    {
      tint(255,deadTime);
      image(d3,x,y,w,h);
      noTint();
      deadTime-=2;
      w *= 0.95;
      h *= 0.95;;
      println(w);
      println(deadTime);
   }
    else{
      w = 0;
      h = 0;

    }
  }

}

void spawnEnemy(int type, boolean sine) {
    Enemy e = new Enemy(canvasWidth, floor(random(canvasHeight)) * 5 / 6,type,sine);
    enemies.add(e);
}