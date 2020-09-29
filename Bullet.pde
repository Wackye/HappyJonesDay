public ArrayList<Bullet> bullets = new ArrayList<Bullet>();
public String[] slogan = {"OK","WELLDONE","天哪","很好","那你那邊呢","是不是很簡單"};
public int[] sloganSize = {30,24,27,27,27,20,18};
class Bullet extends CollideObject {

  String text;
  int size;
  color col;
  boolean used; 
  Bullet(float xx, float yy){
      this.x = xx;
      this.y = yy;
      this.w = 30;
      this.h = 30;
      
      int id = floor(random(6));
      this.text = slogan[id];
      this.size = sloganSize[id];
      this.col = color(random(128)+64,random(128)+64,random(128)+64);
      used = false;
  }
  

  void show()
  {
      if(used) return;
      fill(col);
      textSize(size);
      text(text,x,y);
  }
  
  boolean update(ArrayList<Enemy> enemies)
  {
    x+=3;
        
    for(int i = 0; i < enemies.size(); i++)
    {
        if(circleCollision(this,enemies.get(i)) && !enemies.get(i).attacked && !this.used)
        {
            enemies.get(i).attacked = true;
            this.used = true;
        }
    }
    
    return false;
  }
 
}

//boolean collision(int minX1,int maxX1,int minY1,int maxY1,int minX2,int maxX2,int minY2,int maxY2) {
    
//    if (maxX1 > minX2 && maxX2 > minX1 &&
//        maxY1 > minY2 && maxY2 > minY1) {
//        return true;
//    }
//    else
//        return false;
//}
