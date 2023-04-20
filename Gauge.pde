class Gauge{
  int minimum;
  int maxiumum;
  int current;
  String units;
  float X;
  float Y;
  void displaygauges(float value, int X, int Y, int size, int fontsize, String gauge, String units){
    fill(0);
    stroke(125,125,125);
    strokeWeight(2); 
    ellipse(X,Y,size,size);
    if(value>500){
      if(value>=0.85*2500)
        fill(255, 0, 0);
      else if(value<=0.15*2500)
        fill(0, 255, 0);
      else
        fill(255);
    }
    else{
      if(value>=0.85*200)
        fill(255, 0, 0);
      else if(value<=0.15*200)
        fill(0, 255, 0);
      else
        fill(255);
    }
    textFont(font);
    textAlign(CENTER, CENTER);
    textSize(fontsize);
    text(nf(value,2,1),X,Y);
    textSize(20);
    fill(255);
    text(gauge+" "+units,X,Y+(size/2+20));
  }
  void displaytexts(float value, int X, int Y, String gauge, String units){
    if(gauge.equals("ODOMETER")){
      fill(0);
      noStroke();
      rect(0,350,1000,500);
    }
    textAlign(LEFT, CENTER);
    fill(#489B1F);
    textFont(font);
    textSize(20);
    text(gauge+": "+nf(value,1,2)+" "+units,X,Y);
  }
  void displaycompass(String value, int X, int Y, int size){
    fill(0);
    noStroke();
    ellipse(X,Y,size+12,size+12);
    stroke(#FF0303);
    strokeWeight(2); 
    ellipse(X,Y,size,size);
    noFill();
    strokeWeight(4);
    stroke(#FC0380);
    arc(X,Y,size+7,size+7,m,n);
    fill(255);
    textFont(font);
    textAlign(CENTER, CENTER);
    textSize(35);
    text(value,X,Y);
  }
}
