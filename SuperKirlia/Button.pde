//Abstraktna klasa koja predstavlja gumb. Ova klasa je abstraktna
//da se može uvijek napraviti gumb koji radi određene stvari, da se
//uvijek te akcije mogu modificirati, a ne da postoji samo jedna akcija koja
// je moguća
abstract class AbstractButton{
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
  //Postavlja x koordinatu
  void setX(int X){
    x = X;
  }
  //Postavlja y koordinatu
  void setY(int Y){
    y = Y;
  }
  //Postavlja širinu gumba
  void setWidth(int w){
    width = w;
  }
  //Postavlja visinu gumba
  void setHeight(int h){
    height = h;
  }
  //Postavlja ime gumba
  void setName(String n){
    name = n;
  }
  //Postavlja tekst gumba
  void setText(String t){
    text = t;
  }
  //Postavlja boju unutrašnjosti gumba
  void setFillColor(int fC){
    fillColor = fC;
  }
  //Postavlja boju ruba gumba
  void setBorderColor(int bC){
    borderColor = bC;
  }
  //Crta gumb
  void draw(){
    stroke(borderColor);
    fill(fillColor);
    rect(x, y, width, height);
  }
  //Funckija koja se poziva kad se pritisne gumb
  void mousePressed(){
    update(mouseX, mouseY);
  }
  //Funckija koja provjerava da li je miš u tom trenutku iznad gumba,
  //i ako je, onda se obavlja neka funkcija
  void update(int X, int Y){
    if(overRect()){
      doFunction();
    }
  }
  //Abstraktna funkcija koja označava funkciju koja će se obaviti
  abstract void doFunction();
  //Funkcija provjerava da li je miš iznad gumba
  boolean overRect()  {
    if (mouseX >= x && mouseX <= x+width && 
        mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }
}
