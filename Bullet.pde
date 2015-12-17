class Bullet{
  int x,y;
  PImage bulletImg = loadImage("img/shoot.png");
  
  Bullet(int fighterX, int fighterY) {
    x = fighterX;
    y = fighterY;
      //  image(bulletImg,x,y);
  }
  void move(){
    x = x - 5;
  }
  void draw(){
    image(bulletImg,x-15,y+15);

  }
  boolean isOutOfBorder(){
    if (this.x < -30) {
      return true;
    }else{
      return false;
    }
    
  }
}
