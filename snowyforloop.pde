void setup() {
   size(1000, 1000);   snow = [];
clouds = [];

function Clouds(x, y, speed, sze){
    this.x  = x;
    this.y = y;
    this.speed = speed;
    this.sze = sze;
    this.draw = function () {
        fill(220,220,220,random(25,200));
        ellipse(this.x,this.y,this.sze*3,this.sze*1.5);
        ellipse(this.x,this.y,this.sze*3+this.sze*0.3,this.sze*1.5+this.sze*0.1);
    };
    this.drift = function () {
      this.x = this.x - this.speed;
      this.y = this.y - this.speed/11;
    };
}

function Snow (x,y,speed,sze) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.sze = sze;
    this.draw = function(){
        rectMode(CENTER);
        fill(255);
        rect(this.x,this.y,this.sze,this.sze);
        fill(255,255,255,190);
        rect(this.x,this.y,this.sze+10,this.sze+10,100);
        fill(255,255,255,120);
        rect(this.x,this.y,this.sze+20,this.sze+20,100);
        fill(255,255,255,60);
        rect(this.x,this.y,this.sze+30,this.sze+30,100);
        resetMatrix();
        rectMode(CORNER);
    };
    this.fall = function () {
      this.x = this.x + this.speed/8;
      this.y = this.y + this.speed;
      if(this.y>random(650,1100)){
          fill(80);
          ellipse(this.x,this.y,this.sze*1.5,this.sze/5);
          this.y = 0;
      }
      if(this.x>1000){
          this.x = 0;
      }
    };
}

var timer = 100;
var cloudTimer = 550;
draw = function () {
    background(235);
    noStroke();
    fill(223);
    //backmost hills
    bezier(600,350,600,300,700,250,1100,350);
    fill(190,190,190,200);
     quad(10,400,1100,450,1150,500,1000,400);
    fill(215);
    bezier(0,400,600,250,890,350,1000,400);
    fill(199);
    rect(0,550,1000,500);
    bezier(0,550,300,450,450,425,1000,550);
    //sky
    fill(250);
    rect(0,0,1000,100);
    fill(255,255,255,200);
    rect(0,25,1000,100);
     fill(250,250,250,100);
    rect(0,50,1000,100);
    fill(250,250,250,50);
    rect(0,75,1000,100);
    fill(250,250,250,25);
    rect(0,100,1000,100);
    //fire
    fill(255,223,0,random(185));
    ellipse(325,600,175,25);
    fill(255,153,0,random(100,255));
    ellipse(335,550,random(15,20),random(20,45));
    triangle(random(325,330),random(525,530),random(275,280),random(600,590),365,600);
    fill(255,223,0,random(155));
    ellipse(335,550,random(15,20),random(20,45));
    triangle(random(325,330),random(525,530),random(275,280),random(600,590),365,600);
    //person
    strokeWeight(4);
    stroke(255,223,0,random(255));
    quad(300,500,280,520,random(295,299),random(595,600),315,515);
    fill(180);
    quad(250,550,260,650,400,650,random(306,310),random(537,543));
    triangle(306,537,330,545,350,610);
    noStroke();
    strokeWeight(4);
    stroke(255,223,0,random(255));
    quad(300,500,280,520,random(295,299),random(595,600),315,515);
    noStroke();
     fill(180);
    quad(250,550,260,650,400,650,random(306,310),random(537,543));
    triangle(306,537,330,545,350,610);
    fill(150);
    //cast shadow
    quad(300,500,280,520,random(295,299),random(595,600),315,515);
    fill(150,150,150,random(155));
    quad(260,650,random(340,350),1100,random(690,700),1000,400,650);
    fill(150,150,150,220);
    quad(260,650,random(340,350),1100,random(690,700),1000,400,650);
    
    for (var i = 0; i < snow.length; i++){
        snow[i].draw();
        snow[i].fall();
    }
    
    if(timer>110){
        snow.push( new Snow(random(1000),random(300),random(20),random(4)));
        timer = 0;
    }
    if(cloudTimer > 550){
        clouds.push( new Clouds(1100,random(300),random(3),random(500)));

    }
    
    timer = timer + 1;
    cloudTimer = cloudTimer + 1;
    
};
}