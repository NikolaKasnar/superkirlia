  // Pozadine levela i menija i završnih ekrana
  // Pozadina prvog i drugog levela
  PImage nova;
  // Pozadina treceg i cetvrtog levela
  PImage treci;
  // Pozadine petog i sestog levela
  PImage peti;
  PImage sesti;
  PImage menu, won, lost;
  
  // Pojavi se oko Kirlie/neprijatelja kad su ozlijeđeni
  PImage pain;
  PImage enemypain;
  
  // Slike za pucanj i eksploziju neprijatelja
  PImage pew;
  PImage expl;
  
  // Gumb za mute
  PImage zvuk;
  PImage stisaj;
  PImage kon;
  
  // Unosenje datoteka za zvuk u igru
  import processing.sound.*; 
  SoundFile background_music;
  SoundFile boss_music;
  SoundFile enemy_sound;
  SoundFile coin_sound;
  SoundFile explosionsound;
  SoundFile winsound;
  SoundFile losesound;
  SoundFile pewsound;
  SoundFile health_pickup;
  
  // Pomocne varijable
  boolean mute=false;
  boolean b;
  
  // Zastava koja pokazuje koji se level igra
  int flag = 0;
  
  // Glavni lik, igrac njime upravlja
  // Prije je postojala posebna verzija lika za svaki level sto je u iteraciji iz 2024./2025. promijenjeno
  Kirlia k1;
  
  // Objekti klase Rectangle koji predstavljaju podloge, i pripadna lista
  Rectangle r1;
  Rectangle r2;
  Rectangle r3;
  Rectangle r4, r5, r6;
  Rectangle r7,r8;
  Rectangle r9,r10;
  Rectangle r11, r12, r13, r14;
  Rectangle r15, r16, r17, r18;
  Rectangle[] r;
  
  // Objekti klase Rectangle koji predstavljaju podove, i pripadna lista
  Rectangle floor;
  Rectangle floor2;
  Rectangle floor3;
  Rectangle floor4;
  Rectangle floor5;
  Rectangle floor6;
  ArrayList<Rectangle> allFloors;
  
  // Lista lokacija novcica
  Point[] coinPoints;

  // Objekt klase Enemy koji predstavlja neprijatelja
  Enemy e21;
  Enemy e31, e32;
  Enemy e41;
  Enemy e51, e52, e53, e54;
  Enemy e61;
  
  // Objekti klase level i njihova lista, te brojač levela
  Level l1;
  Level l2;
  Level l3;
  Level l4;
  Level l5;
  Level l6;
  ArrayList<Level> allLevels;
  int currentLevel; //0=prvi level, 1=drugi level, 2=treci level, 3=cetvrti level, 4=peti level, 5=sesti level
  
  // Gumbi za početak, izlazak iz igre i gasenje zvuka
  ButtonMenu menuButton;
  ButtonExit exitButton;
  ButtonPause pauseButton;
  
  // Inicijalizacijska funkcija
  void setup() {
      // Velicina ekrana
      size(1000, 800);
        
     //.............................Load pozadinskih slika..............................
    
    menu = new PImage();
    menu = loadImage("menu.jpeg");
    
    lost = new PImage();
    lost = loadImage("lost.jpeg");
    
    won = new PImage();
    won = loadImage("won.jpeg");
    
    // Pozadina za prvi i drugi level
    nova = new PImage();
    nova = loadImage("nova.jpg");
    
    // Pozadina za treci i cetvrti level
    treci = new PImage();
    treci = loadImage("treci.jpg");
    
    // Pozadina za peti level
    peti = new PImage();
    peti = loadImage("peti.jpg");
    
    // Pozadina za sesti level
    sesti = new PImage();
    sesti = loadImage("sesti.jpg");
    
    // Slika za ranavanje Kirlie
    pain = new PImage();
    pain = loadImage("pain.png");
    
    // Slika za ranavanje neprijatelja
    enemypain = new PImage();
    enemypain = loadImage("epain.png");
    
    // Slika za pucanj/metak
    pew = new PImage();
    pew = loadImage("pew.png");
    pew.resize(60,60);
    
    // SLika za eksploziju/ubijanje neprijatelja
    expl = new PImage();
    expl = loadImage("expl.png");
    expl.resize(30,30);
    
    // Slika ikone za ukljucivanje zvuka igrice
    zvuk = new PImage();
    zvuk = loadImage("sound.png");
    zvuk.resize(50,50);
    
    // Slika ikone za gasenje zvuka igrice
    stisaj = new PImage();
    stisaj = loadImage("mute.png");
    stisaj.resize(50,50);
    
    // Pocetna ikona za upravljanje zvukom pri pokretanju igrice
    kon=stisaj;
    
    //.......................Load i pokretanje pozadinske glazba................. 
    background_music= new SoundFile(this, "background_music.mp3");
    boss_music= new SoundFile(this, "boss_music.mp3");
    background_music.rate(0.8);
    background_music.loop();
    
    //......................Load reaktivnih zvukova u igri....................
    coin_sound= new SoundFile(this, "coin_sound.mp3");
    enemy_sound= new SoundFile(this, "enemy_sound.mp3");
    explosionsound=new SoundFile(this, "explosion.mp3");
    winsound=new SoundFile(this, "win.wav");
    losesound=new SoundFile(this, "lost.wav");
    pewsound=new SoundFile(this, "pew.mp3");
    health_pickup=new SoundFile(this, "health_pickup.wav");
    
    //.......................Inicijalizacija objekata gumba za menu...................
  
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
    
    //....................Inicijalizacija podloga....................
    // Podloge za prvi level
    r1 = new Rectangle();
    r1.setX(361);
    r1.setY(442);
    r1.setH(48);
    r1.setW(316);
    r1.setfloor(false);
    
    // Podloge za drugi level
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
    
    // Podloge za treci i cetvrti level
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
    
    // Podloge za peti level, zelena boja oznacava seriju visih levela
    r11 = new Rectangle();
    r11.setX(300);
    r11.setY(442);
    r11.setH(48);
    r11.setW(400);
    r11.setFillColor(80,200,20);
    r11.setfloor(false);
    
    r12 = new Rectangle();
    r12.setX(0);
    r12.setY(300);
    r12.setH(48);
    r12.setW(400);
    r12.setFillColor(80,200,20);
    r12.setfloor(false);
    
    r13 = new Rectangle();
    r13.setX(600);
    r13.setY(300);
    r13.setH(48);
    r13.setW(400);
    r13.setFillColor(80,200,20);
    r13.setfloor(false);
    
    r14 = new Rectangle();
    r14.setX(300);
    r14.setY(150);
    r14.setH(48);
    r14.setW(400);
    r14.setFillColor(80,200,20);
    r14.setfloor(false);
    
    // Podloge za sesti level, zelena boja oznacava seriju visih levela
    r15 = new Rectangle();
    r15.setX(200);
    r15.setY(550);
    r15.setH(48);
    r15.setW(650);
    r15.setFillColor(80,200,20);
    r15.setfloor(false);
    
    r16 = new Rectangle();
    r16.setX(0);
    r16.setY(400);
    r16.setH(48);
    r16.setW(100);
    r16.setFillColor(80,200,20);
    r16.setfloor(false);
    
    r17 = new Rectangle();
    r17.setX(900);
    r17.setY(400);
    r17.setH(48);
    r17.setW(100);
    r17.setFillColor(80,200,20);
    r17.setfloor(false);
    
    r18 = new Rectangle();
    r18.setX(250);
    r18.setY(250);
    r18.setH(48);
    r18.setW(500);
    r18.setFillColor(80,200,20);
    r18.setfloor(false);
    
    // Donje platforme u levelima(skoro su iste su za sve)
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
    
    floor5 = new Rectangle();
    floor5.setX(0);
    floor5.setY(600);
    floor5.setW(1000);
    floor5.setH(48);
    floor5.setFillColor(80,200,20);
    floor5.setfloor(true);
    
    floor6 = new Rectangle();
    floor6.setX(0);
    floor6.setY(700);
    floor6.setW(1000);
    floor6.setH(48);
    floor6.setFillColor(80,200,20);
    floor6.setfloor(true);
 
    //..............Inicijalizacija lista podloga za pojedine levele................ 
  
    ArrayList<Rectangle> platforms1 = new ArrayList<Rectangle>();
    platforms1.add(floor);
    platforms1.add(r1);
    
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
    
    ArrayList<Rectangle> platforms5 = new ArrayList<Rectangle>();
    platforms5.add(floor5);
    platforms5.add(r11);
    platforms5.add(r12);
    platforms5.add(r13);
    platforms5.add(r14);
    
    ArrayList<Rectangle> platforms6 = new ArrayList<Rectangle>();
    platforms6.add(floor6);
    platforms6.add(r15);
    platforms6.add(r16);
    platforms6.add(r17);
    platforms6.add(r18);
    
    //.....................Inicijalizacija Kirlie......................
    // Od 2024./2025. se koristi samo jedna Kirlija
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
    
   //.............Inicijalizacija točaka u kojima će se pojavljivati novčići za level 1.......
    Point p1 = new Point(585, 585);
    Point p2 = new Point(220, 585);
    Point p3 = new Point(585, 420);
    Point pBonus = new Point(585, 585);
   
    ArrayList<Point> coinsP1 = new ArrayList<Point>();
    
    coinsP1.add(p1);
    coinsP1.add(p2);
    coinsP1.add(p3);
    coinsP1.add(pBonus);
  
    //....................Inicijalizacija točaka u kojima će se pojavljivati novčići za level 2................
    Point p4 = new Point(730, 445);
    Point p5 = new Point(100, 307);
    
    ArrayList<Point> coinsP2 = new ArrayList<Point>();
    coinsP2.add(p1);
    coinsP2.add(p2);
    coinsP2.add(p4);
    coinsP2.add(p5);
    
    //.............Inicijalizacija točaka u kojima će se pojavljivati novčići za level 3.......
    Point p6 = new Point(50, 585);
    Point p7 = new Point(400, 50);
    Point p8 = new Point(680, 50);
   
    ArrayList<Point> coinsP3 = new ArrayList<Point>();
    
    coinsP3.add(p2);
    coinsP3.add(p7);
    coinsP3.add(p3);
    coinsP3.add(p5);
    coinsP3.add(p6);
    coinsP3.add(p8);
    
    //.............Inicijalizacija točaka u kojima će se pojavljivati novčići za level 4.......
    
    Point p9 = new Point(930,520);
    Point p10 = new Point(750,400);
    Point p11 = new Point(570,280);
    Point p12 = new Point(390,160);
    
    ArrayList<Point> coinsP4 = new ArrayList<Point>();
    coinsP4.add(p9);
    coinsP4.add(p10);
    coinsP4.add(p11);
    coinsP4.add(p12);
    
    //.............Inicijalizacija točaka u kojima će se pojavljivati novčići za level 5.......
    
    Point p13 = new Point(350,410);
    Point p14 = new Point(50,280);
    Point p15 = new Point(800,280);
    Point p16 = new Point(500,120);
    Point p17 = new Point(750,570);
    
    ArrayList<Point> coinsP5 = new ArrayList<Point>();
    coinsP5.add(p13);
    coinsP5.add(p14);
    coinsP5.add(p15);
    coinsP5.add(p16);
    coinsP5.add(p17);
    
    //.............Inicijalizacija točaka u kojima će se pojavljivati novčići za level 6.......
    
    Point p18 = new Point(500,220);
    Point p19 = new Point(500,670);
    Point p20 = new Point(500,520);
    Point p21 = new Point(500,220);
    
    ArrayList<Point> coinsP6 = new ArrayList<Point>();
    coinsP6.add(p18);
    coinsP6.add(p19);
    coinsP6.add(p20);
    coinsP6.add(p21);
    
    //.............Inicijalizacija točaka u kojima će se pojavljivati health za level 6.......
    
    Point h1 = new Point(500,250);
    Point h2 = new Point(500,670);
    Point h3 = new Point(500,520);
    
    ArrayList<Point> healthH6 = new ArrayList<Point>();
    healthH6.add(h1);
    healthH6.add(h2);
    healthH6.add(h3);
   
    //.........................Inicijalizacija objekata klase enemy.............
    // Neprijatelji drugog levela
    tmpImg = loadImage("e1.png");
    
    e21 = new Enemy();
    e21.setX(200);
    e21.setY(220);
    e21.setOgX(200);
    e21.setOgY(220);
    e21.setHeigth(50);
    e21.setWidth(30);
    e21.setDistance(50);
    e21.setImage(tmpImg);
    e21.scale(250,150);
    e21.health(1);
    e21.isboss(false);
    
    ArrayList<Enemy> enemylist2 = new ArrayList<Enemy>();
    
    enemylist2.add(e21);
    
    // Neprijatelji treceg levela    
    e31 = new Enemy();
    e31.setX(200);
    e31.setY(220);
    e31.setOgX(200);
    e31.setOgY(220);
    e31.setHeigth(50);
    e31.setWidth(30);
    e31.setDistance(50);
    e31.setImage(tmpImg);
    e31.scale(250,150);
    e31.health(1);
    e31.isboss(false);
    
    e32 = new Enemy();
    e32.setX(300);
    e32.setY(80);
    e32.setOgX(300);
    e32.setOgY(80);
    e32.setHeigth(50);
    e32.setWidth(30);
    e32.setDistance(40);
    e32.setImage(tmpImg);
    e32.scale(250,150);
    e32.health(1);
    e32.isboss(false);
    
    ArrayList<Enemy> enemylist3 = new ArrayList<Enemy>();

    enemylist3.add(e31);
    enemylist3.add(e32);
    
    // Neprijatelji cetvrtog levela
    // Radimo novu tmp sliku radi neprijatelja tipa boss
    PImage tmpimg2 = loadImage("e1.png");
    
    e41= new Enemy();
    e41.setX(550);
    e41.setY(520);
    e41.setOgX(550);
    e41.setOgY(520);
    e41.setHeigth(200);
    e41.setWidth(150);
    e41.setDistance(100);
    e41.setImage(tmpimg2);
    e41.scale(350,250);
    e41.health(3);
    e41.isboss(true);
    
    ArrayList<Enemy> enemylist4 = new ArrayList<Enemy>();
    enemylist4.add(e41);
    
    // Neprijatelji petog levela    
    e51 = new Enemy();
    e51.setX(60);
    e51.setY(200);
    e51.setOgX(60);
    e51.setOgY(200);
    e51.setHeigth(50);
    e51.setWidth(30);
    e51.setDistance(150);
    e51.setImage(tmpImg);
    e51.scale(250,150);
    e51.health(1);
    e51.isboss(false);
    
    e52 = new Enemy();
    e52.setX(350);
    e52.setY(60);
    e52.setOgX(350);
    e52.setOgY(60);
    e52.setHeigth(50);
    e52.setWidth(30);
    e52.setDistance(100);
    e52.setImage(tmpImg);
    e52.scale(250,150);
    e52.health(1);
    e52.isboss(false);
    
    e53 = new Enemy();
    e53.setX(650);
    e53.setY(200);
    e53.setOgX(650);
    e53.setOgY(200);
    e53.setHeigth(50);
    e53.setWidth(30);
    e53.setDistance(150);
    e53.setImage(tmpImg);
    e53.scale(250,150);
    e53.health(1);
    e53.isboss(false);
    
    ArrayList<Enemy> enemylist5 = new ArrayList<Enemy>();
    
    // Moramo ih dodati sada inace ce svi biti tipa boss
    enemylist5.add(e51);
    enemylist5.add(e52);
    enemylist5.add(e53);
    
    e54= new Enemy();
    e54.setX(550);
    e54.setY(450);
    e54.setOgX(550);
    e54.setOgY(450);
    e54.setHeigth(200);
    e54.setWidth(150);
    e54.setDistance(100);
    e54.setImage(tmpimg2);
    e54.scale(350,250);
    e54.health(3);
    e54.isboss(true);
    
    enemylist5.add(e54);
    
    // Neprijatelji sestogetvrtog levela
    PImage tmpimg3 = loadImage("e2.png");
    
    e61= new Enemy();
    e61.setX(550);
    e61.setY(450);
    e61.setOgX(550);
    e61.setOgY(400);
    e61.setHeigth(200);
    e61.setWidth(150);
    e61.setDistance(100);
    e61.setImage(tmpimg3);
    e61.scale(150,150);
    e61.health(5);
    e61.isboss(true);
    
    ArrayList<Enemy> enemylist6 = new ArrayList<Enemy>();
    enemylist6.add(e61);
   
   //...........................Inicijalizacija objekta klase level...........
    l1 = new Level(4, k1, null, coinsP1, null, platforms1, nova, coin_sound, enemy_sound, health_pickup);
    l2 = new Level(5, k1, enemylist2, coinsP2, null, platforms2, nova, coin_sound, enemy_sound, health_pickup);
    l3 = new Level(6, k1, enemylist3, coinsP3, null, platforms3, treci, coin_sound, enemy_sound, health_pickup);
    l4 = new Level(4, k1, enemylist4, coinsP4, null, platforms4, treci, coin_sound, enemy_sound, health_pickup);
    l5 = new Level(5, k1, enemylist5, coinsP5, null, platforms5, peti, coin_sound, enemy_sound, health_pickup);
    l6 = new Level(4, k1, enemylist6, coinsP6, healthH6, platforms6, sesti, coin_sound, enemy_sound, health_pickup);
    
    
    //.........................Inicijalizacija liste levela................
    // Pri dodavanju novih levela se treba azurirati i klasa "InputControl" radi restarta novih levela
    currentLevel = 0;
    allLevels = new ArrayList<Level>();
    allLevels.add(l1);
    allLevels.add(l2);
    allLevels.add(l3);
    allLevels.add(l4);
    allLevels.add(l5);
    allLevels.add(l6);
    }
  
  // Funkcija koja crta trenutni ekran.
  // 0 - crta se menu
  // 1 - crta se level
  // 2 -  pobjeda! prelazi se na novi level ili na završni ekran.
  // 3 - crta se zadnji ekran/zavrsetak, ali gubitak 
  // 4 - crta se zadnji ekran/zavrsetak, ali pobjeda
  void draw() {
    // Crta level ako smo ušli u igru
    if (flag == 1) {
      b=true;
          if(currentLevel == 0){
              flag = l1.draw();
            }else if(currentLevel == 1){
              flag = l2.draw();
            }
            else if(currentLevel == 2){
              flag = l3.draw(); 
            }
            else if(currentLevel == 3){
              flag = l4.draw(); 
            }
            else if(currentLevel == 4){
              flag = l5.draw(); 
            }
            else if(currentLevel == 5){
              flag = l6.draw(); 
            }
      
        }else if (flag == 0) {
           // Crta menu (gumbi su invisible ako ih eksplicitno ne crtamo)
           background(menu);
        
        }else if (flag == 2 ) {
          // Ide se na iduci level ili se crta pobjednicki ekran
          // Inkrementiramo brojac koji oznacava trenutacni level        
          currentLevel++;
          
          // Ostvarena je ukupna pobjeda
          if(currentLevel == allLevels.size()){
               flag=4;
               if(b) play(winsound);
               background(won); 
               
            }else{
              flag = 1;
              // Kontrola za pucanje
              k1.pucanjright=false;
              k1.pucanjleft=false;
              }
          
        }else if(flag == 3){
          if(b) play(losesound);
          background(lost);
          // Ispis konacnog rezultata
          int health = k1.getHealth();
          // Za svaki preostali health se dobiva 10 bodova
          int points = k1.getPoints() + health*10;
          stroke(#8B0000);
          fill(#8B0000);
          textSize(50);
          text("FINAL SCORE", 680, 70);
          text("HEALTH:", 690, 120);
          text("SCORE:", 690, 170);
          text(health, 880, 120);
          text(points, 850, 170);
        }else if(flag == 4){
          if(b) play(winsound);
          background(won);
          // Ispis konacnog rezultata
          int health = k1.getHealth();
          // Za svaki preostali health se dobiva 10 bodova
          int points = k1.getPoints() + health*10;
          stroke(#8B0000);
          fill(#8B0000);
          textSize(50);
          text("FINAL SCORE", 680, 70);
          text("HEALTH:", 690, 120);
          text("SCORE:", 690, 170);
          text(health, 880, 120);
          text(points, 850, 170);
        }
  }
  
// Funkcija za pustanje zvuka gubitka/pobjede i sl.
void play(SoundFile a){
  if(!mute) a.play();
  b=false;
}
  
