// Klasa koja predstavlja glavni lik imena Kirlia.
// Ima dodatne funkcije za kretanje, primanje bodova, primanje damagea, i 
// provjeru da li je iznad neke platforme(te funkcije sluze za pomoć skakanju i kretanju)
class Kirlia extends Character{
  //------------------------Podaci klase--------------------
  
  // Slika lika igrača
  PImage imgKirlia;
  // Varijabla koja govori koliko bodova ima K
  int points = 0;
  // Broj koji oznacava broj zivota od K
  int health = 5;
  
  // Kontrola za pucanje
  int putanja = 0;
  int px;
  int py;
  
  //.................State-flags......................
  // Govori da li je K u stanju kretanja lijevo
  boolean moveLeft = false;
  // Govori da li je K u stanju kretanja udesnso
  boolean moveRight = false;
  // Govori da li je K u stanju skakanja
  boolean jump = false;
  // Govori da li je K u stanju padanja
  boolean fall = false;
  // Je li se dogodio pucanj
  boolean pucanjright = false;
  boolean pucanjleft = false;
  
  //...................Kontrola-skoka................
  // Originalna koordinata X; pomaze kod skakanja, za kontrolu da se ne skace unedogled
  int ogX;
  // Originalna koordinata Y; pomaze kod skakanja, za kontrolu da se ne skace unedogled
  int ogY;
  
  //.................Kontrola-pada.................
  // Pomocna varijabla za provjeravanje u kojem je trenutku Kirlia počela padati.
  // ne koristi se u ovoj verziji; ali je ostavljena jer se s njom optimizira 
  // racunanje iznad koje je platforme K; taj princip nije bulletproof
  int fallTime = 0;
  // Varijabla koja govori iznad koje je trenutno platforme K
  Rectangle currentlyAbove;
  // COUNTERI NEPOTREBNI
  // PADA DO DONJE GRANICE, NAPISANA FUNKCIJA
  // ostavljeno jer bi se mozda padanje moglo unaprijediti s tim
  int fallCounter = 0;
  
  //-----------------Metode klase--------------
  
  // Funkcija koja obrađuje reakciju objekta na otpustanje tipke na tipkovnici
  void keyReleased(){
 
    // Kada pustimo "a"/"left" da kirlia prestane ici lijevo
    if(keyCode == LEFT || keyCode == 'A'){
      moveLeft = false;
    }
    
    // Kada pustimo "d"/"right" da kirlia prestane ici desno
    if(keyCode == RIGHT || keyCode == 'D'){
      moveRight = false;
    }
    
    // Kada pustimo "W"/"up" da kirlia prestane skakati --->NAPOMENA: prestanak skoka je pocetak pada, dok ne dodirne platformu
    if(keyCode == UP || keyCode == 'W'){
      jump = false;
      fall = true;
    }
  }
  
  // Funkcija koja obraduje reakciju objekta na pritisak tipke na tipkovnici
  void keyPressed(){
    
    // Kada pritisnemo "a"/"left" da kirlia ide lijevo
    if(keyCode == LEFT || keyCode == 'A'){
      moveLeft = true;
    }
    
    // Kada pritisnemo "d"/"right" da kirlia ide desno
    if(keyCode == RIGHT || keyCode == 'D'){
      moveRight = true;
    }
    
    // Kada pritisnemo "W"/"up" da kirlia skoci --> NAPOMENA: kada je u stanju pada, ne moce skakati, nego tek to može kad dodirne platformu
    if((keyCode == UP || keyCode == 'W') && fall == false){
      ogX = x;
      ogY = y;
      jump = true;
      }
      
     if(key == ' '){
       if(pucanjleft==false & pucanjright==false){
         px=x;
         py=y;
         
         if (moveRight==true || (moveRight==false & moveLeft==false)) pucanjright = true;
         if (moveLeft==true) pucanjleft=true;
       }
     }
    }
  
  // Funkcija koja updatea gdje se nalazi K. Krece se gore, dolje, lijevo, ili desno, ovisno o postavljenim zastavicama
  void update(){
    
    // Ako se pomakne lijevo ili desno
    if(moveLeft) moveLeft(); 
    if(moveRight) moveRight();
    
    // Ako je zastavica za jump dignuta
    if(jump && y>10) y -= 7;
    
    // Ako je zastavica za fall dignuta
    if(fall){ 
      y += 4;                  
    }         
  }
  
  // Funkcija crta K
  void draw(){
    // Prvo se polozaj updatea
    update();    
    // Zatim se nacrta slika
    image(imgKirlia, x - 34, y - 65);        
  }
  
