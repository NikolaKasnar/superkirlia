  //pozadine levela i menija i završnih ekrana
  //PImage prvi;
  //PImage drugi;
  PImage nova;
  PImage treci;
  PImage menu, won, lost;
  
  //pojavi se oko Kirlie/neprijatelja kad su ozlijeđeni
  PImage pain;
  PImage enemypain;
  
  //slike za pucanj i eksploziju neprijatelja
  PImage pew;
  PImage expl;
  
  //gumb za mute
  PImage zvuk;
  PImage stisaj;
  PImage kon;
  
  //unosenje fileova za zvuk u igru
  import processing.sound.*; 
  SoundFile background_music;
  SoundFile enemy_sound;
  SoundFile coin_sound;
  SoundFile explosionsound;
  SoundFile winsound;
  SoundFile losesound;
  SoundFile pewsound;
  
  //pomocne varijable
  boolean mute=false;
  boolean b;
  //Zastava koja pokazuje koji se level igra
  int flag = 0;
  
  //Glavni lik, igrac njime upravlja
  Kirlia k2;
  Kirlia k1;
  Kirlia k3;
  Kirlia k4;
  
  //objekti klase Rectangle koji predstavljaju podloge, i pripadna lista
  Rectangle r1;
  Rectangle r2;
  Rectangle r3;
  Rectangle r4, r5, r6;
  Rectangle r7,r8;
  Rectangle r9,r10;
  Rectangle[] r;
  
  //objekti klase Rectangle koji predstavljaju podove, i pripadna lista
  Rectangle floor;
  Rectangle floor2;
  Rectangle floor3;
  Rectangle floor4;
  ArrayList<Rectangle> allFloors;
  
  //lista lokacija novcica
  Point[] coinPoints;

  //objekt klase Enemy koji predstavlja neprijatelja
  Enemy e;
  Enemy e1;
  Enemy e2;
  Enemy e3;
  
  //objekti klase level i njihova lista, te brojač levela
  Level l;
  Level l2;
  Level l3;
  Level l4;
  ArrayList<Level> allLevels;
  int currentLevel; //0=prvi level, 1=drugi level, 2=treci level, 3=cetvrti level
  
  //gumbi za početak, izlazak iz igre i stisavanje zvuka
  ButtonMenu menuButton;
  ButtonExit exitButton;
  ButtonPause pauseButton;
  
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
    
    /*prvi = new PImage();
    prvi = loadImage("prva.jpeg");
    
    drugi = new PImage();
    drugi = loadImage("drugi.jpeg");*/
    
    // Pozadina za prvi i drugi level
    nova = new PImage();
    nova = loadImage("nova.jpg");
    
    // Pozadina za treci i cetvrti level
    treci = new PImage();
    treci = loadImage("treci.jpg");
    
    pain = new PImage();
    pain = loadImage("pain.png");
    
    enemypain = new PImage();
    enemypain = loadImage("epain.png");
    
    pew = new PImage();
    pew = loadImage("pew.png");
    pew.resize(60,60);
    
    expl = new PImage();
    expl = loadImage("expl.png");
    expl.resize(30,30);
    
    zvuk = new PImage();
    zvuk = loadImage("sound.png");
    zvuk.resize(50,50);
    
    stisaj = new PImage();
    stisaj = loadImage("mute.png");
    stisaj.resize(50,50);
    
    kon=stisaj;
    
    //.......................load i pokretanje pozadinske glazba................. 
    background_music= new SoundFile(this, "background_music.mp3");
    background_music.rate(0.8);
    background_music.loop();
    
    //......................load reaktivnih zvukova u igri....................
    coin_sound= new SoundFile(this, "coin_sound.mp3");
    enemy_sound= new SoundFile(this, "enemy_sound.mp3");
    explosionsound=new SoundFile(this, "explosion.mp3");
    winsound=new SoundFile(this, "win.wav");
    losesound=new SoundFile(this, "lost.wav");
    pewsound=new SoundFile(this, "pew.mp3");
    
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
    
    pauseButton = new ButtonPause();
    pauseButton.setX(930);
    pauseButton.setY(20);
    pauseButton.setHeight(50);
    pauseButton.setWidth(50);
    
    //....................inicijalizacija podloga....................
    r1 = new Rectangle();
    r1.setX(361);
    r1.setY(442);
    r1.setH(48);
    r1.setW(316);
    r1.setfloor(false);
    
    r2 = new Rectangle();
    r2.setX(7);
    r2.setY(325);
    r2.setH(48);
    r2.setW(535);
    r2.setfloor(false);
    
    r3 = new Rectangle();
    r3.setX(582);
    r3.setY(465);
    r3.setH(48);
    r3.setW(327);
    r3.setfloor(false);
    
    r4 = new Rectangle();
    r4.setX(200);
    r4.setY(180);
    r4.setH(48);
    r4.setW(500);
    r4.setfloor(false);
    
    r5 = new Rectangle();
    r5.setX(900);
    r5.setY(550);
    r5.setH(48);
    r5.setW(100);
    r5.setfloor(false);
    
    r6 = new Rectangle();
    r6.setX(720);
    r6.setY(430);
    r6.setH(48);
    r6.setW(100);
    r6.setfloor(false);
    
    r7 = new Rectangle();
    r7.setX(540);
    r7.setY(310);
    r7.setH(48);
    r7.setW(100);
    r7.setfloor(false);
    
    r8 = new Rectangle();
    r8.setX(360);
    r8.setY(190);
    r8.setH(48);
    r8.setW(100);
    r8.setfloor(false);
    
    r9 = new Rectangle();
    r9=r2;
    
    r10 = new Rectangle();
    r10=r3;
    
    
    floor = new Rectangle();
    floor.setX(0);
    floor.setY(600);
    floor.setW(1000);
    floor.setH(48);
    floor.setfloor(true);
    
    floor2 = new Rectangle();
    floor2.setX(0);
    floor2.setY(600);
    floor2.setW(1000);
    floor2.setH(48);
    floor2.setfloor(true);
    
    floor3 = new Rectangle();
    floor3.setX(0);
    floor3.setY(600);
    floor3.setW(1000);
    floor3.setH(48);
    floor3.setfloor(true);
    
    floor4 = new Rectangle();
    floor4.setX(0);
    floor4.setY(700);
    floor4.setW(1000);
    floor4.setH(48);
    floor4.setfloor(true);
 
    //..............inicijalizacija lista podloga................ 
  
    ArrayList<Rectangle> p = new ArrayList<Rectangle>();
    p.add(floor);
    p.add(r1);
    
    ArrayList<Rectangle> platforms2 = new ArrayList<Rectangle>();
    platforms2.add(floor2);
    platforms2.add(r2);
    platforms2.add(r3);
    
    ArrayList<Rectangle> platforms3 = new ArrayList<Rectangle>();
    platforms3.add(floor3);
    platforms3.add(r4);
    platforms3.add(r9);
    platforms3.add(r10);
    
    ArrayList<Rectangle> platforms4 = new ArrayList<Rectangle>();
    platforms4.add(floor4);
    platforms4.add(r5); 
    platforms4.add(r6);     
    platforms4.add(r7);
    platforms4.add(r8);
    
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
    k1.setCurrentlyAbove(floor);//postavljati prije ulaska u level
    
    k2 = new Kirlia();
    k2.setOgX(400);//POTREBNO ISTO POSTAVITI NA POCETKU
    k2.setX(400);
    k2.setOgY(578);//POTREBNO ISTO POSTAVITI NA POCETKU
    k2.setY(578);
    k2.setHeigth(20);
    k2.setWidth(20);
    k2.setImage(tmpImg);
    k2.scale(100, 90);
    k2.setCurrentlyAbove(floor2);//postavljati prije ulaska u level 
    
    k3 = new Kirlia();
    k3.setOgX(400);
    k3.setX(400);
    k3.setOgY(578);
    k3.setY(578);
    k3.setHeigth(20);
    k3.setWidth(20);
    k3.setImage(tmpImg);
    k3.scale(100, 90);
    k3.setCurrentlyAbove(floor3);//postavljati prije ulaska u level
    
    k4 = new Kirlia();
    k4.setOgX(400);
    k4.setX(400);
    k4.setOgY(678);
    k4.setY(678);
    k4.setHeigth(20);
    k4.setWidth(20);
    k4.setImage(tmpImg);
    k4.scale(100, 90);
    k4.setCurrentlyAbove(floor4);//postavljati prije ulaska u level
    
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
    
    //.............inicijalizacija točaka u kojima će se pojavljivati novčić za level 3.......
    Point p6 = new Point(50, 585);
    Point p7 = new Point(400, 50);
    Point p8 = new Point(580, 50);
   
    ArrayList<Point> coinsP3 = new ArrayList<Point>();
    
    coinsP3.add(p2);
    coinsP3.add(p7);
    coinsP3.add(p3);
    coinsP3.add(p5);
    coinsP3.add(p6);
    coinsP3.add(p8);
    
    //.............inicijalizacija točaka u kojima će se pojavljivati novčić za level 4.......
    
    Point p9 = new Point(930,520);
    Point p10 = new Point(750,400);
    Point p11 = new Point(570,280);
    Point p12 = new Point(390,160);
    
    ArrayList<Point> coinsP4 = new ArrayList<Point>();
    coinsP4.add(p9);
    coinsP4.add(p10);
    coinsP4.add(p11);
    coinsP4.add(p12);
   
    //.........................inicijalizacija objekata klase enemy.............
    
    tmpImg = loadImage("e1.png");
    
    e = new Enemy();
    e.setX(200);
    e.setY(220);
    e.setOgX(200);
    e.setOgY(220);
    e.setHeigth(50);
    e.setWidth(30);
    e.setDistance(50);
    e.setImage(tmpImg);
    e.scale(250,150);
    e.health(1);
    e.isboss(false);
    
    ArrayList<Enemy> enemylist1 = new ArrayList<Enemy>();
    ArrayList<Enemy> enemylist2 = new ArrayList<Enemy>();
    
    e1 = new Enemy();
    e1.setX(200);
    e1.setY(220);
    e1.setOgX(200);
    e1.setOgY(220);
    e1.setHeigth(50);
    e1.setWidth(30);
    e1.setDistance(50);
    e1.setImage(tmpImg);
    e1.scale(250,150);
    e1.health(1);
    e1.isboss(false);

    
    e2 = new Enemy();
    e2.setX(300);
    e2.setY(80);
    e2.setOgX(300);
    e2.setOgY(80);
    e2.setHeigth(50);
    e2.setWidth(30);
    e2.setDistance(40);
    e2.setImage(tmpImg);
    e2.scale(250,150);
    e2.health(1);
    e2.isboss(false);

    enemylist1.add(e);
    enemylist2.add(e1);
    enemylist2.add(e2);
    
    PImage tmpimg2 = loadImage("e1.png");
    
    e3= new Enemy();
    e3.setX(550);
    e3.setY(520);
    e3.setOgX(550);
    e3.setOgY(520);
    e3.setHeigth(200);
    e3.setWidth(150);
    e3.setDistance(100);
    e3.setImage(tmpimg2);
    e3.scale(350,250);
    e3.health(3);
    e3.isboss(true);
    
    ArrayList<Enemy> enemylist3 = new ArrayList<Enemy>();
    enemylist3.add(e3);
   
   //...........................inicijalizacija objekta klase level...........
    l = new Level(3, k1, null, coinsP, p, nova, coin_sound, enemy_sound);
    l2 = new Level(5, k2, enemylist1, coinsP2, platforms2, nova, coin_sound, enemy_sound);
    l3 = new Level(6, k3, enemylist2, coinsP3, platforms3, treci, coin_sound, enemy_sound);
    l4 = new Level(4, k4, enemylist3, coinsP4, platforms4, treci, coin_sound, enemy_sound);
    
    
    //.........................inicijalizacija liste levela................
    currentLevel = 0;
    allLevels = new ArrayList<Level>();
    allLevels.add(l);
    allLevels.add(l2);
    allLevels.add(l3);
    allLevels.add(l4);
    }
  
  //Funkcija koja crta trenutni ekran.
  //0 - crta se menu
  //1 - crta se level
  //2 -  pobjeda! prelazi se na novi level ili na završni ekran.
  //3 - crta se zadnji ekran/zavrsetak, ali gubitak 
  //4 - crta se zadnji ekran/zavrsetak, ali pobjeda
  void draw() {
    if (flag == 1) {//crta level ako smo ušli u igru
      b=true;
          if(currentLevel == 0){
              flag = l.draw();
            }else if(currentLevel == 1){
              flag = l2.draw();
            }
            else if(currentLevel == 2){
              flag = l3.draw(); 
            }
            else if(currentLevel == 3){
              flag = l4.draw(); 
            }
      
        }else if (flag == 0) {//crta meni (gumbi su invisible ako ih eksplicitno ne crtamo)
           background(menu);
        
        }else if (flag == 2 ) {//ide se na idući level ili se crta pobjednički ekran
          //inkrementiram brojač koji označava trenutačni level        
          currentLevel++;
          
          if(currentLevel == allLevels.size()){ //ostvarena je ukupna pobjeda
               flag=4;
               if(b) play(winsound);
               background(won); 
               
            }else{
              flag = 1;
              //kontrola za pucanje
              k1.pucanjright=false;
              k1.pucanjleft=false;
              k2.pucanjright=false;
              k2.pucanjleft=false;
              k3.pucanjright=false;
              k3.pucanjleft=false;
              k4.pucanjright=false;
              k4.pucanjleft=false;
              }
          
        }else if(flag == 3){
          if(b) play(losesound);
          background(lost);
        }else if(flag == 4){
          if(b) play(winsound);
          background(won);
        }
  }
  
//funkcija za puštanje zvuka gubitka/pobjede i sl.
void play(SoundFile a){
  if(!mute) a.play();
  b=false;
}
  
