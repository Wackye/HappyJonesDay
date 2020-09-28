var timer;
var fontSize = 72;
function setup(){
createCanvas(document.body.clientWidth,document.body.clientHeight);
rectMode(CENTER);
imageMode(CENTER);
noStroke();
textSize(fontSize);
textFont('Indie Flower');
}

function draw(){
    // 目標時間:9/29,
    // 現在時間:hours
    var timeRemain = getTimeRemaining('2020-09-29T01:00:00');
    fill(240);
     rect(width/2 - 132,height/2-6,80,80);
     rect(width/2,height/2-6,80,80);
     rect(width/2 + 132,height/2-6,80,80);

    fill(0);
    text(padLeft(timeRemain.hours,2),width/2 - 132 -fontSize /2, height/2 + fontSize /2 - 15);
    text(padLeft(timeRemain.minutes,2),width/2 -fontSize /2, height/2 + fontSize /2- 15);
    text(padLeft(timeRemain.seconds,2),width/2 + 132-fontSize /2, height/2 + fontSize /2- 15);

}