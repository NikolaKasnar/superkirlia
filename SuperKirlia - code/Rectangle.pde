// Predstavlja jednu platformu, na koju se između moze skociti, i
// moze se hodati po njoj.

class Rectangle{
  //------------------Podaci klase----------------
  // X koordinata gornjeg lijevog kuta
  int x;
  // Y koordinata gornjeg lijevog kuta
  int y;
  // Visina platforme
  int h;
  // Sirina platforme
  int w;
  // Boja za popunjavanje platforme
  int fillColor1=154;
  int fillColor2=27;
  int fillColor3=21;
  // Boja za obrub platforme - u ovoj verziji se ne koristi (nema obruba)
  int borderColor = 200;
  // Odreduje je li u pitanju pod ili ne
  boolean floor;
  
  //------------------------------------------Metode klase----------------------------------------------------------
  
  // Crta platformu
  void draw(){
      fill(fillColor1,fillColor2,fillColor3);
      noStroke();
      circle(x+h/2,y+h/2,h);
      circle(x+w-h/2,y+h/2,h);
      rect(x+h/2, y, w-h, h);
  }
  
  //......................Funkcije koje vracaju dimenzije platforme..................
  
  // Vraca visinu platforme
  int returnH(){  return h;  }
  // Vraca sirinu platforme
  
  int returnW(){  return w; }
  
  //.....................Funkcije koje vracaju kutove platformi....................
  
  // Vraca gornji lijevi kut kao tocku
  Point returnLUPoint(){ return new Point(x, y);  }
  
  //Vraca donji lijevi kut kao tocku  
  Point returnLDPoint(){ return new Point(x, y + h); }
  
  //Vraca gornji desni kut kao tocku
  Point returnRUPoint(){ return new Point(x + w, y);  }
  
  //Vraca donji desni kut kao tocku
  Point returnRDPoint(){ return new Point(x + w, y + h); }
  
  //.........................Get funkcije...............................
  // Vraca x koordinatu
  int getX(){  return x;  }
  
  // Vraca y koordinatu
  int getY(){  return y;  }
  
  //..........................Set funkcije.....................................
  
  // Postavlja boju za popunjavanje
  void setFillColor(int fc1, int fc2, int fc3){ 
    fillColor1=fc1;
    fillColor2=fc2;
    fillColor3=fc3;
  }
  
  // Postavlja boju za obrub
  void setBorderColor(int bC){ borderColor = bC;  }
  
  // Postavlja sirinu
  void setW(int W){   w = W;  }
  
  // Postavlja visinu
  void setH(int H){    h = H; }
  
  // Postavlja x koordinatu
  void setX(int X){   x = X;  }
  
  // Postavlja y koordinatu
  void setY(int Y){    y = Y;  }
  
  // Postavlja je li odabrani rectangle pod ili ne
  void setfloor(boolean b){
    floor=b;
  }
}
