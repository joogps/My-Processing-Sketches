ArrayList<Firework> fireworks;
PFont font;

void setup() {
  size(900, 460);
  colorMode(HSB);

  fireworks = new ArrayList();
  font = createFont("Product Sans Bold.ttf", 12);
}

void draw() {
  background(0);
  textFont(font);
  textAlign(CENTER, CENTER);

  if (day() == 31 && month() == 12) {
    int hoursLeft = 23-hour();
    int minutesLeft = 59-minute();
    int secondsLeft = 59-second();

    float size = 1-((hoursLeft*60*60+minutesLeft*60+secondsLeft)/86400.0);

    textSize(autoTextSize(nf(hoursLeft, 2)+":"+nf(minutesLeft, 2)+":"+nf(secondsLeft, 2), width*5/8.0, height/2.0, 1)*size);
    text(nf(hoursLeft, 2)+":"+nf(minutesLeft, 2)+":"+nf(secondsLeft, 2), width/2, height/2);
  } else {
    autoTextSize("Happy "+year()+"!", width*3/4.0, height/2.0, 1);
    text("Happy "+year()+"!", width/2.0, height/2.0);

    for (int i = 0; i < fireworks.size(); i++) {
      if (fireworks.get(i) != null) {
        fireworks.get(i).display();
        fireworks.get(i).update();
      }
    }

    if (frameCount%30 == 0 || random(1) < 0.01)
      fireworks.add(new Firework(new PVector(random(width), height), new PVector(0, random(-10, -50)), random(255), round(random(1, 2.5)), fireworks.size()));
  }
}

float autoTextSize(String str, float w, float h, int l) {
  textSize(1);
  float minW = w/textWidth(str);
  float minH = h/float(l);
  textSize(min(minW, minH));
  
  return min(minW, minH);
}