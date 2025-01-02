// Klasa koja reprezentira health koji se moze sakupiti u igri
class Health{
  //------------------Podaci klase----------------
  // Centar healtha
  Point center;
  // Radijus healtha
  int radius;
  // Slika healtha
  PImage imgHealth;
  
  //-------------------Metode klase----------------
  // Konstruktor
  Health(Point p, int r){
    center = p;
    radius = r;
    imgHealth = loadImage("health.png");
    imgHealth.resize(230, 230);
    }
    
  // Konstruktor
  Health(){
    imgHealth = loadImage("health.png");
    imgHealth.resize(230, 230);
    }
    
  // Crta novcic
  void draw(){
    image(imgHealth, center.x - 122, center.y - 95);
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
