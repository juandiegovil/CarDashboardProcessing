class Car{
  TripComputer o1 = new TripComputer();
  FuelTank o2 = new FuelTank();
  FuelComputer o3 = new FuelComputer();
  void processInput(float RPM, float FuelLevel, float GearRatio, float X, float Y){
    o1.RPM = RPM;
    o1.gearRatio = GearRatio;
    o1.X = X;
    o1.Y = Y;
    o1.radius = carRadius;
    o2.fuelLevel = FuelLevel;
    o2.tankCapacity = carTankCapacity;
    o3.fuelConsumption = c1.o2.getConsumedFuel();
    o3.distanceTravelled = c1.o1.speed/3600;//cant call function twice
    o3.remainingFuel = c1.o2.getRemainingFuel();
  }
}
