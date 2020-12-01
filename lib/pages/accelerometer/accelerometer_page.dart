part of pages;

class AccelerometerPage extends HookWidget {
  const AccelerometerPage();

  static const routeName = '/accelerometer';

  @override
  Widget build(BuildContext context) {
    useProvider(accelerometerProvider.state);
    final controller = useProvider(accelerometerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Accelerometer'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.cloud_upload,
              color: controller.cloudColor,
            ),
            onPressed: () async {
              await controller.onCloudTapped();
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Get.toNamed(AccelerometerConfigPage.routeName),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(Get.width * 0.025),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
              height: double.infinity,
              constraints: BoxConstraints(
                maxWidth: Get.width * 0.8,
                maxHeight: Get.height * 0.5,
              ),
              child: LineChart(
                controller.currentAccelerationLineChartData,
                swapAnimationDuration: const Duration(milliseconds: 0),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Get.width * 0.02),
                border: Border.all(
                  color: Get.theme.highlightColor,
                ),
              ),
              constraints: BoxConstraints(
                  maxWidth: Get.width * 0.5, maxHeight: Get.height * 0.2),
              padding: EdgeInsets.all(Get.width * 0.02),
              margin: EdgeInsets.all(Get.width * 0.05),
              child: SingleChildScrollView(
                child: Column(
                  children: controller.lineBarDetails
                      .map(
                        (e) => Indicator(
                          description: e.description,
                          colors: e.colors,
                          size: Get.width * 0.05,
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                          padding: EdgeInsets.symmetric(
                              vertical: Get.height * 0.005),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            SizedBox(
              width: Get.width * 0.75,
              child: RaisedButton(
                onPressed: controller.updateOffset,
                child: const Text('Set current observation as offset'),
              ),
            ),
            SizedBox(
              width: Get.width * 0.75,
              child: RaisedButton(
                onPressed: controller.clearOffset,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.refresh),
                    const Text('  Clear offset'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    @required this.description,
    this.size,
    this.colors = const [Colors.transparent],
    this.isSquare = true,
    this.textStyle,
    this.padding,
    this.opacity,
  });

  final String description;
  final List<Color> colors;
  final double size;
  final bool isSquare;
  final TextStyle textStyle;
  final EdgeInsetsGeometry padding;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Padding(
        padding: padding,
        child: Row(
          children: [
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
                color: colors.first,
                gradient: colors.length > 2
                    ? LinearGradient(
                        colors: colors,
                      )
                    : null,
              ),
            ),
            SizedBox(width: size * 0.5),
            Text(
              description,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
