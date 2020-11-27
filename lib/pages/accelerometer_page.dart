part of pages;

class AccelerometerPage extends HookWidget {
  const AccelerometerPage();

  static const routeName = '/accelerometer';

  @override
  Widget build(BuildContext context) {
    final state = useProvider(accelerometerProvider.state);
    final controller = useProvider(accelerometerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Accelerometer')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(state.toString()),
          ),
        ],
      ),
    );
  }
}
