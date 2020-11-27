import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:velocity_visualizer/providers.dart';

void main() {
  runApp(ProviderScope(child: CounterApp()));
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: getPages,
      home: const AccelerometerPage(),
    );
  }
}

class AccelerometerPage extends HookWidget {
  const AccelerometerPage();

  static const routeName = '/accelerometer';

  @override
  Widget build(BuildContext context) {
    final state = useProvider(accelerometerProvider.state);
    final controller = useProvider(accelerometerProvider)..initState();

    return Scaffold(
      appBar: AppBar(title: const Text('Accelerometer')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(state.toString()),
          ),
//          RaisedButton(
//            onPressed: () => Get.toNamed(SecondPage.routeName),
//            child: const Text('to other page'),
//          ),
        ],
      ),
    );
  }
}

final List<GetPage> getPages = [
  GetPage(
      name: AccelerometerPage.routeName, page: () => const AccelerometerPage()),
];
