SnowFlake [] snow;

void setup()
{
  size(500, 500);
  background(1, 3, 49);
  smooth();
  noStroke();
  snow = new SnowFlake[600];
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
  int x, flakeSize;
  boolean isMoving;
  double y, flakeSpeed;
  SnowFlake()
  {
    x=(int)(Math.random()*500);
    y=(Math.random()*500);
    isMoving=true;
    flakeSize=(int)(Math.random()*6);
    flakeSpeed=(Math.random()*2+.5);
  }
  void show()
  {
    noStroke();
    fill(255);
    ellipse(x, (int)(y), flakeSize, flakeSize);
  }
  void lookDown()
  {
    if ((int)y>0 && (int)y<460 && get(x, (int)y+4)!= color(1, 3, 49))
    {
        isMoving=false;
        fill(1, 3, 49);
        ellipse(x, (int)y, 0, 0);
    }else
    {
      isMoving=true;
      fill(1, 3, 49);
      ellipse(x, (int)y, flakeSize+3, flakeSize+3);
    }
  }
  void erase()
  {
    if (mousePressed && (mouseButton==RIGHT))
    {
      fill(1, 3, 49);
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
      flakeSpeed=Math.random()*1.2+.9;
    }
  }
}

