import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../services/get_controllers_service/zeitnah_admin_controller.dart';
import '../../../../../constants/app_colors/app_colors.dart';
import 'provider_textfield_with_label.dart';

class ProfileSectionWidget extends StatelessWidget {
  ProfileSectionWidget({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.45,
      width: size.width * 0.65,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.kcPrimaryWhite),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Profile",
                style: TextStyle(
                    color: AppColors.kcPrimaryTextColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
              8.h.verticalSpace,
              profileRowWidget(size: size),
              24.h.verticalSpace,
              Wrap(
                spacing: 32,
                runSpacing: 16,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.start,
                verticalDirection: VerticalDirection.down,
                clipBehavior: Clip.none,
                children: [
                  ProviderTextfieldWithLabelWidget(
                    controller: nameController,
                    editable: false,
                    hintText: 'Azeem Khalid',
                    label: 'Name',
                    isPassword: null,
                  ),
                  ProviderTextfieldWithLabelWidget(
                    controller: addressController,
                    editable: false,
                    hintText: '',
                    label: 'Address',
                    isPassword: null,
                  ),
                  ProviderTextfieldWithLabelWidget(
                    controller: emailController,
                    editable: false,
                    hintText: 'random.person@gmail.com',
                    label: 'Email',
                    isPassword: null,
                  ),
                  ProviderTextfieldWithLabelWidget(
                    controller: passwordController,
                    editable: false,
                    hintText: '11223344',
                    label: 'Password',
                    isPassword: true,
                  ),
                  ProviderTextfieldWithLabelWidget(
                    controller: phoneNumberController,
                    editable: false,
                    hintText: '+923121234567',
                    label: 'Phone Number',
                    isPassword: null,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileRowWidget({required Size size}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: size.height * 0.04,
              backgroundImage:
                  const AssetImage('assets/images/profile_pic.png'),
            ),
            16.w.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Bilal Hospital",
                  style: TextStyle(
                      fontSize: 14.sp, color: AppColors.kcPrimaryTextColor),
                ),
                Text(
                  "alexarawles@gmail.com",
                  style: TextStyle(
                      fontSize: 14.sp, color: AppColors.kcgreyFieldColor),
                )
              ],
            )
          ],
        ),
        GetBuilder<ZeitnahAdminController>(
            // init: ,
            init: ZeitnahAdminController(),
            builder: (zeitnaControler) {
              return GestureDetector(
                onTap: () {
                  log("message");
                  zeitnaControler.editProfile.value =
                      !zeitnaControler.editProfile.value;
                },
                child: Obx(
                  () => Container(
                    height: size.height * 0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: zeitnaControler.editProfile.value
                          ? AppColors.kcPrimaryGreen
                          : AppColors.kcPrimaryColor,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: Center(
                      child: Text(
                        zeitnaControler.editProfile.value ? "Update" : "Edit",
                        style: TextStyle(
                            fontSize: 14.sp, color: AppColors.kcPrimaryWhite),
                      ),
                    ),
                  ),
                ),
              );
            })
      ],
    );
  }
}

class MyQrCodeSectionWidget extends StatelessWidget {
  const MyQrCodeSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.3,
      width: size.width * 0.25,
      padding: const EdgeInsets.all(16).r,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.kcPrimaryWhite),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My Qr Code",
            style: TextStyle(
              fontSize: 20.sp,
              color: AppColors.kcPrimaryTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          16.h.verticalSpace,
          Center(
            child: SvgPicture.asset(
              'assets/images/my_qr_code.svg',
              height: size.height * 0.2,
            ),
          )
        ],
      ),
    );
  }
}
