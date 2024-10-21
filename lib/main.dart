import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './routes/app_pages.dart';
import './pages/home_page.dart';

import 'controllers/users_Controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final userC = Get.put(UsersController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
      getPages: AppPages.pages,
    );
  }
}
