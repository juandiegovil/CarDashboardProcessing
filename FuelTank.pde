class FuelTank{
  float tankCapacity = carTankCapacity;
  float fuelLevel;
  float previousLevel = 50;
  float consumedFuel;
  float getConsumedFuel(){
    consumedFuel = previousLevel - fuelLevel;
    previousLevel = fuelLevel;
    return consumedFuel;
  }
  float getRemainingFuel(){
    return fuelLevel;
  }
}
