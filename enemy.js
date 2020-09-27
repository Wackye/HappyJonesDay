
class Enemy {
    constructor(locx, locy) {
        this.x = locx;
        this.y = locy;
        this.width = 40;
        this.height = 30;
        this.type = "book";
        this.walk = true; 
        this.walkY = this.y;
        this.walkScale = 60;
        this.walkPhase = 0;
    }
}
function move(e) 
{
    e.x--;
    if(e.walk)
    {
        e.y = e.walkY + Math.cos(e.walkPhase) * e.walkScale;
        e.walkPhase += 0.05;
        if(e.walkPhase > 3.14 * 2) e.walkPhase = 0;

    }
    
    if(e.x < -20) 
    {
        
        var idx = enemies.findIndex(el => el == e);
        enemies.slice(idx,1);
        // e = null;
    }
}

function show(e) 
{
    move(e);
    fill(0);
    rect(e.x,e.y,e.width,e.height);
}

function spawnEnemy(type) {
    var e = new Enemy(width, Math.random()*height * 5 / 6);
    enemies.push(e);
    show(e);
}