//Klasa koja predstavlja jednu točku. 
//Ima jednostavne varijable, kao i svaka točka uostalom
class Point{
   //------------------podaci klase----------------
  //X koordinata
  int x;
  //Y koordinata
  int y;
  
  //--------------------funkcije klase-------------
  //Konstruktor
  Point(int X, int Y){
    x = X;
    y = Y;
    }
  
    //Vraća string koji opisuje točku kao dvije koordinate, x i y
  String toString(){  return x + " " + y; }
  
  //................set funkcije....................
  //Postavlja x koordinatu
  void setX(int X){ x = X; }
  
  //Postavlja y koordinatu
  void setY(int Y){  y = Y;  }
  
  //...............get funkcije.....................
  //Vraća x koordinatu
  int getX(){ return x;  }
  
  //Vraća y koordinatu
  int getY(){  return y;  }
  
}
