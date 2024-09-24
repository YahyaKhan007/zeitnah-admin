import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah_admin/ui/constants/app_colors/app_colors.dart';

import '../../../../../services/get_controllers_service/zeitnah_admin_controller.dart';
import '../../../../utils/app_constants/app_constants.dart';
import '../../../../widgets/label_textfield_in_cloumn/label_textfield_in_cloumn.dart';

class RegisterationScreen extends StatelessWidget {
  RegisterationScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController streetContoller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final adminController = Get.find<ZeitnahAdminController>();
    return Container(
      height: size.height,
      width: size.width * 0.33,
      decoration: BoxDecoration(
        color: AppColors.kcPrimaryWhite,
        borderRadius: BorderRadius.circular(0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              Center(child: Image.asset("assets/icons/app_icon.png")),
              Text(
                'Register now',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      color: AppColors.kcPrimaryTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 16),
              labeltextFieldColumn(
                  label: 'Service Provider Name',
                  hintText: 'Name',
                  controller: nameController),
              labeltextFieldColumn(
                  label: 'Email',
                  hintText: 'Email',
                  controller: emailController),
              labeltextFieldColumn(
                  label: 'Password',
                  hintText: 'Password',
                  controller: passwordController,
                  trailigIcon: Icons.remove_red_eye),
              labeltextFieldColumn(
                  label: 'Confirm Password',
                  hintText: 'password',
                  controller: confirmPassword,
                  trailigIcon: Icons.remove_red_eye),
              labeltextFieldColumn(
                  label: 'Street',
                  hintText: 'Street',
                  controller: streetContoller),
              labeltextFieldColumn(
                  label: 'City', hintText: 'City', controller: cityController),
              labeltextFieldColumn(
                  label: 'Zip Code',
                  hintText: 'Zipcode',
                  controller: zipCodeController),
              const SizedBox(height: 16),
              rememberMeRow(),
              const SizedBox(height: 24),
              sigupButton(),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Divider(
                  color: AppColors.kcgreyFieldColor.withOpacity(0.3),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Don't have an account?  ",
                      style: TextStyle(
                          color: AppColors.kcPrimaryTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                    GestureDetector(
                      onTap: () {
                        adminController.authScreen.value = AuthScreenEnum.login;
                      },
                      child: const Text(
                        "Sign in now",
                        style: TextStyle(
                            color: AppColors.kcPrimaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget rememberMeRow() {
    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Switch.adaptive(
                  activeTrackColor: AppColors.kcPrimaryColor,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor:
                      AppColors.kcgreyFieldColor.withOpacity(0.4),
                  value: false,
                  onChanged: (val) {
                    // controller.isPriorityFunction.value = val;
                  },
                ),
                const Text(
                  "Remember me",
                  style: TextStyle(
                      color: AppColors.kcPrimaryTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
          ),
          CupertinoButton(
              child: const Text(
                "Forgot Password",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              ),
              onPressed: () {})
        ],
      ),
    );
  }

  Widget sigupButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            color: AppColors.kcPrimaryColor,
            borderRadius: BorderRadius.circular(8)),
        width: double.maxFinite,
        child: const Center(
          child: Text(
            "Sign up",
            style: TextStyle(
              color: AppColors.kcPrimaryWhite,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
