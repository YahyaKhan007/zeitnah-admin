import 'package:get/get.dart';

import '../services/get_controllers_service/zeitnah_admin_controller.dart';


class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ZeitnahAdminController());
  }
}