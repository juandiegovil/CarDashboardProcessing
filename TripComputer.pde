class TripComputer{
  float RPM;
  float gearRatio;
  float speed;
  float totalTravelledDistance = 0;
  float radius = carRadius;
  float X;
  float Y;
  float pX = X;
  float pY = Y;
  float getCurrentSpeed(){
    speed = ((RPM*60)*(1/gearRatio)*2*PI*radius)/1000;
    updateTotalDistance();
    return speed;
  }
  void updateTotalDistance(){
    if(a)
      totalTravelledDistance += (speed/3600);
    else
      totalTravelledDistance = 0;
  }
  String getDirection(){
    float xV = X-pX;
    float yV = Y-pY;
    pX = X;
    pY = Y;
    if (xV > 0 && yV > 0){
      m = 3*PI/2;
      n = 2*PI;
      return "NE";
    }
    if (xV < 0 && yV > 0){
      m = PI;
      n = 3*PI/2;
      return "NW";
    }
    if (xV < 0 && yV < 0){
      m = PI/2;
      n = PI;
      return "SW";
    }
    if (xV > 0 && yV < 0){
      m = 0;
      n = PI/2;
      return "SE";
    }
    if (xV == 0 && yV < 0){
      m = PI/4;
      n = 3*PI/4;
      return "S";
    }
    if (xV > 0 && yV == 0){
      m = 7*PI/4;
      n = 9*PI/4;
      return "E";
    }
    if (xV < 0 && yV == 0){
      m = 3*PI/4;
      n = 5*PI/4;
      return "W";
    }
    else{
      m = 5*PI/4;
      n = 7*PI/4;
      return "N";
    }
  }
}
