var state;
var coverPhoto;
var timer;
var enemies = [];
var latestTime;
var jones;
var clouds = [];
var cloudTimer;
var cloudCount;

class Cloud {
  constructor(){
    this.x = width + 10;
    this.y = Math.random() * height;
    this.speed = Math.random() * 1.5;
    this.wave = true;
    this.waveScale = Math.random() * 10 + 5;
    this.wavePhase = 0;
    this.width = Math.random()*120 + 50;
    this.height = Math.random()*60 + 25;
  }

}



function createBackground()
{
    var c = new Cloud();
    clouds.push(c);
}

function updateBackground(obj)
{
  obj.x-= Math.random() * 4;
  if(obj.wave == true)
  {
    y = obj.y + cos(obj.wavePhase) * obj.waveScale;
    if(obj.wavePhase > 3.14) obj.wavePhase = 0;
  }

  fill(192,255,255,30);
  ellipse(obj.x,obj.y,obj.width,obj.height);

  if(obj.x < -20)
  {
      obj = null;
      clouds.shift();
  }
}

function buttonClick(mouseX, mouseY, x1, y1, x2, y2) {
    return ((mouseX > x1 && mouseX < x2) || (mouseX > x2 && mouseX < x1)) &&
        ((mouseY > y1 && mouseY < y2) || (mouseY > y2 && mouseY < y1));
}

function preload()
{

}

function setup() {
    createCanvas(document.body.clientWidth,document.body.clientHeight);
    background(255);
    state = 1;
    timer = 100;
    rectMode(CENTER);
    latestTime = millis();
    jones = new Player();
    initChar();
    cloudTimer = 80;
    cloudCount = 0;
}

function draw() {
    
    if (state == 0) {

        fill(255, 0, 0);
        rect(width / 2, height / 2, width, height);

        rect(width / 2, height /2, 120, 40, 10);
        // console.log([mouseX,mouseY]);
        if (buttonClick(mouseX, mouseY, width / 2 - 60, height / 2 - 20, width / 2 + 60, height / 2 + 20)) {
            fill(255, 255, 0);
            rect(width / 2, height / 2, 120, 40, 10);
            if (mouseIsPressed) {
                state = 1;
            }
        }
    }
    else if (state == 1) {
        background(255);
        pressedAttack = false;

        // background
        cloudCount+=Math.random();
        if(cloudCount > cloudTimer)
        {
            createBackground();
            cloudCount = 0;
        }
        clouds.forEach( e => updateBackground(e));
        
        // player
        playerMove(jones);
        playerDraw(jones);
        if ((millis() - latestTime) > 3000) {
            spawnEnemy("book");
            latestTime = millis();
        }
        
        // character
        chars.forEach(c => cMove(c));
        chars.forEach(c => drawChar(c));

        // enemies
        enemies.forEach(e => show(e));
        

        // bullet
        bullets.forEach(e => updateBullet(e));
        bullets.forEach(e => drawBullet(e));
        
        // UI
        showHMD();


        if(mouseIsPressed)
        {
            
            if(buttonClick(mouseX,mouseY,width-66-50,height-66-50,width-66+50,height-66+50))
            {
                pressedAttack = true;
                console.log(pressedAttack);
                attack(jones);
            }
            else
            {
                clickMove(jones);
            }
        }


    }

    
}
