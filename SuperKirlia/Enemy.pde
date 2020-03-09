//Klasa koja predstavlja neprijatelja. Klasa nasljeđuje klasu "Character".
//Objekti ove klase se sami pomiču, samo se treba namjestiti koliko daleko se
//mogu/smiju pomicati od svog originalnog početnog mjesta
class Enemy extends Character{
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
  PImage imgEnemy;
  //Postavi udaljenost
  void setDistance(int number){
    distance = number;
  }
  //Postavi originalni x
  void setOgX(int number){
    ogX = number;
  }
  //Postavi originalni y
  void setOgY(int number){
    ogY = number;
  }
  //Pomakni objekt udesno
  void moveRight(){
    x += 2;
  }
  //Pomakni objekt ulijevo
  void moveLeft(){
    x -= 2;
  }
  //Vrati centar objekta
  Point getCenter(){
    return new Point(x + width/2, y + height/2);
  }
  //Nacrtaj objekt
  void draw(){
    update();
    image(imgEnemy, x - 110, y - 55); 
    /*stroke(0);
    fill(0);
    rect(x, y, width, height);*/
  }
  //Pomakni objekt ulijevo ili udesno, i ako je objekt otišao dovoljno
  //ulijevo odnosno udesno, onda promijeni smijer pomicanja
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
  //Postavlja sliku
  void setImage(PImage img){
    imgEnemy = img;
  }
  //Vraca sliku
  PImage getImage(){
    return imgEnemy;
  }
  //Mijenja velicinu slikes
  void scale(int numberW, int numberH){
    imgEnemy.resize(numberW, numberH);
  }
}
