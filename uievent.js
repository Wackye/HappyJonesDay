var pressedAttack = false;

function showHMD()
{

    // attack
    if(pressedAttack) fill(0,255,255);
    else fill(192,255,255);
    ellipse(width - 66,height - 66,100,100);
    // people
    for(var i = 0; i < 7; i++)
    {
        ellipse(width-100-(i+1)*60,height - 30-16,48,48);
    }

}


function buttonClick(mouseX, mouseY, x1, y1, x2, y2) {
    console.log(((mouseX > x1 && mouseX < x2) || (mouseX > x2 && mouseX < x1)));
    return ((mouseX > x1 && mouseX < x2) || (mouseX > x2 && mouseX < x1)) &&
        ((mouseY > y1 && mouseY < y2) || (mouseY > y2 && mouseY < y1));
}

function showCongradulation(){
    noFill();
    stroke(60);
    strokeWeight(2);
    rect(width/2,height/2,width/3,height/3);
    ellipse(width/4,height/2,120,120);

    fill(255,0,0);
    rect(width/2,height * 3 / 4,120,40,10);
}