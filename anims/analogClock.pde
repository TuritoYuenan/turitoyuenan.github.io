/* Modified https://processing.org/examples/clock.html */
int cx, cy; float rS, rM, rH, dC;

void setup() {
	size(640, 360); stroke(255);

	int rC = min(width, height) / 2; cx = width / 2; cy = height / 2;
	rH = rC * 0.50; rM = rC * 0.60; rS = rC * 0.72; dC = rC * 1.8;
}

void draw() {
	background(0);

	// Draw the clock background
	fill(80); noStroke(); circle(cx, cy, dC);

	// Angles for sin() and cos() start at 3 o'clock;
	// subtract HALF_PI to make them start at the top
	float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
	float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
	float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;

	// Draw the hands of the clock
	stroke(255);
	strokeWeight(1); line(cx, cy, cx + cos(s) * rS, cy + sin(s) * rS);
	strokeWeight(2); line(cx, cy, cx + cos(m) * rM, cy + sin(m) * rM);
	strokeWeight(4); line(cx, cy, cx + cos(h) * rH, cy + sin(h) * rH);

	// Draw the minute ticks
	strokeWeight(2); beginShape(POINTS);
	for (int a = 0; a < 360; a+=6) {
		float angle = radians(a);
		float x = cx + cos(angle) * rS;
		float y = cy + sin(angle) * rS;
		vertex(x, y);
	} endShape();
}
