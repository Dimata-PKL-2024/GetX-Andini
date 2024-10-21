import 'package:get/get.dart';

import '../controllers/add_Controller.dart';

class AddUserBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AddController());
  }
}
