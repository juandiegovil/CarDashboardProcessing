import org.gicentre.utils.stat.*;
PFont font;
SensorDataProvider p1 = new SensorDataProvider();
Car c1 = new Car();
Gauge fuelGauge = new Gauge();
Gauge tachometer = new Gauge();
Gauge speedometer = new Gauge();
Gauge odometer = new Gauge();
Gauge fuelEconomy = new Gauge();
Gauge range = new Gauge();
Gauge fuelConsumption = new Gauge();
Gauge compass = new Gauge();
boolean a = false;
boolean b = false;
int input;
String type;
float carRadius;
float carTankCapacity;
PImage img;
PImage img2;
boolean c;
float m;
float n;

void setup(){
  size(1000,700);
  img = loadImage("Blogo.png");
  img2 = loadImage("Flogo.png");
  displayMenu();
  font = loadFont("DS-Digital.vlw");
  textFont(font);
}

void draw(){
  //frameRate(3);
  if(a && p1.currentIndex < 600){
    c1.processInput(p1.readRPM(), p1.readFuelLevel(), p1.readRatio(), p1.readX(), p1.readY());  
    compass.displaycompass(c1.o1.getDirection(), 327, 95, 70);
    fuelGauge.displaygauges(p1.readFuelLevel(), 730, 220, 200, 40, "FUEL", "(LITER)");
    tachometer.displaygauges(p1.readRPM(), 270, 220, 200, 40, "RPM", "");
    speedometer.displaygauges(c1.o1.getCurrentSpeed(), 500, 170, 300, 60, "SPEED", "(KM/HR)");
    odometer.displaytexts(c1.o1.totalTravelledDistance, 200, 400, "ODOMETER", "KM");
    fuelEconomy.displaytexts(c1.o3.calculateFuelEconomy(), 200, 430, "FUEL ECONOMY", "KM/LITER");
    range.displaytexts(c1.o3.range, 550, 400, "RANGE", "KM");
    fuelConsumption.displaytexts(c1.o3.fuelConsumption, 550, 430, "FUEL CONSUMPTION", "LITER/(100KM)");
    displaygraphs(c1.o3.fuelConsumptionHistory, 665, "Fuel Consumption (liter) over time (sec)");
    displaygraphs(c1.o3.averageFuelEconomyHistory, 340, "Average Fuel Economy (km/liter) over time (sec)");
    displaygraphs(c1.o3.fuelEconomyHistory, 10, "Fuel Economy (km/liter) over time (sec)");
    p1.readNext();
  }
  else if(p1.currentIndex>=600){
    a = false;
    p1.Initialize();
  }
  else{
    if (b){
      c1.o1.updateTotalDistance();
      c1.o2.previousLevel = 50;
      c1.o3.fuelEconomyHistory = new float [0];
      c1.o3.averageFuelEconomyHistory = new float [0];
      c1.o3.fuelConsumptionHistory = new float [0];
      c1.o3.fuelEconomyValuesCount = 0;
      a = true;
      background(0);
      stroke(0,26,255); //Lines 10-15 does the blurred blue ellipse. I wanted
      strokeWeight(17); //and could do this on the Gauge Display function but
      ellipse(270,220,200,200); //that slowed the program a lot so I just
      ellipse(730,220,200,200); //decided to make these ellipses once on this else
      ellipse(500,170,300,300); //statement so it only does it once rather than drawing them over
      filter(BLUR,6); //and over again on the draw function through the Gauge class.
      fill(255);
      textSize(12);
      text("RPM:", 165, 90);
      text("Min: 0   Max: 2500", 165, 107);
      text("Speed:", 730, 90);
      text("Min: 0   Max: 200", 730, 107);
      if(c)
        image(img, 5, 0, 130, 130);
      else
        image(img2, -10, -15, 200, 130);
      b = false;
    }
    else{
      delay(2000);
      displayMenu();
    }
  }
}

void keyPressed(){
  if(!a){
    if(key == '1'){
      b = true;
      type = "car_status_BMW_323i.csv";
      carRadius = 0.23;
      c = true;
      carTankCapacity = 60;
      p1.Initialize();
    }
    else if(key == '2'){
      b = true;
      type = "car_status_Truck_F150.csv";
      carRadius = 0.254;
      c = false;
      carTankCapacity = 80;
      p1.Initialize();
    }
    else if(key == '3'){
      b = true;
      exit();
    }
  }
}
