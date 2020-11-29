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

  List<LineBarDetail> getLineBarDetails();
}

@immutable
class LineBarDetail<T> {
  const LineBarDetail({
    @required this.identifier,
    @required this.descriptionConverter,
    this.colors = const [Color(0xffaabbcc)],
  });

  final T identifier;
  final String Function(T) descriptionConverter;
  final List<Color> colors;

  String get description => descriptionConverter(identifier);
}
