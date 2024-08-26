import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeitnah_admin/ui/utils/app_constants/app_constants.dart';

import '../../../../services/get_controllers_service/zeitnah_admin_controller.dart';
import '../../../constants/app_colors/app_colors.dart';
import '../../app_views.dart';

class AuthScreenHome extends StatefulWidget {
  const AuthScreenHome({super.key});

  @override
  State<AuthScreenHome> createState() => _AuthScreenHomeState();
}

class _AuthScreenHomeState extends State<AuthScreenHome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final adminController = Get.find<ZeitnahAdminController>();
    return Scaffold(
        body: Stack(
      children: [
        Container(
          alignment: adminController.authScreen.value == AuthScreenEnum.login
              ? Alignment.centerLeft
              : Alignment.center,
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(color: AppColors.kcPrimaryColor),
        ),
        Obx(
     ()=>  AnimatedContainer(
              duration: const Duration(seconds: 1),
              height: size.height,
              // width: size.width * 0.33,
              alignment:adminController.authScreen.value == AuthScreenEnum.login
                      ?Alignment.centerLeft : Alignment.center,
              decoration: const BoxDecoration(color: AppColors.kcPrimaryColor),
              child: SizedBox(
                  height: size.height,
                  width: size.width * 0.33,
                  child: adminController.authScreen.value == AuthScreenEnum.login
                      ?  LoginScreen()
                      :  Center(child: RegisterationScreen()))),
        ),
      ],
    ));
  }
}
