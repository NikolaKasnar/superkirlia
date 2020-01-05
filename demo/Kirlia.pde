//Klasa koja predstavlja glavni lik, lik se zove Kirlia.
//Ima dodatne funckije za kretanje, za primanje bodova, za primanje damagea, i za
//provjeravanje da li je iznad neke platforme(te funkcije služe za pomoć skakanju
//i kretanju)
//NAPOMENA #1: K je skraćeno za Kirlia
//NAPOMENA #2: Neki komentari sam ostavila za sebe, možda budu obrisani
class Kirlia extends Character{

  //Govori da li je K u stanju skakanja
  boolean jump = false;
  //Govori da li je K u stanju padanja
  boolean fall = false;
  //Pomoćna varijabla za provjeravanje u kojem je trenutku Kirlia počela padati.
  //ne koristi se u ovoj verziji; ali je ostavljena jer se s njom optimizira 
  //računanje iznad koje je platforme K; taj princip nije bulletproof
  int fallTime = 0;
  //Varijabla koja govori iznad koje je trenutno platforme K
  Rectangle currentlyAbove;
  //COUNTERI NEPOTREBNI
  //PADA DO DONJE GRANICE, NAPISANA FUNKCIJA
  //ostavljeno jer bi se možda padanje moglo unaprijediti s tim
  int fallCounter = 0;
  //Govori da li je K u stanju kretanja lijevo
  boolean moveLeft = false;
  //Govori da li je K u stanju kretanja udesnso
  boolean moveRight = false;
  //Originalna koordinata X; pomaže kod skakanja, za kontrolu da se ne skače u
  //nedogled
  int ogX;
  //Originalna koordinata Y; pomaže kod skakanja, za kontrolu da se ne skače u
  //nedogled
  int ogY;
  //Varijabla koja govori koliko bodova ima K
  int points = 0;
  //Vraća platformu iznad koje je trenutno K
  Rectangle getCurrentlyAbove(){
    return currentlyAbove;
  }
  //Postavlja se fallTime
  void setFallTime(int t){
    fallTime = t;
  }
  //Inkrementira se fallTime za jedan
  void incrementFallTime(){
    fallTime++;
  }
  //Inkrementira se fallTime za određeni poslani broj
  void incrementFallTime(int t){
    fallTime += t;
  }
  //Vraća fallTime
  int getFallTime(){
    return fallTime;
  }
  //Postavlja se originalni X
  void setOgX(int number){
    ogX = number;
  }
  //Postavlja se originalni Y
  void setOgY(int number){
    ogY = number;
  }
  //Vraća se originalni X
  int getOgX(){
    return ogX;
  }
  //Vraća se originalni Y
  int getOgY(){
    return ogY;
  }
  //Vraća se X
  int getX(){
    return x;
  }
  //Vraća se Y
  int getY(){
    return y;
  }
  //Postavlja se trenutno nova platforma iznad koje je K
  void setCurrentlyAbove(Rectangle r){
    currentlyAbove = r;
  }
  //NAPOMENA: OVAJ SLJEDEĆI KOMENTAR JE BIO SAMO ZA MENE, 
  //I OBJAŠNJENJE ZAŠTO SAM TO NAPRAVILA KAKO JESAM, PA SAM GA OSTAVILA I DALJE
  
  //DODATI I ZA JUMP DA SE POSTAVI FALSE, A NE VREMENSKI DA SE GLEDA
  //PROBATI BEZ ELSE IFOVA, SAMO SA IFOVIMA
  void keyReleased(){
 
    if(keyCode == LEFT || keyCode == 'A'){
      //moveLeft(); krivo
      moveLeft = false;
    }/*else*/ if(keyCode == RIGHT || keyCode == 'D'){
      //moveRight(); krivo
      moveRight = false;
    }/*else*/ if((keyCode == UP || keyCode == 'W') /*&& fall == false*/){
      jump = false;
      fall = true;
     // fallTime = 0; ne koristi se u ovoj verziji
    }
  }
  
  //NAPOMENA: OVAJ SLJEDEĆI KOMENTAR JE BIO SAMO ZA MENE, 
  //I OBJAŠNJENJE ZAŠTO SAM TO NAPRAVILA KAKO JESAM, PA SAM GA OSTAVILA I DALJE
  
