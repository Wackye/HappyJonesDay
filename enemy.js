
class Enemy {
    constructor(locx, locy) {
        this.x = locx;
        this.y = locy;
        this.width = 40;
        this.height = 30;
        this.type = "book";
        this.walk = false; 
    }
}
function move(e) 
{
    e.y++;
    if(e.y > height+50) 
    {
        enemies.shift(1);
        e = null;
    }
}

function show(e) 
{
    move(e);
    fill(0);
    rect(e.x,e.y,e.width,e.height);
}

function spawnEnemy(type) {
    var e = new Enemy(Math.random()*width * 1 / 3 + width * 2/ 3, Math.random()*height);
    enemies.push(e);
    show(e);
}
