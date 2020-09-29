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
      image(people_s.get(i),width-192-i*92,height-12-36,72,72);
      noTint();
    }
    if(finish) gameState = 4;
}
