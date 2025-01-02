// Abstraktna klasa koja predstavlja gumb. Ova klasa je abstraktna
// da se moze uvijek napraviti gumb koji radi odredene stvari, da se
// uvijek te akcije mogu modificirati, a ne da postoji samo jedna akcija koja
// je moguća
abstract class AbstractButton{
  //------------------Podaci klase----------------
  // X koordinata gumba
  int x;
  // Y koordinata gumba
  int y;
  // Sirina gumba
  int width;
  // Visina gumba
  int height;
  // Boja unutrasnjosti gumba
  int fillColor;
  // Boja ruba gumba
  int borderColor;
  // Tekst koji je upisan u gumb
  String text;
  // Ime gumba
  String name;
  
  //----------------------------Metode klase----------------------

  // Funkcija koja crta gumb
  void draw(){
    stroke(borderColor);
    fill(fillColor);
    rect(x, y, width, height);
    }
    
  // Funkcija koja se poziva pri pritisku gumba
  void mousePressed(){
    update(mouseX, mouseY);
    }
    
  // Funkcija koja provjerava da li je mis u trenutku klika iznad gumba, i ako jest, onda se obavlja neka funkcija doFunction()
  void update(int X, int Y){
    if(overRect()){
      doFunction();
      }
    }
  
  // Funkcija provjerava da li je mis iznad gumba
  boolean overRect()  {
    if (mouseX >= x && mouseX <= x+width && 
        mouseY >= y && mouseY <= y+height) {
      return true;
      } else {
      return false;
      }
    }
    
  // Abstraktna funkcija koja oznacava funkciju koja ce se obaviti 
  abstract void doFunction();
  
  //...........................Set funkcije.................................
  
  // Postavlja x koordinatu
  void setX(int X){   x = X;  }
  
  // Postavlja y koordinatu
  void setY(int Y){  y = Y; }
  
  // Postavlja sirinu gumba
  void setWidth(int w){  width = w;  }
  
  // Postavlja visinu gumba
  void setHeight(int h){ height = h;}
  
  // Postavlja ime gumba
  void setName(String n){  name = n; }
  
  // Postavlja tekst gumba
  void setText(String t){ text = t;}
  
  // Postavlja boju unutrašnjosti gumba
  void setFillColor(int fC){  fillColor = fC; }
  
  // Postavlja boju ruba gumba
  void setBorderColor(int bC){   borderColor = bC;  }
  
}
