import com.hamoid.*;

float x = 100, y = 100, xV = 5, yV = 5;
VideoExport videoExport;

void setup() {
	size(800,600);
	noStroke();
	
	videoExport = new VideoExport(this, "bouncingBall.mp4");
	videoExport.startMovie();
}

void draw() {
	background(24); x += xV; y += yV;
	if (x > width - 50 || x < 50) {xV *= -1;}
	if (y > height - 50 || y < 50) {yV *= -1;}
	fill(100, 50, 255); circle(x, y, 100);
	
	videoExport.saveFrame();
}

void keyPressed() {
	if (key == 'q') {
    videoExport.endMovie();
    exit();
  }
}
