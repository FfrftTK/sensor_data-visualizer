part of services;

enum Axis { x, y, z }

class AccelerometerService with FlChartUtilMixin<AccelerationData> {
  const AccelerometerService();

  static const _lineBarDetails = [
    LineBarDetail<Axis>(
        identifier: Axis.x,
        descriptionConverter: EnumToString.convertToString,
        colors: [Color(0xffeeaaaa)]),
    LineBarDetail<Axis>(
        identifier: Axis.y,
        descriptionConverter: EnumToString.convertToString,
        colors: [Color(0xffaaeeaa)]),
    LineBarDetail<Axis>(
        identifier: Axis.z,
        descriptionConverter: EnumToString.convertToString,
        colors: [Color(0xffaaaaee)]),
  ];

  /*
  * override functions
  * */
  @override
  List<LineBarDetail> getLineBarDetails() {
    return _lineBarDetails;
  }

  @override
  LineChartData generateLineChartData(List<AccelerationData> dataSet) {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff72719b),
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
          margin: 10,
          getTitles: (_) => '',
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff75729e),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          margin: Get.width * 0.05,
          reservedSize: Get.width * 0.05,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(
            color: Color(0xff4e4965),
            width: 4,
          ),
          left: BorderSide(
            color: Colors.transparent,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
//    minX: 0,
//    maxX: 14,
//    maxY: 5.5,
//    minY: 0,
      lineBarsData: generateChartBarsData(dataSet),
    );
  }

  @override
  List<LineChartBarData> generateChartBarsData(List<AccelerationData> dataSet) {
    return _lineBarDetails
        .map((e) => generateChartBarData(
              _generateFlSpotsByAxis(dataSet, e.identifier),
              colors: e.colors,
            ))
        .toList();
  }

  @override
  LineChartBarData generateChartBarData(List<FlSpot> dataSet,
      {List<Color> colors}) {
    return LineChartBarData(
      spots: dataSet,
      isCurved: false,
      colors: colors,
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
  }

  /**
   * private functions
   */

  // Convert stream accelerometer data to FlChart drawable
  List<FlSpot> _generateFlSpotsByAxis(
      List<AccelerationData> dataSet, Axis axis) {
    final spots = super.convertDataSetToFlSpots(
      dataSet,
      (AccelerationData data) =>
          _convertAccelerationDataToFlSpotByAxis(axis: axis, data: data),
    );
    return spots.isEmpty ? [FlSpot(0, 0)] : spots;
  }

  FlSpot _convertAccelerationDataToFlSpotByAxis({
    @required Axis axis,
    @required AccelerationData data,
  }) {
    final timestampAsSec = data.timestamp.millisecondsSinceEpoch.toDouble();
    switch (axis) {
      case Axis.x:
        return FlSpot(timestampAsSec, data.x);
      case Axis.y:
        return FlSpot(timestampAsSec, data.y);
      case Axis.z:
      default:
        return FlSpot(timestampAsSec, data.z);
    }
  }
}
