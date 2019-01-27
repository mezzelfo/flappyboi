import java.util.LinkedList;

class Pillar
{
  float posx, posy, w, h, a;
  Pillar(float x)
  {
    posx = x;
    posy = height;
    w = 150;
    h = random(200,500);
    a = 200;
  }
  boolean isSplatted(Bird flappyboi)
  {
    
    if (!flappyboi.alive) return true;
    if ((flappyboi.posy < 0) || (flappyboi.posy > height)) return true;
    if((posx-w <= flappyboi.posx) && (flappyboi.posx <= posx))
    {
      if((flappyboi.posy <= height-h-a) || (flappyboi.posy >= height-h))
      {
        return true;
      }
    }
    return false;
  }
  void display() {rect(posx,posy,-w,-h);rect(posx,0,-w,height-h-a);}
}
class PillarManager
{
  int passed = 0;
  final int n = 5;
  LinkedList<Pillar> pillarList;
  PillarManager()
  {
    pillarList = new LinkedList<Pillar>();
    pillarList.addFirst(new Pillar(width));
    for(int i=0; i<n-1; i++) pillarList.addLast(new Pillar(pillarList.getLast().posx + random(300,450)));
  }
  
  void display()
  {
    for(Pillar p : pillarList) p.display();
  }
  
  void move()
  {
    for(Pillar p : pillarList) p.posx -= 5;
    if (pillarList.getFirst().posx < 0)
    {
      pillarList.removeFirst();
      pillarList.addLast(new Pillar(pillarList.getLast().posx + random(300,450)));
      passed++;
    }
  }
  
}
