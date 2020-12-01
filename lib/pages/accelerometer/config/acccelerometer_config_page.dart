part of pages;

class AccelerometerConfigPage extends HookWidget {
  const AccelerometerConfigPage();

  static const routeName = '${AccelerometerPage.routeName}/config';

  @override
  Widget build(BuildContext context) {
    useProvider(accelerometerProvider.state);
    final controller = useProvider(accelerometerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Accelerometer Config'),
        actions: [
          SizedBox(
            height: Get.width * 0.1,
            child: Switch(value: false, onChanged: print),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(Get.width * 0.025),
        alignment: Alignment.center,
        child: Center(),
      ),
    );
  }
}
