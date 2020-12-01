import 'package:hooks_riverpod/all.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'states/states.dart';

final accelerometerProvider =
    StateNotifierProvider((_) => AccelerometerController());

final z = SharedPreferences.getInstance();
