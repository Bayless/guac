Ball[] balls;

boolean reactionStarted;

void setup() {
  size(600, 600);
  reactionStarted = false;
  balls = new Ball[25];
  for (int i=0; i < balls.length; i++ ){
    balls[i] = new Ball();
  }
  balls[0].state = Ball.DEAD;
}


void draw() {
  
  background(0);
  for (int i=0; i < balls.length; i++ ) {
    ellipse(balls[i].x,balls[i].y,balls[i].rad,balls[i].rad);
    fill(balls[i].c);
      balls[i].move();
  
  }
 
  if (mousePressed){
    mouseClicked();
    if (balls[0].rad < 40){
       balls[0].state = Ball.GROWING;
     }
     else {
       balls[0].state = Ball.SHRINKING;
     }
  }
  if (reactionStarted){
     for (int i = 0; i < 20 ; i ++) {
       for (int j = 0; j < 20; j++) {
         if (i != j) {
            if (balls[i].isTouching(balls[j]) && (balls[i].state == Ball.GROWING || balls[i].state == Ball.SHRINKING|| balls[j].state == Ball.GROWING || balls[j].state == Ball.SHRINKING   )){
              if (balls[i].state == Ball.GROWING) {
                 balls[j].state = Ball.GROWING; 
              }
              
              if (balls[i].state == Ball.SHRINKING){
                balls[j].state = Ball.GROWING;
              }
              
              if (balls[j].state == Ball.GROWING){
                 balls[i].state = Ball.GROWING; 
              }
              
              if (balls[j].state == Ball.SHRINKING){
                 balls[i].state = Ball.GROWING; 
              }   
            }         
     }
      
     if (balls[i].rad >= 40) {
        balls[i].state = Ball.SHRINKING; 
     }
     if (balls[i].rad <= 0) {
        balls[i].state = Ball.DEAD; 
     }
       }
     
  }}}
  
     
  
  /*
  
  
    if (balls[i].state == Ball.GROWING || balls[i].state == Ball.SHRINKING){
          for (int j=0; j < balls.length; j++ ) {
           if (j!=i){
            if (balls[i].isTouching(balls[j])){
               if (balls[j].rad<40){
                balls[j].expand();
               }
               balls[j].shrink();
               }
            }
           }
          }
    }
  }*/



void mouseClicked() {
  if ( !reactionStarted ) {
    balls[0].x = mouseX;
    balls[0].y = mouseY;
    balls[0].rad = 0.1;
    balls[0].state = Ball.GROWING;
    reactionStarted = true;
    }
}