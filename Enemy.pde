class Enemy{
  int x = 0;
  int y = 0;
  int type;
  int speed;
  int life;
  int damage;

  PImage enemyImg;
  Enemy(int x, int y, int type) {
    this.x = x;
    this.y = y;
    this.type = type;
    enemyImg = loadImage("img/enemy.png");
    life=1;
    speed=5;
    damage=20;
  }
  void move() {
    this.x+= speed;  
  }

  void draw()
  {
    image(enemyImg, x, y);
  }

  boolean isCollideWithFighter()
  {
       if(isHit(this.x,this.y,enemyImg.width,enemyImg.height,fighter.x,
           fighter.y,fighter.fighterImg.width,fighter.fighterImg.height))
          {
          return true;
          }        
          return false;
          }
          
  boolean isCollideWithBullet(int i)
  {
       if (bullet[i]!=null && isHit(this.x, this.y, 61, 61, bullet[i].x, bullet[i].y, 27, 31)==true) {
      return true;
    } else  return false;
  }
  
  boolean isOutOfBorder()
  {
    if(this.x >640){
            return true;
          }
          return false;
  }
}

void addEnemy(int type)
{  
  wait=5000;
  for (int i = 0; i < enemyCount; ++i) {
    enemys[i] = null;
  }
  switch (type) {
    case EnemysShowingType.STRAIGHT:
      addStraightEnemy();
      break;
    case EnemysShowingType.SLOPE:
      addSlopeEnemy();
      break;
    case EnemysShowingType.DIAMOND:
      addDiamondEnemy();
      break;
    case EnemysShowingType.STRONGLINE:
      addEnemyStrong();
      break;
  }
  time = millis();
}

void addStraightEnemy()
{
  wait=5000;
  float t = random(height - 60);
  int h = int(t);
  for (int i = 0; i < 5; ++i) {
    enemys[i] = new Enemy( (i+1)*-80, h , FlightType.ENEMY);
  }
}
void addSlopeEnemy()
{
  float t = random(height - 60 * 5);
  int h = int(t);
  for (int i = 0; i < 5; ++i) {
    enemys[i] = new Enemy((i+1)*-80, h + i * 50 , FlightType.ENEMY);
  }
}
void addDiamondEnemy()
{ 
  wait=5000;
  float t = random( 60 * 3 ,height - 60 * 3);
  int h = int(t);
  int x_axis = 1;
  for (int i = 0; i < 8; ++i) {
    if (i == 0 || i == 7) {
      enemys[i] = new Enemy((x_axis+1)*-80, h, FlightType.ENEMY);
      x_axis++;
    }
    else if (i == 1 || i == 5){
      enemys[i] = new Enemy((x_axis+1)*-80, h + 1 * 40, FlightType.ENEMY);
      enemys[i+1] = new Enemy((x_axis+1)*-80, h - 1 * 40, FlightType.ENEMY);
      i++;
      x_axis++;
      
    }
    else {
      enemys[i] = new Enemy((x_axis+1)*-80, h + 2 * 40, FlightType.ENEMY);
      enemys[i+1] = new Enemy((x_axis+1)*-80, h - 2 * 40, FlightType.ENEMY);
      i++;
      x_axis++;
    }
  }
}
void addEnemyStrong()
{
  for (int i = 0; i < 5; ++i) {
    wait=7000;
    enemys[i] = new Boss(-80, 40+ i * 85);
  }
}
