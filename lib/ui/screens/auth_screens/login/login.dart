
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah_admin/ui/constants/app_colors/app_colors.dart';
import 'package:zeitnah_admin/ui/screens/app_views.dart';
import 'package:zeitnah_admin/ui/utils/app_constants/app_constants.dart';

import '../../../../services/get_controllers_service/zeitnah_admin_controller.dart';
import '../../../widgets/label_textfield_in_cloumn/label_textfield_in_cloumn.dart';

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
        decoration:  BoxDecoration(
          color: AppColors.kcWhite,
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
                  textStyle:  TextStyle(
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

              siginButton(),               24.h.verticalSpace,

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Divider(
                  color: AppColors.kcgreyFieldColor.withOpacity(0.3),
                ),
              ),               24.h.verticalSpace,

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
                    ),GestureDetector(onTap: (){
      
                      adminController.authScreen.value = AuthScreenEnum.register;
      
                    },child: Text(
                      "Sign up now",
                      style: TextStyle(
                          color: AppColors.kcPrimaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal),
                    ),)
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
          CupertinoButton(child: Text("Forgot Password",
                  style: TextStyle(
                      
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal),), onPressed: () {})
        ],
      ),
    );
  }

  Widget siginButton() {
    return GestureDetector(
      onTap: () {
        Get.to(()=> const AdminDashboardHome(),
        opaque: true,
        duration: const Duration(milliseconds: 400),

          transition: Transition.cupertino
        );
      },
      child: Container(
        padding:  EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
            color: AppColors.kcPrimaryColor,
            borderRadius: BorderRadius.circular(8.r)),
        width: double.maxFinite,
        child: Center(
          child: Text(
            "Sign in",
            style: TextStyle(
              color: AppColors.kcWhite,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
