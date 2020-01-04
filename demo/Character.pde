abstract class Character{

  int x;
  int y;
  int height;
  int width;
  
  void setX(int X){
    x = X;
  }
  
  void setY(int Y){
    y = Y;
  }
  
  void setWidth(int w){
    width = w;
  }
  
  void setHeigth(int h){
    height = h;
  }
  
  abstract void moveLeft();
  abstract void moveRight();
  
  abstract void draw();
}
