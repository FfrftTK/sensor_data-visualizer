part of utils;

mixin FlChartUtils<T> {
  List<FlSpot> convertDataSetToFlSpots(
          List<T> dataSet, FlSpot Function(T data) converter) =>
      dataSet.map(converter).toList();

  LineChartBarData generateChartBarData(
    List<FlSpot> dataSet, {
    List<Color> colors,
  });

  LineChartData generateLineChartData(List<T> dataSet);
  List<LineChartBarData> generateChartBarsData(List<T> dataSet);
}
