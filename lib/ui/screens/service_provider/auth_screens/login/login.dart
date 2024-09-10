import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah_admin/ui/constants/app_colors/app_colors.dart';
import 'package:zeitnah_admin/ui/screens/admin_side/admin_home/admin_home.dart';
import 'package:zeitnah_admin/ui/screens/service_provider/service_provider_home/service_provider_home.dart';
import 'package:zeitnah_admin/ui/utils/app_constants/app_constants.dart';

import '../../../../../services/get_controllers_service/zeitnah_admin_controller.dart';
import '../../../../widgets/label_textfield_in_cloumn/label_textfield_in_cloumn.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final adminController = Get.find<ZeitnahAdminController>();

    return Container(
      height: size.height,
      width: size.width * 0.33,
      decoration: BoxDecoration(
        color: AppColors.kcPrimaryWhite,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Center(child: Image.asset("assets/icons/app_icon.png")),
            Text(
              'Welcome back!',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: AppColors.kcPrimaryTextColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            labeltextFieldColumn(
                label: 'Login',
                hintText: 'Email or phone number',
                controller: emailController),
            labeltextFieldColumn(
                label: 'Password',
                hintText: 'Enter password',
                controller: passwordController,
                trailigIcon: Icons.remove_red_eye),
            16.h.verticalSpace,
            rememberMeRow(),
            16.h.verticalSpace,
            siginButton(context),
            24.h.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Divider(
                color: AppColors.kcgreyFieldColor.withOpacity(0.3),
              ),
            ),
            24.h.verticalSpace,
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Don't have an account?  ",
                    style: TextStyle(
                        color: AppColors.kcPrimaryTextColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal),
                  ),
                  GestureDetector(
                    onTap: () {
                      adminController.authScreen.value =
                          AuthScreenEnum.register;
                    },
                    child: Text(
                      "Sign up now",
                      style: TextStyle(
                          color: AppColors.kcPrimaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget rememberMeRow() {
    return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Text(
                  "Remember me",
                  style: TextStyle(
                      color: AppColors.kcPrimaryTextColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
          ),
          CupertinoButton(
              child: Text(
                "Forgot Password",
                style:
                    TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal),
              ),
              onPressed: () {})
        ],
      ),
    );
  }

  Widget siginButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showRoleDialog(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
            color: AppColors.kcPrimaryColor,
            borderRadius: BorderRadius.circular(8.r)),
        width: double.maxFinite,
        child: Center(
          child: Text(
            "Sign in",
            style: TextStyle(
              color: AppColors.kcPrimaryWhite,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  showRoleDialog(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return showDialog(
        context: context,
        builder: (context) {
          return Material(
            type: MaterialType.transparency,
            animationDuration: const Duration(seconds: 1),
            child: Center(
              child: Container(
                width: size.width * 0.2,
                padding: EdgeInsets.symmetric(vertical: size.height * 0.06),
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: AppColors.kcPrimaryWhite),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Specify your role",
                        style: GoogleFonts.odorMeanChey(
                            textStyle: TextStyle(
                                fontSize: 30.sp, color: Colors.black)),
                      ),
                    ),
                    32.h.verticalSpace,
                    roleSelectButton(
                        role: 'service_provider', label: 'Service Provider'),
                    16.h.verticalSpace,
                    roleSelectButton(role: 'admin', label: 'Admin')
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget roleSelectButton({required String role, required String label}) {
    return TextButton(
        onPressed: () {
          switch (role) {
            case 'service_provider':
              Get.to(() => const ServiceProviderHome());
              break;

            case 'admin':
              Get.to(() => const AdminHome());

              break;
          }
        },

        // onPressed: () {
        //   switch (role) {
        //     case 'service_provider':
        //       Get.to(() => const ServiceProviderHome());
        //       break;
        //
        //     case 'admin':
        //       Get.to(() => const AdminHome());
        //       break;
        //   }
        // },
        child: Text(
          label,
          style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.kcgreyFieldColor,
              fontWeight: FontWeight.bold),
        ));
  }
}
