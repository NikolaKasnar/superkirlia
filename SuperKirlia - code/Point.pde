// Klasa koja predstavlja jednu tocku. 
// Ima jednostavne varijable, kao i svaka tocka uostalom
class Point{
   //------------------Podaci klase----------------
  // X koordinata
  int x;
  // Y koordinata
  int y;
  
  //--------------------Funkcije klase-------------
  // Konstruktor
  Point(int X, int Y){
    x = X;
    y = Y;
    }
  
  // Vraca string koji opisuje točku kao dvije koordinate, x i y
  String toString(){  return x + " " + y; }
  
  //................Set funkcije....................
  // Postavlja x koordinatu
  void setX(int X){ x = X; }
  
  // Postavlja y koordinatu
  void setY(int Y){  y = Y;  }
  
  //...............Get funkcije.....................
  // Vraca x koordinatu
  int getX(){ return x;  }
  
  // Vraca y koordinatu
  int getY(){  return y;  }
  
}
