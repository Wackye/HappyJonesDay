class Jones extends CollideObject {
    float targetX;
    float targetY;
    int w;
    int h;
    float angle;
    int cd;
    int timer;
    int hp;
    float dist;
    Jones()
    {
        this.hp = 3;
        this.x = canvasWidth*1/8;
        this.y = canvasHeight/2;
        this.targetX = this.x;
        this.targetY = this.y;
        this.w = 102;
        this.h = 106;
        this.cd = 500;
        this.timer = millis();
        this.dist = 0;
    }
    
    void clickMove(int xx, int yy)
    {
        targetX = xx;
        targetY = yy;        
        dist = -1;
        angle = atan2(targetY - y, targetX - x);       
    }

  void move()
  {   
      if(dist == -1 || dist > (pow(x+cos(angle) - targetX,2) + pow(y+sin(angle) - targetY,2)))
      {
          x += cos(angle);
          y += sin(angle);   
          dist = pow(x - targetX,2) + pow(y - targetY,2);
      }
  }

  void show()
  {
      image(teacher,x,y,w,h);
  }

  void attack()
  {
    Bullet bul = new Bullet(this.x,this.y);
    bullets.add(bul);
  }
}
