//Klasa koja predstavlja neprijatelja. Klasa nasljeđuje klasu "Character".
//Objekti ove klase se sami pomiču, samo se treba namjestiti koliko daleko se
//mogu/smiju pomicati od svog originalnog početnog mjesta
class Enemy extends Character{
  //------------------podaci klase----------------
  //Originalna početna x koordinata
  int ogX;
  //Originalna početna y koordinata
  int ogY;
  //Zastavica koja dopušta pomicanje udesno ako je true
  boolean right = true;
  //Zastavica koja dopušta pomicanje ulijevo ako je true
  boolean left = false;
  //Broj koji govori koliko daleko se objekt ove klase može pomicati
  //od početnog mjesta ulijevo, odnosno udesno
  int distance;
  //slika neprijatelja
  PImage imgEnemy = loadImage("e1.png");
  //prati je li neprijatelj eksplodirao
  boolean explode = false;
  //koliko je pucnjeva potrebno Kirliji da ga ubije
  int health;
  //je li u pitanju veliki neprijatelj
  boolean boss;
  
  //konstruktori
  Enemy(){
    
  }
  
  Enemy(int trenx, int treny, int vis, int sir, int origx, int origy, int dist, PImage img, int h, boolean b){
   x=trenx;
   y=treny;
   height=vis;
   width=sir;
   ogX=origx;
   ogY=origy;
   distance=dist;
   imgEnemy=img;
   health=h;
   boss=b;
  }
  
  //-----------------metode klase--------------  
  //Nacrtaj objekt
  void draw(){
    update();
    image(imgEnemy,x,y);
    }
  
  //Pomakni objekt ulijevo/udesno, i ako je objekt otišao dovoljno ulijevo/udesno, onda promijeni smjer pomicanja
  void update(){
    if(right){
      moveRight();
      if(x - ogX >= distance){
        right = false;
        left = true;
        }
      }else{
      moveLeft();
      if(ogX - x >= distance){
        right = true;
        left = false;
        }
      }
    }

  //Mijenja velicinu slike
  void scale(int numberW, int numberH){
    imgEnemy.resize(numberW, numberH);
    this.width=numberW;
    this.height=numberH;
  }
  
  //..........................funkcije inkrementa/dekrementa.....................    
    //Pomakni objekt udesno
  void moveRight(){ x += 2; }
  
  //Pomakni objekt ulijevo
  void moveLeft(){  x -= 2; }
    
  //...........................get funkcije.................................
  //Vrati centar objekta
  Point getCenter(){ return new Point(x + this.width/2, y + this.height/2);  }
  
  //Vrati x ili y
  int getX(){ return x; }
  int getY(){ return y; }
  
  //Vraca sliku
  PImage getImage(){  return imgEnemy;  }
    
  //..............................set funkcije........................
  //Postavi udaljenost
  void setDistance(int number){ distance = number;  }
    
  //Postavi originalni x
  void setOgX(int number){ ogX = number; }
    
  //Postavi originalni y
  void setOgY(int number){  ogY = number; }
  
  //Postavlja sliku
  void setImage(PImage img){ imgEnemy = img;  }
  
  //Postavlja snagu
  void health(int h){ health=h; }
  
  //Postavlja je li veliki neprijatelj
  void isboss(boolean b){ boss=b; }
}
