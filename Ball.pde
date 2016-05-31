class Ball {
  
  final static int MOVING = 0;
  final static int GROWING = 1;
  final static int SHRINKING = 2;
  final static int DEAD = 3;
      
  //other constants necessary?
  
  float x;
  float y;
  float rad;
  color c;
  float dx;
  float dy;
  int state;

  
  Ball() {
    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color( r, g, b );
    rad = 20;    
    x = random( (width - r) + r/2 );
    y = random( (height - r) + r/2 );

    dx = random(10) - 5;
    dy = random(10) - 5;
    
    state = MOVING;
  }
  

  void move() {
    x = x + dx;
    y = y + dy;
    bounce();
    if (state == GROWING){
      expand();
    }
    else if (state == SHRINKING){
      shrink();
    }
    else if (state == DEAD) {
      clear(); 
    }
  }
 void expand(){
   dx = 0;
   dy = 0;
   if (rad <=40){
   this.rad+=1;
   }
   else {
     this.shrink();
   }  
}
    
    void shrink(){
      state = SHRINKING;
      this.rad-=1;
    }
  
   void bounce(){
   if (this.x >= 600 || this.x <= 0) {
       dx *=-1;
   }  
   if (this.y >= 600 || this.y <= 0) {
     dy*=-1;
   }  
 
 
 }
 boolean isTouching( Ball other ) {
  return (other.x >= this.x - rad+1 && other.x <= this.x + rad-1 && other.y >= this.y - rad+1 && other.y <= this.y + rad-1);
 }
 
  
}//end class Ball