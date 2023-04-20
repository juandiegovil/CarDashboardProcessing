class FuelComputer{
  float fuelEconomy;
  float distanceTravelled;
  float fuelConsumption;
  float remainingFuel;
  float averageFuelEconomy;
  float [] fuelEconomyHistory = new float [0];
  float [] averageFuelEconomyHistory = new float [0];
  float [] fuelConsumptionHistory = new float [0];
  int fuelEconomyValuesCount;
  float range;
  float calculateFuelEconomy(){
    if (fuelConsumption > 0){
      fuelEconomy = distanceTravelled/fuelConsumption;
      fuelEconomyHistory = append(fuelEconomyHistory, fuelEconomy); 
      if (fuelEconomyValuesCount < 60)
        fuelEconomyValuesCount++;
      calculateAverageFuelEconomy();
      return fuelEconomy;
    }
    else
      return 0;
  }
  void calculateAverageFuelEconomy(){
    float addedFuelEconomy = 0;
    int j = fuelEconomyValuesCount-1;
    for (int i=fuelEconomyHistory.length-1; j>=0; i--, j--)
      addedFuelEconomy += fuelEconomyHistory[i];
    averageFuelEconomy = addedFuelEconomy/fuelEconomyValuesCount;
    averageFuelEconomyHistory = append(averageFuelEconomyHistory, averageFuelEconomy);
    calculateFuelConsumption();
    calculateRange();
  }
  void calculateFuelConsumption(){
    fuelConsumption = (1/averageFuelEconomy)*100;
    fuelConsumptionHistory = append(fuelConsumptionHistory, fuelConsumption);
  }
  void calculateRange(){
    range = averageFuelEconomy*remainingFuel;
  }
}
