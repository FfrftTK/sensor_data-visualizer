import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/all.dart';

import 'pages/pages.dart';
import 'routes.dart';

void main() {
  runApp(ProviderScope(child: App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: getPages,
      home: const AccelerometerPage(),
    );
  }
}
