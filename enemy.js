
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
    e.x--;
    if(e.x < -50) 
    {
        enemies.shift();
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
    var e = new Enemy(width, Math.random()*height * 5 / 6);
    enemies.push(e);
    show(e);
}