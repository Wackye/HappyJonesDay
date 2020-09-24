
window.addEventListener("orientationchange",onOrientationchange ,false);
   function onOrientationchange() {
      if (window.orientation === 180 || window.orientation === 0) {
          alert("請轉橫的");
      }
      if (window.orientation === 90 || window.orientation === -90 ){
              //橫式
      } 
   }


var state;
var coverPhoto;

function preload() {
  coverPhoto = loadImage('coverPhoto.jpg');
}
function setup() {

      createCanvas(375, 900);
      var status = 0;
      image(coverPhoto,width/2,height/2,width/2,height/2);
    }
    
function draw() {
  if(state == 0)
  {
    if (mouseIsPressed) {
          fill(0);
        } else {
          fill(255);
        }
        ellipse(mouseX, mouseY, 80, 80);
        
  }
  else if (state == 1)
  {

  }
}

function StartButton (){
  

}
// const s = ( p ) => {

//   let x = 100; 
//   let y = 100;

//   p.setup = function() {
//     p.createCanvas(700, 410);
//   };

//   p.draw = function() {
//     p.background(255,123,123);
//     p.fill(255);
//     p.rect(x,y,50,50);
//   };
// };

// let myp5 = new p5(s,'myContainer');