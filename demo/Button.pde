abstract class AbstractButton{

  int x;
  int y;
  int width;
  int height;
  int fillColor;
  int borderColor;
  String text;
  String name;
  
  void setX(int X){
    x = X;
  }
  
  void setY(int Y){
    y = Y;
  }
  
  void setWidth(int w){
    width = w;
  }
  
  void setHeight(int h){
    height = h;
  }
  
  void setName(String n){
    name = n;
  }
  
  void setText(String t){
    text = t;
  }
  
  void setFillColor(int fC){
    fillColor = fC;
  }
  
  void setBorderColor(int bC){
    borderColor = bC;
  }
  
  void draw(){
    stroke(borderColor);
    fill(fillColor);
    rect(x, y, width, height);
  }
  
  void mousePressed(){
    update(mouseX, mouseY);
  }
  
  void update(int X, int Y){
    if(overRect()){
      doFunction();
    }
  }
  
  abstract void doFunction();
  
  boolean overRect()  {
    if (mouseX >= x && mouseX <= x+width && 
        mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }
  
}