  // Funckija gleda da li je lik iznad neke platforme(class rectangle) R. Bitno da je barem jedan kut lika iznad platforme. 
  boolean isAbove(Rectangle R){ 
    // Vraca gornji desni i lijevi kut rektangla R
    Point A = R.returnLUPoint();
    Point B = R.returnRUPoint();
    
    // Usporedujemo ih sa koordinatama kirlie
     if( y < A.getY() && ((x > A.getX() || (x + width) > A.getX())) && x < B.getX()){
        return true;
      }else{
        return false;
      }
    }
  
  // Funkcija vraca koliko je lik udaljen od platforme ispod nje. Ako poslana platforma nije ispod K, onda se vraca -1
  int howMuchAbove(Rectangle r){
    if(isAbove(r)){
        return Math.abs(y - r.returnLUPoint().getY());
      }else{
        return -1;
      }
    }
    
  // Mijenja velicinu slike
  void scale(int numberH, int numberW){ imgKirlia.resize(numberW, numberH); }
    
  //..................Inkrement&dekrement funkcije......................
    
  // Kretanje udesno
  void moveRight(){ if (x<=990) x += 6; }
  
  // Kretanje ulijevo
  void moveLeft(){ if (x>=6) x -= 6; }
  
  // Funckija inkrementira broj bodova za 10 pri skupljanju novcica
  void incrementPoint(){ points += 10; }
  
  // Funckija inkrementira broj bodova za 5 pri ubijanju neprijatelja prvog tipa
  void incrementPointEnemy1(){ points += 5; }
  
  // Funckija inkrementira broj bodova za 15 pri ubijanju bossa prvog tipa
  void incrementPointBoss1(){ points += 15; }
  
  // Funckija koja inkrementira broj bodova za zadani broj
  void incrementPoint(int number){ points += number; }
  
  // Makni jedan život
  void removeHealth(){ health -= 1; }
  
  // Dodaj jedan život
  void addHealth(){ health += 1; }
  
  // Makni odreden broj života
  void removeHealth(int number){  health -= number; }
  
  // Dodaj odreden broj života
  void addHealth(int number){  health += number; }
 
  // Inkrementira se fallTime za jedan
  void incrementFallTime(){  fallTime++; }
  
  // Inkrementira se fallTime za odredeni poslani broj
  void incrementFallTime(int t){  fallTime += t; }
    
  //............................Get funkcije............................
  
  // Vraca broj bodova
  int getPoints(){ return points; }
  
  // Vraca sliku
  PImage getImage(){ return imgKirlia; }
  
  // Vraca se zastavica za skakanje
  boolean getJump(){ return jump; }
  
  // Vraca se zastavica za pad
  boolean getFall(){ return fall; }
  
  // Vraca centar K
  Point getCenter(){ return new Point(x + width/2, y + height/2); }
  
  // Vraca se originalni X
  int getOgX(){ return ogX; }
  
  // Vraca se originalni Y
  int getOgY(){ return ogY; }
  
  // Vraca se X
  int getX(){ return x; }
  
  // Vraca se Y
  int getY(){ return y; }
  
  // Vraca tocku (x,y)
  Point getXY(){
    p= new Point(x,y);
    return p;
  }
  
  // Vrati broj zivota
  int getHealth(){ return health; }
  
  // Vraca platformu iznad koje je trenutno K
  Rectangle getCurrentlyAbove(){ return currentlyAbove; }
  
  // Vraca fallTime
  int getFallTime(){ return fallTime; }
  
  
  //...........................Set funkcije..............................
    
  // Postavlja broj bodova
  void setPoints(int pointsK){ points = pointsK; }
    
  // Postavlja sliku
  void setImage(PImage img){ imgKirlia = img; }
  
  // Postavlja se zastavica za padanje
  void setFall(boolean flag){ fall = flag; }
  
  // Postavlja se zastavica za skakanje
  void setJump(boolean flag){ jump = flag; }
  
  // Postavlja se originalni X
  void setOgX(int number){ ogX = number; }
  
  // Postavlja se originalni Y
  void setOgY(int number){ ogY = number; }
  
  // Postavlja se trenutno nova platforma iznad koje je K
  void setCurrentlyAbove(Rectangle r){ currentlyAbove = r; }
  
  // Postavlja se fallTime
  void setFallTime(int t){ fallTime = t; }
  
  // Postavi broj života; originalno je 5
  void setHealth(int number){ health = number; }
}
