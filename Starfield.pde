Particle[] particles;
void setup()
{
  size (400, 400);
  particles = new Particle [300];
  for (int i = 0; i < particles.length; i++)
  { 
    particles[i] = new NormalParticle();
  }
  {
    particles[0] = new OddballParticle();
    particles[1] = new JumboParticle();
  }
}
void draw()
{
  background(0);
  for (int i = 0; i < particles.length; i++)
  {
    particles[i].move();
    particles[i].show();
  }
}
class NormalParticle implements Particle
{
  double myX, myY, mySpeed, myAngle;
  int myColor;
  NormalParticle()
  {
    myX = 200;
    myY = 200;
    mySpeed = ((Math.random()*2)+1);
    myAngle = (Math.random()*(2*Math.PI));
    myColor = color(random(256), random(256), random(256));
  }
  public void move()
  {
    myX = (Math.cos(myAngle)*mySpeed) + myX;
    myY = (Math.sin(myAngle)*mySpeed) + myY;
    if (myX > 600 || myX < -200 || myY > 600 || myY < -200)
    myX = myY = 200;
  }
  public void show()
  {
    fill(myColor);
    ellipse((int) myX, (int) myY, 5, 5);
  }
  
}
interface Particle
{
  public void move();
  public void show();
}
class OddballParticle implements Particle //uses an interface
{
  double myX, myY;
  int myColor;
  OddballParticle()
  {
    myX = 200;
    myY = 200;
    myColor = color(random(256), random(256), random(256));
  }
  public void move()
  {
    myX++;
    myY++;
    if (myX > 600 || myX < -200 || myY > 600 || myY < -200)
    myX = myY = 200;
  }
  public void show()
  {
    fill(0, 237, 104);
    ellipse((float)myX, (float)myY, 18, 18);
    fill(183, 183, 183);
    ellipse((float)myX, ((float)myY + 8), 30, 10);
  }
}
class JumboParticle extends NormalParticle //uses inheritance
{
  public void move()
  {
    myX = myX - 1;
    myY = myY - 1;
    if (myX > 600 || myX < -200 || myY > 600 || myY < -200)
    myX = myY = 200;
  }
  public void show()
  {
    fill(222, 90, 90);
    ellipse((int) myX, (int) myY, 50, 50);
  }
}
