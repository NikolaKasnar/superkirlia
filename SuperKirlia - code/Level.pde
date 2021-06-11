  import processing.sound.*; 

//Klasa koja prestavlja jedan level. Incijalizira se sve u pocetnom programu.
//U klasi se nalaze razne funkcije za upravljanje igrom.
class Level{
  //------------------podaci klase----------------
  //pozadinska slika
  PImage bg;
  //Glavni lik
  Kirlia kirlia;
  //Neprijatelj koji moze raniti glavnog lika ako ga se ne izbjegne
  Enemy e;
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
  Level(int numberMaxPoints, Kirlia k, Enemy enemy, 
    ArrayList<Point> coins, ArrayList<Rectangle> rectangle, PImage img, SoundFile cs, SoundFile es){
  
    setupL(numberMaxPoints, k, enemy, coins, rectangle, img, cs, es);
    }
    
  //Funkcija koja sve na pocetku levela (u trenutku njegovog stvaranja) inicijalizira
  void setupL(int numberMaxPoints, Kirlia k, Enemy enemy, ArrayList<Point> coins, ArrayList<Rectangle> rectangle, PImage img, SoundFile cs, SoundFile es){
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
                return 3;//gubitak
                
            }else if(kirlia.getHealth() > 0 && maxPoints == collectedCoins){
                return 2;//pobjeda
                
            }else{
                 //crta pozadinu
                  background(bg);
    
                   //crta novćić
                  coin.draw();
    
                  //crta platforme
                    for(int i = 0; i < platforms.size(); i++){  platforms.get(i).draw(); }
    
                   //crta neprijatelja
                  if(e != null){  e.draw(); }
    
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
    if(!kirlia.isAbove(kirlia.getCurrentlyAbove())){  kirlia.setFall(true); }
     
    //update skakanja, da se ne moze bas skociti u nedogled
     if(kirlia.getJump()){
      int oGTemp = kirlia.getOgY();
      int temp = kirlia.getY();
      
      if(Math.abs(oGTemp - temp) >= 150){
        kirlia.setFall(true);
        kirlia.setJump(false);
      }
    }
    
    //provjera kod skakanja, ovim dijelom se kontrolira granica skakanja,
    //isto tako se kontrolira da nešto kod skakanja nije pošlo po zlu.
    //Ako dođe do toga, onda se K prebacuje u stanje padanja, i sve se
    //"resetira"
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
    
    //ako pokupi novcic
    if(calculateDistance(kirlia.getCenter(),coin.getCenter()) < 25){
      kirlia.incrementPoint();
      collectedCoins++;
      currentCoin++;
      if (currentCoin >= positionOfCoins.size()){ currentCoin=0; }
      coin_sound.play();
      coin.setCenter(positionOfCoins.get(currentCoin));
    }
    
    //
    if(e != null){
        if(enemyTimer >= 150){
          enemyTimer = 0;
        }else if(enemyTimer > 0){
          enemyTimer++;
          
          //MOZDA NEPOTREBNO
            if(calculateDistance(kirlia.getCenter(), e.getCenter()) > 20){
              enemyTimer = 0;
          }
        }else if(enemyTimer == 0){
            if(calculateDistance(kirlia.getCenter(), e.getCenter()) < 20){
                kirlia.removeHealth();
                enemyTimer++;
                enemy_sound.play();
                }
        }
      }
        
    if(kirlia.getY() > 600){
      kirlia.setY(578);
      kirlia.setOgY(578);
    }
  }
  
  //funkcija za računanje udaljenosti između dviju točaka (objekata klase Point)
  int calculateDistance(Point a, Point b){
    int first = a.getX() - b.getX();
    int second = a.getY() - b.getY();
    return (int)Math.sqrt(first*first + second*second);
    }
  
  //Proverava iznad koje je platforme lik. Provjera se radi tako da se gledaju sve
  //postojeće platforme, i onda koja je zaista ispod lika, i koja je najbliža
  //liku, je ona prava platforma kroz koju lik "ne propada"
  Rectangle calculateBelow(){

        int min = 1000;//neki veliki broj
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
  //postavlja indeks trenutnog novcica
  void resetlevel(){ 
      kirlia.setHealth(5);
      kirlia.setPoints(0);
      collectedCoins=0;
      kirlia.setY(578);
      kirlia.setX(400);
    }
}
