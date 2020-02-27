//Klasa koja prestavlja jedan level. Incijalizira se sve u pocetnom programu.
//U klasi se nalaze razne funkcije za upravljanje igrom.
class Level{
  //Glavni lik
  Kirlia kirlia;
  //Maksimalan broj novcica koji se mogu skupiti u trenutnom levelu
  int maxPoints;
  //Neprijatelj koji moze raniti glavnog lika ako ga se ne izbjegne
  Enemy e;
  //Sve pozicije novcica; moze ih biti limitirano malo, barem 2 vise zbog neke logike
  ArrayList<Point> positionOfCoins;
  //Indeks trenutnog novcica
  int currentCoin;
  //Sve platforme po kojima se moze skakati. Na 0 mjestu stoji platforma koja 
  //predstavlja pod
  ArrayList<Rectangle> platforms;
  //Novcic koji se skuplja kako bi se level prosao
  Coin coin;
  //Timer za neprijatelja, kako se zivot od glavnog lika ne bi mogao samo tako izgubiti
  int enemyTimer;
  //Konstruktor
  Level(int numberMaxPoints, Kirlia k, Enemy enemy, 
    ArrayList<Point> coins, ArrayList<Rectangle> rectangle){
  
    setupL(numberMaxPoints, k, enemy, coins, rectangle);
  }
  //Funkcija koja sve na pocetku levela (u trenutku njegovog stvaranja) inicijalizira
  void setupL(int numberMaxPoints, Kirlia k, Enemy enemy, 
    ArrayList<Point> coins, ArrayList<Rectangle> rectangle){
    
      kirlia = k;
      maxPoints = numberMaxPoints;
      e = enemy;
      positionOfCoins = coins;
      platforms = rectangle;
      currentCoin = 0;
      
      coin = new Coin();
      coin.setCenter(positionOfCoins.get(currentCoin));
      coin.setRadius(30);
      
      kirlia.setCurrentlyAbove(platforms.get(0));//na 0 mjestu ce biti prvotna platforma
      enemyTimer = 0;
  }
  //Funckija koja je zaduzena za crtanje svega na ekran
  int draw(){
  
    update();
    background(0);
    
    //coin.setCenter(positionOfCoins.get(currentCoin));
    coin.draw();
    
    for(int i = 0; i < platforms.size(); i++){
      platforms.get(i).draw();
    }
    
    if(e != null){
      e.draw();
    }
    
    kirlia.draw();
    
    if(kirlia.getHealth() == 0){
      return 3;//kraj igre, gubitak
    }else if(kirlia.getHealth() > 0 && maxPoints == 0){
      return 2;//kraj igre, pobjeda
    }else{
      return 1;//igra se nastavlja na istom levelu
    } 
  }
  
  //Radi provjere kod raznih događaja koje se mogu dogoditi. Provjerava
  //interakciju sa Kirliom i okolinom. Provjerava se skakanje, padanje
  //interakcija s neprijateljima i skupljanje novčića
  void update(){
  
    //update padanja
    if(kirlia.getFall()){
      Rectangle temp = calculateBelow();
      kirlia.setCurrentlyAbove(temp);
      if(kirlia.howMuchAbove(temp) <= 23){
        kirlia.setFall(false);
        kirlia.setFallTime(0);
      }
      //izracunaj iznad cega je
      //postavi to kao currentlyAbove
      //to prestaje kad stane na tu platformu
      //samo se jednom to treba racunati - to regulirati pomocu nekakvog flag-a
      //unutar klase Kirlia - IZGLEDA DA SE IPAK TREBA RACUNATI SVAKI PUT
      //ZBOG PRITISKA I OTPUSTANJA GUMBOVA NA TIPKOVNICI
    }
    
    //update padanja
    if(!kirlia.isAbove(kirlia.getCurrentlyAbove())){
      kirlia.setFall(true);
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
    
    //DODATI PROVJERAVANJE DA SE NE ODE IZVAN EKRANA... 
    
    
    if(calculateDistance(kirlia.getCenter(),coin.getCenter()) < 5){
      kirlia.incrementPoint();
      //coinIndex++;
      currentCoin++;
      maxPoints--;
      if(currentCoin >= positionOfCoins.size()){
        currentCoin = 0;
      }
      coin.setCenter(positionOfCoins.get(currentCoin));
    }
    
    if(enemyTimer >= 150){
      enemyTimer = 0;
    }else if(enemyTimer > 0){
      enemyTimer++;
      
      //MOZDA NEPOTREBNO
      if(calculateDistance(kirlia.getCenter(), e.getCenter()) > 20){
        enemyTimer = 0;
      }
    }else if(enemyTimer == 0){
      //udaljenost
    // println("da");
      if(calculateDistance(kirlia.getCenter(), e.getCenter()) < 20){
        kirlia.removeHealth();
        enemyTimer++;
      }
    }
    
    //println(kirlia.getHealth() + " " + kirlia.getPoints());
  }
  
  int calculateDistance(Point a, Point b){
    int first = a.getX() - b.getX();
    int second = a.getY() - b.getY();
    return (int)Math.sqrt(first*first + second*second);
  }
  
  //Proverava iznad koje je platforme lik. Provjera se radi tako da se gledaju sve
  //postojeće platforme, i onda koja je zaista ispod lika, i koja je najbliža
  //liku, je ona prava platforma kroz koju lik "ne propada"
  //već stoji na toj platformi. Funkcija pomaže kod skakanja po platformama
  //NAPOMENA: NEKI DIJELOVI KOJI SU KOMENTIRANI SU OSTAVLJENI JER SU DIJELOVI
  //JEDNE IDEJE KOJA RADI, ALI NIJE ISTRAŽENA DO KRAJA. MOŽE SE
  //SKAKANJE OPTIMIRATI S TIM DIJELOVIMA. U OVOJ VERZIJI SE NE PREPORUČA SAMO
  //ODKOMENTIRAVANJE BEZ PROVJERE PRIJE, JER MOŽDA NEĆE SVE RADITI KAKO TREBA.
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
          
          if(kirlia.isAbove(r[i])){
            int distance = kirlia.howMuchAbove(r[i]);
           // println(distance + " " + (i + 1));
            if(distance < min){
              temp = r[i];
              min = distance;
            }
          }
        }
        //println(" ");
        kirlia.incrementFallTime();
        return temp;
     //}
  }
  
  void mousePressed(){
    /*println(k2.getX() + " " + k2.getY());
    println(k2.getCenter());
    println(" " + k2.getPoints() + " ");*/
   // println(e.getCenter());
   // println(e.x + " " + e.y);
   println(kirlia.getHealth() + " " + kirlia.getPoints());
  }
  void keyPressed(){
    kirlia.keyPressed();
  }
  
  void keyReleased(){
    kirlia.keyReleased();
  }

}
