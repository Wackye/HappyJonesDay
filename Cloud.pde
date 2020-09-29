public class Cloud extends CollideObject {

  float speed;
  boolean wave;
  float waveScale;
  float wavePhase;
  int type;
  float walkY;
  
  Cloud(float xx,float yy)
  {
    this.x = xx;
    this.y = yy;
    this.walkY = y;
    this.speed = random(cloudMove/2)+cloudMove;
    this.wave = true;
    this.waveScale = random(20);
    this.wavePhase = 0;
    this.w = 106+random(20);
    this.h = 70+random(10);;
    this.type = floor(random(3));
  }
  
  void updateBackground()
  {
    x = x - speed;
    if(this.wave == true)
    {
      wavePhase += random(0.02);
      y = walkY + cos(this.wavePhase)* waveScale;
      if(wavePhase > 6.28) wavePhase = 0;
    }
    switch(type)
    {
      case 0:
        image(cloud1,x,y,w,h);
        break;
      case 1:
        image(cloud2,x,y,w,h);
        break;
      case 2:
        image(cloud3,x,y,w,h);
        break;
    }
  }
  void show()
  {

    switch(type)
    {
      case 0:
        image(cloud1,x,y,w,h);
        break;
      case 1:
        image(cloud2,x,y,w,h);
        break;
      case 2:
        image(cloud3,x,y,w,h);
        break;
    }
  }
}


void createBackground(){
    Cloud c = new Cloud(canvasWidth + 50, random(canvasHeight));
    clouds.add(c);
}