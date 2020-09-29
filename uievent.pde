boolean pressedAttack;
boolean finish = false;
void showHMD()
{
    for(int i = 0; i < jones.hp; i++)
    {
      image(hp,12+78/2+i*(90),12+56/2,78,56);
    }

    // attack
    if(pressedAttack){
      
      image(enterH,width-148/2,height-148/2,132,132);
    }
    else {
      image(enter,width-148/2,height-148/2+12,148,148);
    }
    // people

    finish = true;
    for(int i = 0; i < 7; i++)
    {
      if(chars.get(i).got == false){
         tint(0, 32);
         finish = false;
      }
      image(people_s[i],width-192-i*92,height-12-36,72,72);
      noTint();
    }
    if(finish) gameState = 4;
}

//void showCongradulation(Charact c){
//    noFill();
//    stroke(60);
//    strokeWeight(2);
//    rect(width/2,height/2,width/3,height/3);
//    ellipse(width/4,height/2,120,120);

//    fill(255,0,0);
//    rect(width/2,height * 3 / 4,120,40,10);
//}
