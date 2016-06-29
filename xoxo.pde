Square[][] grid;                 
int row, col, spaces;            
float x, y, w, h;               
int player = 1;                  
boolean gameOver;                
int winner;                      
boolean play;                    
 
float w_button = 150;            
float h_button = 40;
float x_button = (425/2) - (w_button/2);
float y_button = 475;
 
    
void setup(){
  size (425,550);
  row = 3; col = 3; spaces = 9; 
  grid = new Square[row][col];
     
  startGame();    
   
}
 
 
 
void draw(){
   
  checkGameOver();  
   
   
 
   
  if (gameOver == false){
     
   
    background(0,204,0);
    for(int i = 0; i < row; i++){
      for(int j = 0; j < col; j++){
        grid[i][j].display();
      }
    }
   
  }
   
   
  
  else {
    play = false;
    
    if (winner == 1){background(255,0,0);}
    else if (winner == 2){background(0,0,255);}
    else{background(0);}
         
    endOfGameText(winner);    
 
    // then redraw the grid on top
    for(int i = 0; i < row; i++){
      for(int j = 0; j < col; j++){
        grid[i][j].display();
      }
    }
     
    playAgainButton();   
     
     
  }
  
}
 
 
 
class Square{
   
 float xPos, yPos, s_width, s_height;    
 int value;                              
 
 Square(float x, float y, float w, float h){
   xPos = x;
   yPos = y;
   s_width = w;
   s_height = h;
   value = 0;      
 }
 
 void display(){
   rect(xPos, yPos, s_width, s_height);
   if(value == 1){
     drawCross();
   }
   else if(value == 2){
     drawCircle();
   }
 }
  
 
 void click(float m_X, float m_Y){
    
   float mX = m_X;
   float mY = m_Y;
    
  
   if(mX > xPos && mX < xPos + s_width &&
      mY > yPos && mY < yPos + s_height){
       
      if(value == 0 && play == true){
           
        
        if(player==1){
          value = 1;
          player = 2;
         }
        
        
         else{
           value = 2;
           player = 1;
         }
        
         
         spaces--;
      }
    }  
 }
  

 void drawCross(){
   stroke(255,0,0); strokeWeight(5);
   line(xPos+20, yPos+20, xPos+(s_width-20), yPos+(s_height-20));
   line(xPos+20, yPos+(s_height-20), xPos+(s_width-20), yPos+20);
   stroke(0); strokeWeight(1);
 }
  
 
 void drawCircle(){
   stroke(0,0,255); strokeWeight(5);
   ellipse(xPos+(s_width/2), yPos+(s_height/2), s_width-25, s_height-25);
   stroke(0); strokeWeight(1);
 }
  
 
 int getValue(){
   return value;
 }
 
 
}
 

void mousePressed(){
  for(int i = 0; i < row; i++){
    for(int j = 0; j < col; j++){
      grid[i][j].click(mouseX, mouseY);
    }
  }
   
  if (mouseX > x_button && mouseX < x_button + w_button &&
      mouseY > y_button && mouseY < y_button + h_button){
    startGame();
  }
}

void checkGameOver(){
   
 int r = row;
 int c = col;
  
 
 for (int i = 0; i < r; i++){
   if(grid[i][0].getValue() == 1 && grid[i][1].getValue() ==  1 && grid[i][2].getValue() == 1){
     gameOver = true;
     winner = 1;
   }
   if(grid[i][0].getValue() == 2 && grid[i][1].getValue() ==  2 && grid[i][2].getValue() == 2){
     gameOver = true;
     winner = 2;
   }
 }
  
 
 for (int i = 0; i < c; i++){
   if(grid[0][i].getValue() == 1 && grid[1][i].getValue() ==  1 && grid[2][i].getValue() == 1){
     gameOver = true;
     winner = 1;
   }
   if(grid[0][i].getValue() == 2 && grid[1][i].getValue() ==  2 && grid[2][i].getValue() == 2){
     gameOver = true;
     winner = 2;
   }
 }
  
 
 if(grid[0][0].getValue() == 1 && grid[1][1].getValue() ==  1 && grid[2][2].getValue() == 1){
     gameOver = true;
     winner = 1;
 }
 if(grid[0][0].getValue() == 2 && grid[1][1].getValue() ==  2 && grid[2][2].getValue() == 2){
     gameOver = true;
     winner = 2;
 }
  
 
 if(grid[2][0].getValue() == 1 && grid[1][1].getValue() ==  1 && grid[0][2].getValue() == 1){
     gameOver = true;
     winner = 1;
 }
 if(grid[2][0].getValue() == 2 && grid[1][1].getValue() ==  2 && grid[0][2].getValue() == 2){
     gameOver = true;
     winner = 2;
 }
 if (spaces == 0){
   gameOver = true;
 }
  
}
   
 void endOfGameText(int win){
   float xPosition = 140, yPosition = 450;
   stroke(255);
   textSize(20);
   if (win==1){text("Winner: Player 1", xPosition, yPosition);}
   if (win==2){text("Winner: Player 2", xPosition, yPosition);}
   if (win==0){text("Game Over. No Winner", xPosition-35, yPosition);}
    stroke(0);
 }
 
 void playAgainButton(){
   fill(200);
   stroke(200);
   rect(x_button, y_button, w_button, h_button);
   stroke(0);
   fill(0);
   text("PLAY AGAIN", x_button+15, y_button+30);
   fill(255);
 }
  
 void startGame(){
    
   player = 1;         
   play = true;         
   spaces = 9;          
   gameOver = false;    
   winner = 0;          
    
   background(200);   
    
   
   x = 25;         
   y = 25;
   w = 125; h = 125;
   
   
   for(int i = 0; i < row; i++){
    for(int j = 0; j < col; j++){
      grid[i][j] = new Square(x, y, w, h);
      x += w;  
    }
    y += h;    
    x = 25;    
  }
 }