
class Player {
    constructor()
    {
        this.x = width/2;
        this.y = height*7/8;
        this.targetX = this.x;
        this.targetY = this.y;
    }
}

function clickMove(p)
{
    p.targetX = mouseX;
    p.targetY = mouseY;        
    p.angle = Math.atan2((p.targetY - p.y),(p.targetX - p.x));
        
}

function playerMove(p)
{
    if(p.x - p.targetX > 1 || p.y - p.targetY > 1)
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
