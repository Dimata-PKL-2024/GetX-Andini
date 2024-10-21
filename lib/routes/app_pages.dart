import 'package:get/get.dart';

import './route_name.dart';

import '../bindings/profile_Binding.dart';
import '../bindings/add_Binding.dart';
import '../pages/home_page.dart';
import '../pages/profile_page.dart';
import '../pages/add_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: RouteName.home,
      page: () => HomePage(),
    ),
    GetPage(
      name: RouteName.profile,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: RouteName.add,
      page: () => AddPage(),
      binding: AddUserBinding(),
    ),
  ];
}
