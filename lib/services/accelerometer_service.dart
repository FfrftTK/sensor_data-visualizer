part of services;

enum Axis { x, y, z }

class AccelerometerService with FlChartUtils<AccelerationData> {
  const AccelerometerService();

  static const _axisColorMap = {
    Axis.x: [Color(0xffeeaaaa)],
    Axis.y: [Color(0xffaaeeaa)],
    Axis.z: [Color(0xffaaaaee)],
  };

  // Convert stream accelerometer data to FlChart drawable
  List<FlSpot> _generateFlSpotsByAxis(
      List<AccelerationData> dataSet, Axis axis) {
    return super.convertDataSetToFlSpots(
      dataSet,
      (AccelerationData data) =>
          _convertAccelerationDataToFlSpotByAxis(axis: axis, data: data),
    );
  }

  FlSpot _convertAccelerationDataToFlSpotByAxis({
    @required Axis axis,
    @required AccelerationData data,
  }) {
    final timestampAsSec = data.timestamp.millisecondsSinceEpoch.toDouble();
    switch (axis) {
      case Axis.x:
        return FlSpot(timestampAsSec, data.event.x);
      case Axis.y:
        return FlSpot(timestampAsSec, data.event.y);
      case Axis.z:
      default:
        return FlSpot(timestampAsSec, data.event.z);
    }
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
//      bottomTitles: SideTitles(
//        showTitles: true,
//        reservedSize: 22,
//        getTextStyles: (value) => const TextStyle(
//          color: Color(0xff72719b),
//          fontWeight: FontWeight.bold,
//          fontSize: 16,
//        ),
//        margin: 10,
//        getTitles: (value) {
//          switch (value.toInt()) {
//            case 2:
//              return 'SEPT';
//            case 7:
//              return 'OCT';
//            case 12:
//              return 'DEC';
//          }
//          return '';
//        },
//      ),
//      leftTitles: SideTitles(
//        showTitles: true,
//        getTextStyles: (value) => const TextStyle(
//          color: Color(0xff75729e),
//          fontWeight: FontWeight.bold,
//          fontSize: 14,
//        ),
//        getTitles: (value) {
//          switch (value.toInt()) {
//            case 1:
//              return '1m';
//            case 2:
//              return '2m';
//            case 3:
//              return '3m';
//            case 4:
//              return '5m';
//          }
//          return '';
//        },
//        margin: 8,
//        reservedSize: 30,
//      ),
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
    return Axis.values
        .map((e) => generateChartBarData(
              _generateFlSpotsByAxis(dataSet, e),
              colors: _axisColorMap[e],
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
}
