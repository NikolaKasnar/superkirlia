  //Demo gumb
  Button1 demoButton;
  //Klasa za demo gumb
  class Button1 extends AbstractButton {
    void doFunction() {
      fillColor = 255;
      borderColor = 255;
    }
  }
  //Zastava za ispis, pomoc
  boolean b = true;
  //Zastava koja pokayuje koji se 
  int flag = 0;
  //Klasa za gumb na meniu. Prebacuje s menu-a na prvi level
  class ButtonMenu extends AbstractButton {
    void doFunction() {
      flag = 1;
    }
  }
  
  //DRUGI DEMO
  //Glavni lik, igrac njime upravlja
  Kirlia k2;
  Rectangle r1;
  Rectangle r2;
  Rectangle r3;
  Rectangle floor;
  Rectangle[] r;
  Point[] coinPoints;
  //Coin coin;
  //int coinIndex;
  Enemy e;
 // int enemyTimer;
  Level l;
  ButtonMenu menuButton;
  //Funckija koja postavlja sve na pocetku, i inicijalizira sve levele
  void setup() {
  
    size(700, 700);
    /* demoButton = new Button1();
     demoButton.setX(200);
     demoButton.setY(200);
     demoButton.setHeight(50);
     demoButton.setWidth(100);
     */
  
    menuButton = new ButtonMenu();
    menuButton.setX(200);
    menuButton.setY(200);
    menuButton.setHeight(50);
    menuButton.setWidth(100);
  
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
  
    k2.setOgX(400);//POTREBNO ISTO POSTAVITI NA POCETKU
    k2.setX(400);
    k2.setOgY(578);//POTREBNO ISTO POSTAVITI NA POCETKU
    k2.setY(578);
    k2.setHeigth(20);
    k2.setWidth(20);
  
    floor.setX(0);
    floor.setY(600);
    floor.setW(700);
    floor.setH(100);
  
    ArrayList<Rectangle> p = new ArrayList<Rectangle>();
    p.add(floor);
    p.add(r1);
    p.add(r2);
    p.add(r3);
  
    k2.setCurrentlyAbove(floor);
  
    r = new Rectangle[4];
    r[0] = r1;
    r[1] = r2;
    r[2] = r3;
    r[3] = floor;
  
   // coinIndex = 0;
  
    coinPoints = new Point[2];
    Point p1 = new Point(585, 585);
    Point p2 = new Point(220, 585);
    coinPoints[0] = p1;
    coinPoints[1] = p2;
  
    ArrayList<Point> coinsP = new ArrayList<Point>();
    coinsP.add(p1);
    coinsP.add(p2);
  
    /*coin = new Coin();
    coin.setCenter(coinPoints[coinIndex]);
    coin.setRadius(30);
  */
    e = new Enemy();
    e.setX(300);
    e.setY(550);
    e.setOgX(300);
    e.setOgY(550);
    e.setHeigth(50);
    e.setWidth(30);
    e.setDistance(30);
  
    // Level(int numberMaxPoints, Kirlia k, Enemy enemy, 
    //ArrayList<Point> coins, ArrayList<Rectangle> rectangle){
  
    l = new Level(3, k2, e, coinsP, p);
  }
  
  //Funckija koja crta trenutni ekran.
  //0 - crta se menu
  //1 - crta se level
  //2 - crta se zadnji ekran/zavrsetak, ali pobjeda
  //3 - crta se zadnji ekran/zavrsetak, ali gubitak 
  void draw() {
  
    //demoButton.draw();
    if (flag == 1) {
      flag = l.draw();
    } else if (flag == 0) {
      background(255);
      menuButton.draw();
    } else if (flag == 2 || flag == 3) {
      background(170);
    }
  
    //SAMO PROVJERA ZA MENE
    if (b) {
      println(flag);
      b = false;
    }
  
    //PROVJERA ZA MENE, ali nesto slicno ce biti sa zadnjim ekranima
    if (flag == 2) {
      println("Pobjeda");
    } else if (flag == 3) {
      println("Gubitak!");
    }
  }
  
  //Funkcija koja se poziva kad se pritisne tipka na misu
  void mousePressed() {
    //demoButton.mousePressed();
    if (flag == 0) {
      menuButton.mousePressed();
    } else if (flag == 1) {
      l.mousePressed();
    }
  }
  //Funkcija koja se poziva kad se pritisne tipka na tipkovnici
  void keyPressed() {
    l.keyPressed();
  }
  //Funckija koja se zove kad se otpusti tipka na tipkovnici
  void keyReleased() {
    l.keyReleased();
  }
