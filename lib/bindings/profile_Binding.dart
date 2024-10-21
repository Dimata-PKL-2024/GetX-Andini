import 'package:get/get.dart';

import '../controllers/profile_Controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}
