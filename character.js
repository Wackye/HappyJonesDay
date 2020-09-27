var chars = [];
let p0,p1,p2,p3,p4,p5,p6;
var images = [];


function onload(){

    images = document.images;
    console.log(images[0].src);
}

var data = {"number" : 7,
    "character" : ["giho", "wei", "carol","yi","wayne","horse","ming"],
    "seconds" : [2,3,4,5,6,7],
    "sentence" : ["A",
                  "B",
                  "C",
                  "D",
                  "E",
                  "F",
                  "G"]
}

class character {
    constructor(name, sec,sentence,idx)
    {
        this.name = name;
        this.sentence = sentence;
        this.sec = sec;
        this.sentence = sentence;
        this.x = width;
        this.y = Math.random() * height * 4 / 5 + height / 5;
        this.img = images[idx].src;
        this.count = millis();
        this.state = false;
    }

}

function initChar()
{
    
    for(var i = 0; i < 7;i++)
    {
        var c = new character(data.character[i],data.seconds[i],data.sentence[i],i);
        chars.push(c);
    }
}

function cMove(c)
{
    if(c.state == false && (millis() - c.count) / 1000 > c.sec)
    {
        c.state = true;
    }
    
    if(c.state == true)
    { 
        c.x-=1;
        if(circleCollision(c,jones))
        {
            showCongradulation(c.img,c.sentence);
        }
    }
}

function drawChar(c){
    ellipse(c.x,c.y,240,240);
    image(c.img,c.x,c.y,240,240);
}