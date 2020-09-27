var state;
var coverPhoto;
var timer;
var enemies = [];
var latestTime;
var jones;
// function preload() {
//   coverPhoto = loadImage('coverPhoto.jpg');
// }

function collision(x1, y1, x2, y2, x3, y3, x4, y4) {
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


function setup() {
    createCanvas(812, 375);
    background(255);
    state = 1;
    timer = 100;
    rectMode(CENTER);
    latestTime = millis();
    jones = new Player();
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
        playerMove(jones);
        playerDraw(jones);
        if ((millis() - latestTime) > 3000) {
            spawnEnemy("book");
            latestTime = millis();
        }

        enemies.forEach(e => show(e));
        showCongradulation();
    }

    if(mouseIsPressed)
    {
        clickMove(jones);
    }
    
}
