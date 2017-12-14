//PFont f;
//PFont k; 
//PImage star; 
boolean click = false;
Facts help= new Facts();
String theFact="";  
ArrayList<Snow> snowList; 
Drawing draw=new Drawing(); 
void setup()
{
  size(1800,1000); 
  //f = createFont("Times-Italic",16,true);
 // k= createFont("Futura-Medium",14,true); 
  //star=loadImage("star.png"); 
  snowList=new ArrayList(900); 
  
}

public void gettingTheFact()
{
theFact=help.getFact(); 
}



void draw()
{
background(0);
draw.drawSky(); //lotta methods
draw.drawSnow(); 
draw.drawWalls(); 
draw.drawWindows(); 
draw.drawFloor(); 
draw.drawTree(); 
//image(star,190,300,130,100); 
fill(255); //white
//textFont(f,26);  
text(theFact, 460,780);  //text for the fact 
draw.drawGift();
fill(255); 
//textFont(k,12); 
text("Click us",193,865); 
//textFont(k,20); 
text("The Tree of Knowledge",160,600); 
//textFont(k,50); 
fill(#B92406);
text("Merry Christmas!!!",100,120); 
if(help.askinForIt(mouseX,mouseY)&& click)
 {
  click=false;
  gettingTheFact(); 
 }
  
}
void mouseClicked(){
click=true;
}

public class Drawing
{
  public void drawWalls() 
  {
    noStroke(); 
fill(#8E102F);//maroon
rect(0,0,600,600); //prints maroon wall
rect(850,0,350,600); //prints maroon wall
rect(1450,0,350,600); //prints maroon wall
rect(0,0,1800,100); //prints maroon wall
rect(0,350,1800,250); //prints maroon wall 
stroke(0); 
  }
  public void drawWindows()
  {
    noStroke(); 
    fill(#583C20);
rect(575,75,25,300); //window frame
rect(575,75,300,25); //window frame
rect(850,75,25,300);//window frame
rect(575,350,300,25); //window frame
rect(725,75,10,300); //middle Window
rect(575,212.5,300,10); //middle window

rect(1175,75,25,300);//second window
rect(1175,75,300,25);
rect(1450,75,25,300);
rect(1175,350,300,25);
rect(1325,75,10,300);
rect(1175,212.5,300,10); 
stroke(0); 
  }
  public void drawFloor()
  {
    fill(#6A4926); //brown
rect(0, 500, 100, 500);  //first rect
float i= 0;
while(i <= 1800){  //prints rest of wood floor
i+=100;
rect(i, 500, 100, 500);
}
  }
  public void drawTree()
  {
    fill(#226C30);
triangle(30, 875, 258, 520, 486, 875); //bottom part of tree
triangle(60, 775, 258, 425, 456, 775); //second of tree
triangle(90, 675, 258, 400, 426, 675); //third of tree
triangle(120, 575, 258, 375, 396, 575); //fourth of tree
triangle(150, 480, 258, 365, 356, 480); //fifth of tree
  }
  public void drawGift()
  {
    fill(#FA2327); //gift
rect(490,800,110,115);//gift
fill(#008109); //gift
noStroke(); 
rect(491,848,109,15);//giftribbon
rect(538,801,15,114); //giftribbon
stroke(0,0,0); 
fill(#2C45DB); 
rect(190,850,110,115); //gift 2
noStroke(); 
fill(#F51919); 
rect(240,851,15,114); //ribbon 2
rect(191,897,109,15); //ribbon 2

  }
  public void drawSnow()
  {
      for(int s=0; s<900; s++)//snow
  {
   Snow obj=new Snow(random(500,1800),random(0,350),random(1,2),random(-.3,.3),random(1,4));//the snow call
   snowList.add(obj); //adding snow objects into the array list
   snowList.get(s).display();//displaying them
  snowList.get(s).reset(); //reseting the strays 
  }
  }
  public void drawSky()
  {
 fill(#030629); //color of sky
 rect(600, 100, 250, 250); //first window
 rect(1200, 100, 250, 250);//second window
  }
} 

public class Facts
{
  public String getFact()//reading the text file and returning a random one
  {
   String[] lines=loadStrings("files.txt"); 
   String help= lines[(int)random(0,lines.length)]; 
   return help; 
  }
  public boolean askinForIt(float x, float y)
  {
    if(x>490 && x<600 && y<915 && y>800)//location of mouse 
    {
      return true;
    }
    else if (x>190 && x<300 && y>850 && y<965)//second present location 
    {
     return true;  
    }
    return false;
  }
} 

public class Snow
{
  ArrayList<Snow> snowlist =new ArrayList<Snow>();
   float xDir;//not direction 
   float yDir;
   float acc; //not acceleration 
   float xacc;
   float size; 
  public Snow(float x, float y, float accel, float xaccel, float sz) 
  {
    xDir = x;
    yDir= y;
    acc=accel; 
    xacc=xaccel;
    size=sz; 
  }
  
public void display()
{
fill(255);
acc=size*.25;  //speed accourding to size 
ellipse(xDir, yDir,size,size); 
yDir=yDir+1*acc; //movement 
xDir=xDir+1*xacc;//movement
}
public void reset()
{
  if(yDir>360)//reseting in  y
  {
    yDir=90; 
  }
  if(xDir>1800 || xDir<200)//reseting in x
  {
    xDir=random(500,1800);
  }
  
}

}
