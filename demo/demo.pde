// Button1 b;
 //Kirlia k;
/*void setup(){
  size(300, 300);
  b = new Button1();
  b.setBorderColor(100);
  b.setFillColor(100);
  b.setX(100);
  b.setY(100);
  b.setHeight(50);
  b.setWidth(50);
  
  k = new Kirlia();
  k.setX(200);
  k.setY(200);
  k.setHeigth(20);
  k.setWidth(20);
}
*//*
void draw(){
   background(0);
   fill(255);
   stroke(255);
   point(100, 100);
   
   rect(100, 100, 100, 100);//gornji kut
  // point(0, 0);
   //b.draw();
 //  k.draw();
}*/

class Button1 extends AbstractButton{
  void doFunction(){
    fillColor = 255;
    borderColor = 255;
  } 
}
/*
void mousePressed(){
  b.mousePressed();
}*/
/*
void keyReleased(){
  k.keyReleased();
}
*/
/*void keyPressed(){
  k.keyPressed();*/
 /* if(keyCode == UP){
    println("up");
  }else if(keyCode == DOWN){
    println("down");
  }else if(keyCode == LEFT){
    println("left");
  }else if(keyCode == RIGHT){
    println("right");
  }else if(keyCode == 'S'){
    println("S");
  }else if(keyCode == 'D'){
    println("d");
  }*/
/*}*/

//DRUGI DEMO

//boolean first = true;
Kirlia k2;
Rectangle r1;
Rectangle r2;
Rectangle r3;
Rectangle floor;
Rectangle[] r;
void setup(){
  
  size(700, 700);
  k2 = new Kirlia();
  r1 = new Rectangle();
  r2 = new Rectangle();
  r3 = new Rectangle();
  floor = new Rectangle();
  
  //false
  r1.setX(100);
  r1.setY(550);
  r1.setH(20);
  r1.setW(70);
  
  //true
  r2.setX(180);
  r2.setY(470);
  r2.setH(20);
  r2.setW(70);
  
  //false
  r3.setX(300);
  r3.setY(470);
  r3.setH(20);
  r3.setW(70);
  
  k2.setX(200);//POTREBNO ISTO POSTAVITI NA POCETKU
  k2.setX(200);
  k2.setOgY(578);//POTREBNO ISTO POSTAVITI NA POCETKU
  k2.setY(578);
  k2.setHeigth(20);
  k2.setWidth(20);
  
  floor.setX(0);
  floor.setY(600);
  floor.setW(700);
  floor.setH(100);
  
  k2.setCurrentlyAbove(floor);
  
  r = new Rectangle[4];
  r[0] = r1;
  r[1] = r2;
  r[2] = r3;
  r[3] = floor;
}

void draw(){
  
  update();
  
  background(0);
  k2.draw();
  r1.draw();
  r2.draw();
  r3.draw();
  floor.draw();
//  println(k2.isAbove(r[2]));
  
}

//PROVJERI DA LI JE KIRLIA SLUCAJNO SKOCILA,
//ILI AKO SLUCAJNO PADA
void update(){

  //update padanja
  if(k2.getFall()){
    Rectangle temp = calculateBelow();
    k2.setCurrentlyAbove(temp);
    if(k2.howMuchAbove(temp) <= 23){
      k2.setFall(false);
      k2.setFallTime(0);
    }
    //izracunaj iznad cega je
    //postavi to kao currentlyAbove
    //to prestaje kad stane na tu platformu
    //samo se jednom to treba racunati - to regulirati pomocu nekakvog flag-a
    //unutar klase Kirlia - IZGLEDA DA SE IPAK TREBA RACUNATI SVAKI PUT
    //ZBOG PRITISKA I OTPUSTANJA GUMBOVA NA TIPKOVNICI
  }
  
  //update padanja
  if(!k2.isAbove(k2.getCurrentlyAbove())){
    k2.setFall(true);
  }
  
  //update skakanja, da se ne moze bas skociti u nedogled
  /*if(k2.getJump()){
    int oGTemp = k2.getOgY();
    int temp = k2.getY();
    
    if(Math.abs(oGTemp - temp) >= 150){
      k2.setFall(true);
      k2.setJump(false);
    }
  }*/
  
  //PROVJERA DA SE NE SKOCI PREVISOKO, ILI DOK SE PADA DA NESTO NIJE POSLO PO ZLU
  int oGTemp = k2.getOgY();
  int temp = k2.getY();
    
  if(Math.abs(oGTemp - temp) >= 150){
    k2.setOgX(k2.getX());
    k2.setY(k2.getY());
    k2.setFall(true);
    k2.setJump(false);
    k2.setFallTime(0);//jer ako dode do ovog, znamo da je ''nesto poslo po krivu''
    //treba sve ''resetirati'', i lik treba pasti na pravo mjesto
  }
  
  //DODATI PROVJERAVANJE DA SE NE ODE IZVAN EKRANA... 
  
}

Rectangle calculateBelow(){
    //PROBLEM JE U OVOME... ZASTO NEKAD PADA, NEKAD OSTAJE
    //MOZE BEZ TOGA, ALI ONDA SE SVAKI PUT TO RACUNA
    //STO JE NEPOTREBNO - ali opet se racuna samo u padu pa nije tako strasno ?
   /* if(k2.getFallTime() == 1){
      return k2.getCurrentlyAbove();
    }else{                  
      */
      int min = 1000;//neka velika brojka
      Rectangle temp = r[0];
      //println(k2.isAbove(r[3]));
    //  println(" ");
      for(int i = 0; i < r.length; i++){
        
        if(k2.isAbove(r[i])){
          int distance = k2.howMuchAbove(r[i]);
         // println(distance + " " + (i + 1));
          if(distance < min){
            temp = r[i];
            min = distance;
          }
        }
      }
      //println(" ");
      k2.incrementFallTime();
      return temp;
   //}
}
/*
void mousePressed(){
   println(" ");
   println(k2.isAbove(r1));
   println(k2.isAbove(r2));
   println(k2.isAbove(r3));
   println(" ");
}*/

void keyPressed(){
  k2.keyPressed();
}

void keyReleased(){
  k2.keyReleased();
}
