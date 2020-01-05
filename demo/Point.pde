//Klasa koja predstavlja jednu točku. 
//Ima jednostavne varijable, kao i svaka točka uostalom
class Point{
  //X koordinata
  int x;
  //Y koordinata
  int y;
  //Konstruktor
  Point(int X, int Y){
    x = X;
    y = Y;
  }
  //Postavlja x koordinatu
  void setX(int X){
    x = X;
  }
  //Postavlja y koordinatu
  void setY(int Y){
    y = Y;
  }
  //Vraća x koordinatu
  int getX(){
    return x;
  }
  //Vraća y koordinatu
  int getY(){
    return y;
  }
  //Vraća string koji opisuje točku kao dvije koordinate, x i y
  String toString(){
    return x + " " + y;
  }
}
