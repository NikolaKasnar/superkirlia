// Klasa koja reprezentira novcic u igri koji se može skupiti. Jedan
// novcic vrijedi 10 bodova, ali to je uvijek fiksno, pa nije zapisano ovdje
class Coin{
  //------------------Podaci klase----------------
  // Centar novcica
  Point center;
  // Radijus novcica
  int radius;
  // Slika novčića
  PImage imgCoin;
  
  //-------------------Metode klase----------------
  // Konstruktor
  Coin(Point p, int r){
    center = p;
    radius = r;
    imgCoin = loadImage("coin1.png");
    imgCoin.resize(230, 230);
    }
    
  // Konstruktor
  Coin(){
    imgCoin = loadImage("coin1.png");
    imgCoin.resize(230, 230);
    }
    
  // Crta novcic
  void draw(){
    image(imgCoin, center.x - 122, center.y - 95);
    }
    
  //.........................Get funkcije.......................
  
  // Vraca centar
  Point getCenter(){ return center; }
    
  // Vraca radijus
  int getRadius(){ return radius; }
  
  //.........................Set funkcije........................
  
  // Postavlja centar
  void setCenter(int X, int Y){ setCenter(new Point(X, Y)); }
    
  // Postavlja centar
  void setCenter(Point p){ center = p;  }
    
  // Postavlja radijus
  void setRadius(int r){ radius = r; }
  
}
