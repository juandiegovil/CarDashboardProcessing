class SensorDataProvider{
  String filePath;
  Table dataTable;
  TableRow row;
  int currentIndex = 0;
  void Initialize(){
    currentIndex = 0;
    filePath = type;
    dataTable = loadTable(filePath, "header");
    row = dataTable.getRow(currentIndex);
  }
  void readNext(){
    currentIndex++;
    row = dataTable.getRow(currentIndex);
  }
  int readRPM(){
    return row.getInt("RPM");
  }
  float readFuelLevel(){
    return row.getFloat("Fuel Level (liter)");
  }
  float readRatio(){
    return row.getFloat("Gear Ratio");
  }
  float readX(){
    return row.getFloat("X");
  }
  float readY(){
    return row.getFloat("Y");
  }
}
