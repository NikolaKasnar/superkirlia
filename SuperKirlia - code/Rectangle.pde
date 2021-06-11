//Predstavlja jednu platformu, na koju se između može skočiti, i
//može se hodati po njoj. Inaće se ne crta, osim kod provjere postavljanja. 
//Služi samo da lik Kirlia zna kud treba skakati, i objekti ove klase
//će zapravo biti postavljeni na mjesto na kojem su naslikani na pozadinskoj slici
class Rectangle{
  //------------------podaci klase----------------
  //X koordinata gornjeg lijevog kuta
  int x;
  //Y koordinata gornjeg lijevog kuta
  int y;
  //Visina platforme
  int h;
  //Širina platforme
  int w;
  //Boja za popunjavanje platforme
  int fillColor = 255;
  //Boja za obrub platforme
  int borderColor = 255;
  
  //------------------------------------------metode klase----------------------------------------------------------
  
  //Crta platformu. 
  // Ova funkcija se poziva samo kad se postavljaju platforme ili kad se neke funkcije provjeravaju. 
  //Inače u pravoj verziji igre se ne crtaju (prazna funkcija)
  void draw(){
    /*fill(fillColor);
    stroke(borderColor);
    rect(x, y, w, h);*/
    }
  
  //......................funkcije koje vraćaju dimenzije platforme..................
  
   //Vraća visinu platforme
  int returnH(){  return h;  }
  //Vraća širinu platforme
  
  int returnW(){  return w; }
  
  //.....................funkcije koje vraćaju kutove platformi....................
  
  //Vraća gornji lijevi kut kao točku
  Point returnLUPoint(){ return new Point(x, y);  }
  
  //Vraća donji lijevi kut kao točku  
  Point returnLDPoint(){ return new Point(x, y + h); }
  
    //Vraća gornji desni kut kao točku
  Point returnRUPoint(){ return new Point(x + w, y);  }
  
    //Vraća donji desni kut kao točku
  Point returnRDPoint(){ return new Point(x + w, y + h); }
  
  //.........................get funkcije...............................
   //Vraća x koordinatu
  int getX(){  return x;  }
  
  //Vraća y koordinatu
  int getY(){  return y;  }
  
  //..........................set funkcije.....................................
  
    //Postavlja boju za popunjavanje
  void setFillColor(int fC){   fillColor = fC;  }
  
  //Postavlja boju za obrub
  void setBorderColor(int bC){ borderColor = bC;  }
  
  //Postavlja širinu
  void setW(int W){   w = W;  }
  
  //Postavlja visinu
  void setH(int H){    h = H; }
  
  //Postavlja x koordinatu
  void setX(int X){   x = X;  }
  
  //Postavlja y koordinatu
  void setY(int Y){    y = Y;  }
}
