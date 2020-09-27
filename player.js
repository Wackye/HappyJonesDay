
var bullets = [];
var attackcd = 300;
var attackCount = 0;
var slogan = ["OK","WellDone","糟糕","天哪","很好","那你那邊呢","是不是很簡單"];
var sloganSize = [30,24,27,27,27,20,18];
class Player {
    constructor()
    {
        this.x = width*1/8;
        this.y = height/2;
        this.targetX = this.x;
        this.targetY = this.y;
    }
}

class Bullet {
    constructor(p){
        this.x = p.x;
        this.y = p.y;
        this.width = 30;
        this.height = 30;
        var idx = floor(Math.random() * 7);
        this.text = slogan[idx];
        this.size = sloganSize[idx];
    }

}
function collision(minX1, maxX1, minY1,maxY1, minX2, maxX2, minY2, maxY2) {
    
    if (maxX1 > minX2 && maxX2 > minX1 &&
        maxY1 > minY2 && maxY2 > minY1) {
        return true;
    }
    else
        return false;

}


function clickMove(p)
{
    p.targetX = mouseX;
    p.targetY = mouseY;        
    p.angle = Math.atan2((p.targetY - p.y),(p.targetX - p.x));
        
}

function playerMove(p)
{
    // console.log([floor(p.x),floor(p.y),floor(p.targetX),floor(p.targetY)]);
    if(Math.abs(p.x - p.targetX) > 1 || Math.abs(p.y - p.targetY) > 1)
    {
        p.x += Math.cos(p.angle) * 2;
        p.y += Math.sin(p.angle) * 2;   
    }
}

function playerDraw(p)
{
    fill(60);
    ellipse(p.x,p.y,30,30);
}

function attack(p)
{
    
    if(millis() - attackCount > attackcd)
    {
        attackCount = millis();
        var bul = new Bullet(p);
        bullets.push(bul);
    }
}

function drawBullet(b)
{
    textSize(b.size);
    text(b.text,b.x,b.y);
}
function updateBullet(b)
{
    b.x+=3;
    for(var i = 0; i < enemies.length; i++)
    {
        if(collision(b.x - b.width/2,b.x + b.width/2,b.y-b.height/2,b.Y+b.height/2,
            enemies[i].x-enemies[i].width/2, enemies[i].x+enemies[i].width/2,
            enemies[i].y-enemies[i].height/2, enemies[i].y+enemies[i].height/2))
        {
            enemies[i] = null;
            enemies.splice(i,1);
            var idx = bullets.find(b);
            b = null;
            bullets.splice(idx,1);
        }
    }
}