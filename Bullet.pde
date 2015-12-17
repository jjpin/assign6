class Bullet{
  int x,y;
  PImage bulletImg = loadImage("img/shoot.png");
  
  Bullet(int fighterx, int fightery) {
    x = fighterx;
    y = fightery;
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
