SnowFlake [] snow;

void setup()
{
  size(500, 500);
  background(0);
  smooth();
  noStroke();
  snow = new SnowFlake[325];
  for (int i=0; i<snow.length; i++)
  {
    snow[i]= new SnowFlake();
  }
}
void draw()
{
  for (int i=0; i<snow.length; i++)
  {
    snow[i].erase(); 
    snow[i].lookDown();
    snow[i].move();
    snow[i].wrap();
    snow[i].show();
  }
}

void mouseDragged()
{
  if (mousePressed && (mouseButton==LEFT))
  {
    fill(95, 170, 58, 200);
    ellipse(mouseX, mouseY, 15, 15);
  }
}

class SnowFlake
{
  int x, flakeSize, flakeSpeed, y;
  boolean isMoving;
  SnowFlake()
  {
    x=(int)(Math.random()*500);
    y=(int)(Math.random()*500);
    isMoving=true;
    flakeSize=(int)(Math.random()*6);
    flakeSpeed=(int)(Math.random()*2+1);
  }
  void show()
  {
    noStroke();
    fill(255);
    ellipse(x, y, flakeSize, flakeSize);
  }
  void lookDown()
  {
    if (y>0 && y<460 && get(x, y+4)!= color(0))
    {
        isMoving=false;
        fill(0);
        ellipse(x, y, 0, 0);
    }else
    {
      isMoving=true;
      fill(0);
      ellipse(x, y, flakeSize+3, flakeSize+3);
    }
  }
  void erase()
  {
    if (mousePressed && (mouseButton==RIGHT))
    {
      fill(0);
      ellipse(mouseX, mouseY, 30, 30);
    }
  }
  void move()
  {
    if (isMoving==true)
    {
      y=y+flakeSpeed;
    }
  }
  void wrap()
  {
    if (y>=497)
    {
      y=-1;
      x=(int)(Math.random()*500);
      flakeSpeed=(int)(Math.random()*2+1);
      flakeSize=(int)(Math.random()*6);
    }
  }
}

