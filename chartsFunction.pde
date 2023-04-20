void displaygraphs(float [] values, int x, String chart){
    float [] values1 = new float [0];
    for(int i = values.length-1, j=1; i<39 && j<=39-values.length-1; j++)
      values1 = append(values1, 0);
    for(int k = values.length-1, l=1; k>=0 && l<=40; k--, l++)
      values1 = append(values1, values[k]);
    values1 = reverse(values1);
    BarChart barChart;
    barChart = new BarChart(this);
    barChart.setData(values1);
    barChart.setMinValue(0);
    barChart.setMaxValue(30);
    textFont(createFont("Serif", 5), 10);
    barChart.showValueAxis(true); barChart.setValueFormat("#"); barChart.showCategoryAxis(true);
    barChart.setBarColour(color(250, 100, 20, 200)); barChart.setBarGap(4);
    barChart.draw(x, 480, 330, 150);
    textSize(16);
    textAlign(CENTER);
    fill(#A59B9B);
    text(chart, x+165, 650);
  }
