var chars = [];
var data = {"number" : 7,
    "character" : ["giho", "wei", "carol","yi","wayne","horse","ming"],
    "seconds" : [10,20,30,40,50,60],
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
        this.sentence = "";
        this.x = width + 30;
        this.y = Math.random() * height;
        console.log(String(idx+".png"));
        this.img = loadImage(String(idx+".png"));
        this.count = millis();
        
    }

}

function initChar()
{
    
    for(var i = 0; i < data.number;i++)
    {
        var c = new character(data.character[i],data.seconds[i],data.sentence[i],i);
        chars.push(c);
    }
}

function cMove(c)
{
    if((c.count - millis()) / 1000 > c.sec)
    {
        c.x-=1;
    }
}

function drawChar(c){
    image(c.img,c.x,c.y);
}