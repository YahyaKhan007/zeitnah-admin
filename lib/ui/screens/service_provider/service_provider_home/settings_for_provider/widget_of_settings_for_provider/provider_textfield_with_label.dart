import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeitnah_admin/services/get_controllers_service/zeitnah_admin_controller.dart';
import 'package:zeitnah_admin/ui/constants/app_colors/app_colors.dart';

class ProviderTextfieldWithLabelWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool editable;
  final bool? isPassword;
  final String hintText;

  const ProviderTextfieldWithLabelWidget(
      {super.key,
      required this.label,
      required this.controller,
      required this.editable,
      this.isPassword,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    final zeitnahControler = Get.find<ZeitnahAdminController>();
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style:
              TextStyle(fontSize: 12.sp, color: AppColors.kcPrimaryTextColor),
        ),
        8.h.verticalSpace,
        Obx(
          () => Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            height: 40.h,
            width: size.width * 0.25,
            decoration: BoxDecoration(
              color: AppColors.kcgreyFieldColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: TextFormField(
              enabled: zeitnahControler.editProfile.value,
              style: TextStyle(
                color: AppColors.kcgreyFieldColor,
                fontSize: 12.sp,
              ),
              controller: controller,
              obscureText: isPassword != null ? true : false,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: isPassword == null ? hintText : '********',
                hintStyle: TextStyle(
                  color: AppColors.kcgreyFieldColor.withOpacity(0.5),
                  fontSize: 12.sp,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
