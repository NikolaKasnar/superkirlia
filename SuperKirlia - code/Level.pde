  import processing.sound.*; 
  
  //razne pomocne varijable
  int pogodak=0;
  Point p;
  int j=0;
  PImage tmp;
  Enemy m;
  ArrayList<Enemy> pom;
  int po=0;
  
//Klasa koja prestavlja jedan level. Incijalizira se sve u pocetnom programu.
//U klasi se nalaze razne funkcije za upravljanje igrom.
class Level{
  //------------------podaci klase----------------
  //pozadinska slika
  PImage bg;
  //Glavni lik
  Kirlia kirlia;
  //Neprijatelj koji moze raniti glavnog lika ako ga se ne izbjegne
  ArrayList<Enemy> e=new ArrayList<Enemy>();
  //Novcic koji se skuplja kako bi se level prosao
  Coin coin;
  //Sve pozicije novcica; moze ih biti limitirano malo, barem 2 vise zbog neke logike
  ArrayList<Point> positionOfCoins;
  //Indeks trenutnog novcica
  int currentCoin;
  //broj skupljenih novcica
  int collectedCoins;
  //Maksimalan broj novcica koji se mogu skupiti u trenutnom levelu
  int maxPoints;
  //Sve platforme po kojima se moze skakati. Na 0 mjestu stoji platforma koja predstavlja pod
  ArrayList<Rectangle> platforms;
  //Timer za neprijatelja, kako se zivot od glavnog lika ne bi mogao samo tako izgubiti
  int enemyTimer;
  //zvuk za novcic
  SoundFile coin_sound;
  //zvuk za susret s neprijateljem
  SoundFile enemy_sound;
  
  
  //---------------------metode klase----------------------
  //Konstruktor
  Level(int numberMaxPoints, Kirlia k, ArrayList<Enemy> enemy, 
    ArrayList<Point> coins, ArrayList<Rectangle> rectangle, PImage img, SoundFile cs, SoundFile es){
  
    setupL(numberMaxPoints, k, enemy, coins, rectangle, img, cs, es);
    }
    