  //PROBATI BEZ ELSE IFOVA, SAMO SA IFOVIMA
  void keyPressed(){
    if(keyCode == LEFT || keyCode == 'A'){
      //moveLeft(); krivo
      moveLeft = true;
    }/*else*/ if(keyCode == RIGHT || keyCode == 'D'){
      //moveRight(); krivo
      moveRight = true;
      //NAPOMENA: OBJAŠNJENJE SAMOJ SEBI
      //kad pada, ne moze u tom trenutku skociti,
      //moze skociti samo kad opet stane na neku platformu
    }/*else*/ if((keyCode == UP || keyCode == 'W') && fall == false){
      ogX = x;
      ogY = y;
      jump = true;
    }
  }
  //Kretanje udesno
  void moveRight(){
    x += 3;
  }
  
  //Kretanje ulijevo
  void moveLeft(){
    x -= 3;
  }
  //Funkcija koja updatea gdje se nalazi K. Kreće se gore, dolje, lijevo, ili desno
  //ovisno o postavljenim zastavama
  void update(){
    
    if(moveLeft){
      moveLeft();
    }
    
    if(moveRight){
      moveRight();
    }
    
    if(jump){
      y -= 7;
    }
    
    if(fall /*&& fallCounter < 30*/){//counter se ne koristi u ovoj verziji, 
      y += 3;                  //možda se može nešto  poboljšati s njim doduše, 
    }                        //zato je ostavljen u komentaru
  }
  
  //Funkcija crta K
  void draw(){
    
    //Prvo se položaj updatea
    update();
    
    //NAPOMENA: SLJEDEĆI KOMENTIRANI DIO JE KRIV SKROZ
    //OSTAVLJEN RADI MENE, KAKO BI MOŽDA U BUDUĆNOSTI ISPROBAVALA NEKE STVARI
    //MOŽDA SE OBRIŠE
  /*  if(jump){
      jumpCounter++;
    }
    
    if(jumpCounter > 30){
      jump = false;
      fall = true;
      jumpCounter = 0;
    }*/
    /*
    if(fall){
      fallCounter++;
    }*/
    
    //DODATI JOS JEDAN UVJET ZAUSTAVLJANJA PADANJA, PROVJERA GRANICA DONJIH
   /* if(fallCounter > 30){
      fall = false;
      fallCounter = 0;
    }
    */
   
    stroke(255);
    fill(255);
    rect(x, y, width, height);
    
  }
  //Funckija gleda da li je K iznad neke platforme. Bitno da je barem jedan čošak
  //iznad platforme, ne mora točno cijeli lik biti iznad, ali mora skoro biti.
  //Ako je K iznad, onda se vraća true, inače se vraća false
  boolean isAbove(Rectangle r){
    Point A = r.returnLUPoint();
    Point B = r.returnRUPoint();
    
    //za drugi uvjet dovoljno samo x+width
    if( y < A.getY() && (x > A.getX() || (x + width) > A.getX()) && x < B.getX()){
      return true;
    }else{
      return false;
    }
  }
  
  //Funckija vraća koliko je K udaljena od platforme ispod nje. Ako poslana
  //platforma nije ispod K, onda se vraća -1
  int howMuchAbove(Rectangle r){
    if(isAbove(r)){
      return Math.abs(y - r.returnLUPoint().getY());
    }else{
      return -1;
    }
  }
  //Postavlja se zastavica za padanje
  void setFall(boolean flag){
    fall = flag;
  }
  //Postavlja se zastavica za skakanje
  void setJump(boolean flag){
    jump = flag;
  }
  //Vraća se zastavica za skakanje
  boolean getJump(){
    return jump;
  }
  //Vraća se zastavica za pad
  boolean getFall(){
    return fall;
  }
  //Vraća centar K
  Point getCenter(){
    return new Point(x + width/2, y + height/2);
  }
  //Funckija inkrementira broj bodova za 10
  void incrementPoint(){
    points += 10;
  }
  //Funckija koja inkrementira broj bodova za zadani broj
  void incrementPoint(int number){
    points += number;
  }
  //Vraća broj bodova
  int getPoints(){
    return points;
  }
}
