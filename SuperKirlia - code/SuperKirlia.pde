  //pozadine levela i menija i završnih ekrana
  PImage prvi;
  PImage drugi;
  PImage menu, won, lost;
  
  //unosim file za zvuk u igru
  import processing.sound.*; 
  SoundFile background_music;
  SoundFile enemy_sound;
  SoundFile coin_sound;

  //Zastava za ispis, pomoc
  boolean b = true;
  //Zastava koja pokazuje koji se 
  int flag = 0;
  
  //Glavni lik, igrac njime upravlja
  Kirlia k2;
  Kirlia k1;
  
  //objekti klase Rectangle koji predstavljaju podloge, i pripadna lista
  Rectangle r1;
  Rectangle r2;
  Rectangle r3;
  Rectangle[] r;
  
  //objekti klase Rectangle koji predstavljaju podove, i pripadna lista
  Rectangle floor;
  Rectangle floor2;
  ArrayList<Rectangle> allFloors;
  
  //lista lokacija novćića
  Point[] coinPoints;

  //objekt klase Enemy koji predstavlja neprijatelja
  Enemy e;
  
   //objekti klase level i njihova lista, te brojač levela
  Level l;
  Level l2;
  ArrayList<Level> allLevels;
  int currentLevel; //0=prvi level, 1=drugilevel
  
  //gumbi za početak igre i izlazak iz igre
  ButtonMenu menuButton;
  ButtonExit exitButton;
  
  
  //Inicijalizacijska funkcija
  void setup() {
      //veličina ekrana
      size(1000, 800);
        
     //.............................load pozadinskih slika..............................
    
    menu = new PImage();
    menu = loadImage("menu.jpeg");
    
    lost = new PImage();
    lost = loadImage("lost.jpeg");
    
    won = new PImage();
    won = loadImage("won.jpeg");
    
    prvi = new PImage();
    prvi = loadImage("prva.jpeg");
    
    drugi = new PImage();
    drugi = loadImage("drugi.jpeg");
    
    //.......................load i pokretanje pozadinske glazba................. 
    background_music= new SoundFile(this, "background_music.mp3");
    background_music.rate(0.8);
    background_music.loop();
    
    //......................load reaktivnih zvukova u igri....................
    coin_sound= new SoundFile(this, "coin_sound.mp3");
    enemy_sound= new SoundFile(this, "enemy_sound.mp3");
    
    //.......................inicijalizacija objekata gumba za menu...................
  
    menuButton = new ButtonMenu();
    menuButton.setX(380);
    menuButton.setY(460);
    menuButton.setHeight(113);
    menuButton.setWidth(260);
    
    exitButton = new ButtonExit();
    exitButton.setX(380);
    exitButton.setY(637);
    exitButton.setHeight(115);
    exitButton.setWidth(260);
    
    //....................inicijalizacija Podloga....................
    r1 = new Rectangle();
    r1.setX(361);
    r1.setY(442);
    r1.setH(45);
    r1.setW(316);
    
    r2 = new Rectangle();
    r2.setX(7);
    r2.setY(325);
    r2.setH(45);
    r2.setW(535);
    
    r3 = new Rectangle();
    r3.setX(582);
    r3.setY(465);
    r3.setH(45);
    r3.setW(327);
    
    floor = new Rectangle();
    floor.setX(0);
    floor.setY(600);
    floor.setW(1000);
    floor.setH(300);
    
    floor2 = new Rectangle();
    floor2.setX(0);
    floor2.setY(600);
    floor2.setW(1000);
    floor2.setH(300);
 
    //..............inicijalizacija lista podloga................ 
  
    ArrayList<Rectangle> p = new ArrayList<Rectangle>();
    p.add(floor);
    p.add(r1);
    
    ArrayList<Rectangle> platforms2 = new ArrayList<Rectangle>();
    platforms2.add(floor2);
    platforms2.add(r2);
    platforms2.add(r3);
    
        
    //.....................inicijalizacija Kirlie......................
    PImage tmpImg = loadImage("kirlia.png");
  
    k1 = new Kirlia();
    k1.setOgX(400);
    k1.setX(400);
    k1.setOgY(578);
    k1.setY(578);
    k1.setHeigth(20);
    k1.setWidth(20);
    k1.setImage(tmpImg);
    k1.scale(100, 90);
    k1.setCurrentlyAbove(floor2);//postavljati prije ulaska u level
    
    k2 = new Kirlia();
    k2.setOgX(400);//POTREBNO ISTO POSTAVITI NA POCETKU
    k2.setX(400);
    k2.setOgY(578);//POTREBNO ISTO POSTAVITI NA POCETKU
    k2.setY(578);
    k2.setHeigth(20);
    k2.setWidth(20);
    k2.setImage(tmpImg);
    k2.scale(100, 90);
    k2.setCurrentlyAbove(floor);//postavljati prije ulaska u level 
    
   
   //.............inicijalizacija točaka u kojima će se pojavljivati novčić za level 1.......
    Point p1 = new Point(585, 585);
    Point p2 = new Point(220, 585);
    Point p3 = new Point(585, 420);
   
    ArrayList<Point> coinsP = new ArrayList<Point>();
    
    coinsP.add(p1);
    coinsP.add(p2);
    coinsP.add(p3);
  
    //....................inicijalizacija točaka u kojima će se pojavljivati novčić za level 2................
    Point p4 = new Point(730, 445);
    Point p5 = new Point(100, 307);
    
    ArrayList<Point> coinsP2 = new ArrayList<Point>();
    coinsP2.add(p1);
    coinsP2.add(p2);
    coinsP2.add(p4);
    coinsP2.add(p5);
   
    //.........................inicijalizacija objekta klase enemy.............
    e = new Enemy();
    e.setX(370);
    e.setY(270);
    e.setOgX(300);
    e.setOgY(550);
    e.setHeigth(50);
    e.setWidth(30);
    e.setDistance(30);
    tmpImg = loadImage("e1.png");
    e.setImage(tmpImg);
    e.scale(250,150);
   
   //...........................inicijalizacija objekta klase level...........
    l = new Level(3, k2, null, coinsP, p, prvi, coin_sound, enemy_sound);
    l2 = new Level(5, k1, e, coinsP2, platforms2, drugi, coin_sound, enemy_sound);
    
    //.........................inicijalizacija liste levela................
    currentLevel = 0;
    allLevels = new ArrayList<Level>();
    allLevels.add(l);
    allLevels.add(l2);
 
    }
  
  //Funkcija koja crta trenutni ekran.
  //0 - crta se menu
  //1 - crta se level
  //2 -  pobjeda! prelazi se na novi level ili na završni ekran.
  //3 - crta se zadnji ekran/zavrsetak, ali gubitak 
  //4 - crta se zadnji ekran/zavrsetak, ali pobjeda
  void draw() {
  
    if (flag == 1) {//crta level ako smo ušli u igru
          if(currentLevel == 0){
              flag = l.draw();
            }else if(currentLevel == 1){
              flag = l2.draw();
            }
      
        }else if (flag == 0) {//crta meni (gumbi su invisible ako ih eksplicitno ne crtamo)
           background(menu);
        
        }else if (flag == 2 ) {//ide se na idući level ili se crta pobjednički ekran
          //inkrementiram brojač koji označava trenutačni level        
          currentLevel++;
          
          if(currentLevel == allLevels.size()){ //ostvarena je ukupna pobjeda
               flag=4;
               background(won); 
               
            }else{
              flag = 1;
              }
          
        }else if(flag == 3){
          background(lost);
        }else if(flag == 4){
          background(won);
        }
  }
  
