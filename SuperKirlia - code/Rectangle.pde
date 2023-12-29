//Predstavlja jednu platformu, na koju se između može skočiti, i
//može se hodati po njoj.

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
  int fillColor1=154;
  int fillColor2=27;
  int fillColor3=21;
  //Boja za obrub platforme - u ovoj verziji se ne koristi (nema obruba)
  int borderColor = 200;
  //određuje je li u pitanju pod ili ne
  boolean floor;
  
  //------------------------------------------metode klase----------------------------------------------------------
  
  //crta platformu
  void draw(){
      fill(fillColor1,fillColor2,fillColor3);
      noStroke();
      circle(x+h/2,y+h/2,h);
      circle(x+w-h/2,y+h/2,h);
      rect(x+h/2, y, w-h, h);
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
  void setFillColor(int fc1, int fc2, int fc3){ 
    fillColor1=fc1;
    fillColor2=fc2;
    fillColor3=fc3;
  }
  
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
  
  //Postavlja je li pod ili ne
  void setfloor(boolean b){
    floor=b;
  }
}
