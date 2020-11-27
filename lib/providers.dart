import 'package:hooks_riverpod/all.dart';

import 'controllers/accelerometer_state.dart';

final counterProvider = StateNotifierProvider.autoDispose((_) => Counter());
final accelerometerProvider =
    StateNotifierProvider((_) => AccelerometerController());

class Counter extends StateNotifier<int> {
  Counter() : super(0);
  void increment() => state++;
}
