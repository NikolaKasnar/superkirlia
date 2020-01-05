//Abstraktna klasa koja predstavlja neki lik u prostoru. Može imati
//neke koordinate gdje se nalazi, visinu i širinu. Kretanje i sve je
//obavljeno u konkretnim klasama koje nasljeđuju ovu
abstract class Character{
  //X koordinata lika
  int x;
  //Y koordinata lika
  int y;
  //Visina lika
  int height;
  //Širina lika
  int width;
  //Postavi x koordinatu
  void setX(int X){
    x = X;
  }
  //Postavi y koordinatu
  void setY(int Y){
    y = Y;
  }
  //Postavi širinu
  void setWidth(int w){
    width = w;
  }
  //Postavi visinu
  void setHeigth(int h){
    height = h;
  }
  //Abstraktna funkcija za kretanje ulijevo
  abstract void moveLeft();
  //Abstraktna funkcija za kretanje udesno
  abstract void moveRight();
  //Abstraktna funckija koja crta lika na određenom mjestu. Mjesto
  //je određeno x i y koordinatama
  abstract void draw();
}
