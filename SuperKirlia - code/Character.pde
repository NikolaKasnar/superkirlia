// Abstraktna klasa koja predstavlja neki lik u prostoru. Moze imati
// neke koordinate gdje se nalazi, visinu i sirinu. Kretanje i sve je
// obavljeno u konkretnim klasama koje nasljeduju ovu
abstract class Character{
  //------------------Podaci klase----------------
  // X koordinata lika
  int x;
  // Y koordinata lika
  int y;
  // Visina lika
  int height;
  // Sirina lika
  int width;
  
  //-----------------Metode klase---------------
  // Abstraktna funkcija za kretanje ulijevo
  abstract void moveLeft();
  
  // Abstraktna funkcija za kretanje udesno
  abstract void moveRight();
  
  // Abstraktna funckija koja crta lika na određenom mjestu. Mjesto
  // je određeno x i y koordinatama
  abstract void draw();
  
  //.................Set funkcije.....................
  
  // Postavi x koordinatu
  void setX(int X){ x = X;  }
    
  // Postavi y koordinatu
  void setY(int Y){  y = Y; }
    
  // Postavi sirinu
  void setWidth(int w){  width = w;  }
    
  // Postavi visinu
  void setHeigth(int h){ height = h;  }
  
}
