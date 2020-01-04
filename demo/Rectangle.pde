
class Rectangle{
  int x;
  int y;
  int h;
  int w;
  int fillColor = 255;
  int borderColor = 255;
  
  void setFillColor(int fC){
    fillColor = fC;
  }
  
  void setBorderColor(int bC){
    borderColor = bC;
  }
  
  void setW(int W){
    w = W;
  }
  
  void setH(int H){
    h = H;
  }
  
  void setX(int X){
    x = X;
  }
  
  void setY(int Y){
    y = Y;
  }
  
  int getX(){
    return x;
  }
  
  int getY(){
    return y;
  }
  
  int returnH(){
    return h;
  }
  
  int returnW(){
    return w;
  }
  
  void draw(){
    fill(fillColor);
    stroke(borderColor);
    rect(x, y, w, h);
  }
  
  Point returnLUPoint(){
    return new Point(x, y);
  }
  
  Point returnLDPoint(){
    return new Point(x, y + h);
  }
  
  Point returnRUPoint(){
    return new Point(x + w, y);
  }
  
  Point returnRDPoint(){
    return new Point(x + w, y + h);
  }
}
