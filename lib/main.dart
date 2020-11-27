import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:state_notifier/state_notifier.dart';

void main() {
  runApp(ProviderScope(child: CounterApp()));
}

class Counter extends StateNotifier<int> {
  Counter() : super(0);

  void increment() => state++;

  @override
  void dispose() {
    super.dispose();
  }
}

final counterProvider = StateNotifierProvider.autoDispose((_) => Counter());

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: getPages,
      home: const SecondPage(),
    );
  }
}

class CounterPage extends HookWidget {
  const CounterPage();

  static const routeName = '/counter';

  @override
  Widget build(BuildContext context) {
    final state = useProvider(counterProvider.state);
    final counter = useProvider(counterProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('CounterApp')),
      body: Column(
        children: [
          Center(
            child: Text(state.toString()),
          ),
          RaisedButton(
            onPressed: () => Get.toNamed(SecondPage.routeName),
            child: const Text('to other page'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage();

  static const routeName = '/second';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('WTF'),
            RaisedButton(
              onPressed: () => Get.toNamed(CounterPage.routeName),
              child: const Text('to other page'),
            ),
          ],
        ),
      ),
    );
  }
}

final List<GetPage> getPages = [
  GetPage(name: CounterPage.routeName, page: () => const CounterPage()),
  GetPage(name: SecondPage.routeName, page: () => const SecondPage()),
];
