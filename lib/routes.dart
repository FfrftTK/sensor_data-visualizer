import 'package:get/get_navigation/src/routes/get_route.dart';

import 'pages/pages.dart';

final List<GetPage> getPages = [
  GetPage(
      name: AccelerometerPage.routeName, page: () => const AccelerometerPage()),
  GetPage(
      name: AccelerometerConfigPage.routeName,
      page: () => const AccelerometerConfigPage()),
];
