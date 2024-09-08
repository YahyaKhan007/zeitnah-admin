import 'package:get/get.dart';

import '../../ui/utils/app_constants/app_constants.dart';

class ZeitnahAdminController extends GetxController {
  Rx<AuthScreenEnum> authScreen = Rx<AuthScreenEnum>(AuthScreenEnum.login);
  RxInt dashboardScreentIndex = RxInt(0);

  RxBool editProfile = RxBool(false);
  RxString selectedPage = RxString("Dashboard");
}