  //Funkcija koja sve na pocetku levela (u trenutku njegovog stvaranja) inicijalizira
  void setupL(int numberMaxPoints, Kirlia k, ArrayList<Enemy> enemy, ArrayList<Point> coins, ArrayList<Rectangle> rectangle, PImage img, SoundFile cs, SoundFile es){
     //inicijalizacija podataka klase
      kirlia = k;
      maxPoints = numberMaxPoints;
      e = enemy;
      positionOfCoins = coins;
      platforms = rectangle;
      currentCoin = 0;
      collectedCoins=0;
      bg = img;
      enemy_sound=es;
      coin_sound=cs;
      
      //postavlja novcic na prvu poziciju
      coin = new Coin();
      coin.setCenter(positionOfCoins.get(currentCoin));
      coin.setRadius(30);
      
      //dodatno za alternativnu implementaciju, prvotna platforma je 0 ("pod")
      kirlia.setCurrentlyAbove(platforms.get(0));
      enemyTimer = 0;
    }
  
  
  //Funkcija koja je zaduzena za crtanje svega na ekran
  int draw(){
       update();
    
      //u slučaju gubitka (health=0) ili pobjede (maxpoints=0) ili neispunjenja ijednog uvjeta (nastavak igre), funkcija vraća različite vrijednosti
        if(kirlia.getHealth() == 0){
                pogodak=0;
                return 3;//gubitak
                
            }else if(kirlia.getHealth() > 0 && maxPoints == collectedCoins){
                return 2;//pobjeda
                
            }else{
                 //crta pozadinu i gumb za mute
                   background(bg);
                   image(kon,930,20);
                   
                   //crta novcic
                   coin.draw();
    
                  //crta platforme
                   for(int i = 0; i < platforms.size(); i++){  platforms.get(i).draw(); }
                  
                  
                  //ako se dogodio pucanj
                  if(kirlia.pucanjleft || kirlia.pucanjright){
                    if(kirlia.pucanjleft){
                      image(pew,kirlia.px-40-kirlia.putanja,kirlia.py-40);
                      if(!mute && kirlia.putanja==0) play(pewsound);
                      kirlia.putanja+=6;
                      if(kirlia.px-kirlia.putanja<40){
                        kirlia.pucanjleft=false;
                        kirlia.pucanjright=false;
                        kirlia.px=0;
                        kirlia.py=0;
                        kirlia.putanja=0;
                    }
                  }
                    else if(kirlia.pucanjright){
                      image(pew,kirlia.px+40+kirlia.putanja,kirlia.py-40);
                      if(kirlia.putanja==0) play(pewsound);
                      kirlia.putanja+=6;
                      if(kirlia.px+kirlia.putanja>1040){
                        kirlia.pucanjright=false;
                        kirlia.pucanjleft=false;
                        kirlia.px=0;
                        kirlia.py=0;
                        kirlia.putanja=0;
                      }
                    }
                  }
                  
                  if(e != null){  
                  for(int i=0; i<e.size();i++){
                    if(e.get(i).explode){  //crtanje eksplozije neprijatelja ako je ubijen
                      if(j==0 && !mute) explosionsound.play();
                      Point temp=e.get(i).getCenter();
                      image(expl,temp.getX()-10-j/2,temp.getY()-10-j);
                      expl.resize(30+j,30+j);
                      j+=2;
                      
                     if(j>40){
                       j=0;
                       e.get(i).explode=false;
                       e.remove(i);
                     }
                     }
                  }
                   
                   
                   for(int i=0;i<e.size();i++){
                   //crta bol oko neprijatelja
                     if(po>0){
                       image(enemypain,e.get(i).x-2,e.get(i).y-2,e.get(i).width,e.get(i).height);
                       po--;
                     }
                   
                   //crta neprijatelja
                        Enemy temp=e.get(i);
                        if (!temp.explode) temp.draw();
                     }
                   }
                  
                  
                   if(pogodak!=0){
                     image(pain,kirlia.getX()-43,kirlia.getY()-75);
                     pogodak--;
                   }
    
                   //crta lika Kirliu
                    kirlia.draw();
                    
                    
                    
                   //ispis bodova i zdravlja ako je potrebno
                     int health = kirlia.getHealth();
                     int points = kirlia.getPoints();
                     stroke(#8B0000);
                     fill(#8B0000);
                     textSize(30);
                     text(health, 155, 35);
                     text(points, 155, 70);
      
                    return 1;//nastavak igre
                    } 
     }
        
  
  //Obnavlja stanje sustava 
  void update(){
    
    //update (zaustavljanje) padanja
    if(kirlia.getFall()){
      Rectangle temp = calculateBelow();
      kirlia.setCurrentlyAbove(temp);
      if(kirlia.howMuchAbove(temp) <= 23){
        kirlia.setFall(false);
        kirlia.setFallTime(0);
        }
      }
    
    //update padanja
    if(!kirlia.isAbove(kirlia.getCurrentlyAbove())){
      kirlia.setFall(true);
    }
     
    //update skakanja, da se ne moze bas skociti u nedogled
     if(kirlia.getJump()){
      int oGTemp = kirlia.getOgY();
      int temp = kirlia.getY();
      
      if(Math.abs(oGTemp - temp) >= 150){
        kirlia.setFall(true);
        kirlia.setJump(false);
      }
    }
    
    //Iduca funkcija je iz prijasnje verzije, uzrokovala je bug na trecem
    //levelu, pa se u ovoj verziji ne koristi
    //provjera kod skakanja, ovim dijelom se kontrolira granica skakanja,
    //isto tako se kontrolira da nešto kod skakanja nije pošlo po zlu.
    //Ako dođe do toga, onda se K prebacuje u stanje padanja, i sve se
    //"resetira"
    /*
    int oGTemp = kirlia.getOgY();
    int temp = kirlia.getY();
    if(Math.abs(oGTemp - temp) >= 150){
      kirlia.setOgX(kirlia.getX());
      kirlia.setY(kirlia.getY());
      kirlia.setFall(true);
      kirlia.setJump(false);
      kirlia.setFallTime(0);//jer ako dode do ovog, znamo da je ''nesto poslo po krivu''
      //treba sve ''resetirati'', i lik treba pasti na pravo mjesto
    }
    */
    
    //ako pokupi novcic
    if(calculateDistance(kirlia.getCenter(),coin.getCenter()) < 30){
      kirlia.incrementPoint();
      collectedCoins++;
      currentCoin++;
      if (currentCoin >= positionOfCoins.size()){ currentCoin=0; }
      if(!mute) coin_sound.play();
      coin.setCenter(positionOfCoins.get(currentCoin));
    }
    
    //je li neprijatelj ozljedio Kirliju i je li ga ona upucala
    if(e != null){
        if(enemyTimer >= 1000){
          enemyTimer = 0;
        }
        else if(enemyTimer > 0){
          enemyTimer++;
          for(int i=0;i<e.size();i++){
            if(calculateDistance(kirlia.getCenter(), e.get(i).getCenter()) > 30){
              enemyTimer = 0;
            }
          }
        }
        else if(enemyTimer == 0 && pogodak==0){
          for(int i=0;i<e.size();i++){
            if(e.get(i).boss==true){
              if(calculateDistance(kirlia.getCenter(), e.get(i).getCenter())<50){
                pogodak+=30;
                kirlia.removeHealth();
                enemyTimer++;
                if(!mute) enemy_sound.play();
                }
            }
            if(calculateDistance(kirlia.getCenter(), e.get(i).getCenter()) < 30){
                pogodak+=30;
                kirlia.removeHealth();
                enemyTimer++;
                if(!mute) enemy_sound.play();
                }
          }
        }
        for(int i=0;i<e.size();i++){
        if(kirlia.pucanjleft){
          p=new Point(kirlia.px-40-kirlia.putanja,kirlia.py);
          if(calculateDistance(p,e.get(i).getCenter())<40){
            kirlia.pucanjleft=false;
            kirlia.pucanjright=false;
            kirlia.putanja=0;
            kirlia.px=0;
            kirlia.py=0;
            e.get(i).health--;
            if (e.get(i).health==0) e.get(i).explode=true;
            else{
              if(!mute) enemy_sound.play();
              po+=30;
            }
          }
        }
        if(kirlia.pucanjright){
          p=new Point(kirlia.px+40+kirlia.putanja,kirlia.py);
          if(calculateDistance(p,e.get(i).getCenter())<40){
            kirlia.pucanjright=false;
            kirlia.pucanjleft=false;
            kirlia.putanja=0;
            kirlia.px=0;
            kirlia.py=0;
            e.get(i).health--;
            if (e.get(i).health==0) e.get(i).explode=true;
            else{
              if(!mute) enemy_sound.play();
              po+=30;
            }
        }
      }
    }
  }
    
    
    //da Kirlia ne izađe izvan prozora
    if(kirlia.getY()+22 > platforms.get(0).y){
      kirlia.setY(platforms.get(0).y-22);
      kirlia.setOgY(platforms.get(0).y-22);
    }
  }
  
  //funkcija za računanje udaljenosti između dviju točaka (objekata klase Point)
  int calculateDistance(Point a, Point b){
    int first = a.getX() - b.getX();
    int second = a.getY() - b.getY();
    return (int)Math.sqrt(first*first + second*second);
    }
  
  //Provjerava iznad koje je platforme lik. Provjera se radi tako da se gledaju sve
  //postojeće platforme, i onda koja je zaista ispod lika, i koja je najbliža
  //liku, je ona prava platforma kroz koju lik "ne propada"
  Rectangle calculateBelow(){

        int min = 2000;//neki veliki broj
        Rectangle temp = platforms.get(0);
        for(int i = 0; i < platforms.size(); i++){
          
          if(kirlia.isAbove(platforms.get(i))){
            int distance = kirlia.howMuchAbove(platforms.get(i));
           
            if(distance < min){
              temp = platforms.get(i);
              min = distance;
            }
          }
        }
        kirlia.incrementFallTime();
        return temp;
     
  }
  
  //..................funkcije za kontrolu miša......................
  
  //Pritiskom gumba se printa broj health-a i points-a u konzolu
  void mousePressed(){ println(kirlia.getHealth() + " " + kirlia.getPoints());}
  
  //javlja objektu klase Kirlia da je gumb pritisnut
  void keyPressed(){ kirlia.keyPressed(); }
  
  //javlja objektu klase Kirlia da je gumb otpušten
  void keyReleased(){ kirlia.keyReleased(); }

  //..........................get funkcije...........................
    //Vraca broj zivota od lika
  int getHealth(){ return kirlia.getHealth(); }
  
  //Vraca broj bodova od lika
  int getPoints(){ return kirlia.getPoints(); }
  
  //..........................set funkcije..........................
    //Postavlja broj zivota od lika
  void setHealth(int healthK){ kirlia.setHealth(healthK); }
  
  //Postavlja broj bodova od lika
  void setPoints(int pointsK){  kirlia.setPoints(pointsK); }
  
  //.........................reset funkcije........................
  void resetlevel(int level){ 
      kirlia.setHealth(5);
      kirlia.setPoints(0);
      collectedCoins=0;
      if(level<2){
        kirlia.setY(578);
        kirlia.setX(400);
      }
      else{
        kirlia.setY(678);
        kirlia.setX(400);
      }
      kirlia.pucanjleft=false;
      kirlia.pucanjright=false;
      kirlia.putanja=0;
      tmp=loadImage("e1.png");
      if(level==0) e=null;
      if(level==1){
        e.clear();
        e.add(new Enemy(200,220,50,30,200,220,50,tmp,1,false));
        e.get(0).scale(250,150);
        }
      if(level==2){
        e.clear();
        e.add(new Enemy(200,220,50,30,200,220,50,tmp,1,false));
        e.add(new Enemy(300,80,50,30,300,80,40,tmp,1,false));
        e.get(0).scale(250,150);
        e.get(1).scale(250,150);
      }
      PImage tmp2=loadImage("e1.png");
      if(level==3){
        e.clear();
        e.add(new Enemy(550,520,200,150,550,520,50,tmp2,3,true));
        e.get(0).scale(350,250);
      }
    }
}
