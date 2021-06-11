//Abstraktna klasa koja predstavlja gumb. Ova klasa je abstraktna
//da se može uvijek napraviti gumb koji radi određene stvari, da se
//uvijek te akcije mogu modificirati, a ne da postoji samo jedna akcija koja
// je moguća
abstract class AbstractButton{
  //------------------podaci klase----------------
  //X koordinata gumba
  int x;
  //Y koordinata gumba
  int y;
  //Širina gumba
  int width;
  //Visina gumba
  int height;
  //Boja unutrašnjosti gumba
  int fillColor;
  //Boja ruba gumba
  int borderColor;
  //Tekst koji je upisan u gumb
  String text;
  //Ime gumba
  String name;
  
  //----------------------------metode klase----------------------

  //Funkcija koja crta gumb
  void draw(){
    stroke(borderColor);
    fill(fillColor);
    rect(x, y, width, height);
    }
    
  //Funkcija koja se poziva pri pritisku gumba
  void mousePressed(){
    update(mouseX, mouseY);
    }
    
  //Funkcija koja provjerava da li je miš u trenutku klika iznad gumba, i ako jest, onda se obavlja neka funkcija doFunction()
  void update(int X, int Y){
    if(overRect()){
      doFunction();
      }
    }
  
  //Funkcija provjerava da li je miš iznad gumba
  boolean overRect()  {
    if (mouseX >= x && mouseX <= x+width && 
        mouseY >= y && mouseY <= y+height) {
      return true;
      } else {
      return false;
      }
    }
    
  //Abstraktna funkcija koja označava funkciju koja će se obaviti 
  abstract void doFunction();
  
  //...........................set funkcije.................................
  
    //Postavlja x koordinatu
  void setX(int X){   x = X;  }
  
  //Postavlja y koordinatu
  void setY(int Y){  y = Y; }
  
  //Postavlja širinu gumba
  void setWidth(int w){  width = w;  }
  
  //Postavlja visinu gumba
  void setHeight(int h){ height = h;}
  
  //Postavlja ime gumba
  void setName(String n){  name = n; }
  
  //Postavlja tekst gumba
  void setText(String t){ text = t;}
  
  //Postavlja boju unutrašnjosti gumba
  void setFillColor(int fC){  fillColor = fC; }
  
  //Postavlja boju ruba gumba
  void setBorderColor(int bC){   borderColor = bC;  }
  
}
