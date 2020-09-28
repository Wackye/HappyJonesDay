PImage test;

void setup() {
	size(640, 480, P2D);
	test = loadImage("img/P0.png");	
	initGame();

}

void initGame(){

}

void draw() {
	background(192,192,192);
	image(test, 0, 0, 200, 200);
}