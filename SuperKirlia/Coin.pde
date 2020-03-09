//Klasa koja reprezentira novčić u igri koji se može skupiti. Jedan
//novčić vrijedi 10 bodova, ali to je uvijek fiksno, pa nije zapisano ovdje
class Coin{
  //Centar novčića
  Point center;
  //Radijus novčića
  int radius;
  PImage imgCoin;
  //Konstruktor
  Coin(Point p, int r){
    center = p;
    radius = r;
    imgCoin = loadImage("coin1.png");
    imgCoin.resize(230, 230);
  }
  //Konstruktor
  Coin(){
    imgCoin = loadImage("coin1.png");
    imgCoin.resize(230, 230);
  }
  //Postavlja centar
  void setCenter(int X, int Y){
    setCenter(new Point(X, Y));
  }
  //Postavlja centar
  void setCenter(Point p){
    center = p;  
  }
  //Postavlja radijus
  void setRadius(int r){
    radius = r;
  }
  //Vraća centar
  Point getCenter(){
    return center;
  }
  //Vraća radijus
  int getRadius(){
    return radius;
  }
  //Crta novčić
  void draw(){
    image(imgCoin, center.x - 122, center.y - 95);
    /*stroke(255);
    fill(255);
    circle(center.getX(), center.getY(), radius);*/
  }
}
