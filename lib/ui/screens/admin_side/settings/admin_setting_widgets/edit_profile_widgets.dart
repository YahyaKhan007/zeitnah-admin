import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../services/get_controllers_service/zeitnah_admin_controller.dart';
import '../../../../constants/app_colors/app_colors.dart';

class EditProfileWidget extends StatelessWidget {
  const EditProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final zeitnahControler = Get.find<ZeitnahAdminController>();

    return ListTile(
      title: Text(
        "Admin Panel",
        style: TextStyle(fontSize: 14.sp, color: AppColors.kcPrimaryTextColor),
      ),
      subtitle: Text(
        "alexarawles@gmail.com",
        style:
            TextStyle(fontSize: 12.sp, color: AppColors.kcSecondaryTextColor),
      ),
      trailing: GestureDetector(
        onTap: () {
          zeitnahControler.editProfile.value =
              !zeitnahControler.editProfile.value;
        },
        child: Obx(
          () => Container(
            height: 32.h,
            width: 64.w,
            decoration: BoxDecoration(
              color: zeitnahControler.editProfile.value
                  ? AppColors.kcPrimaryGreen
                  : AppColors.kcPrimaryColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: Text(
                zeitnahControler.editProfile.value ? "Update" : "Edit",
                style:
                    TextStyle(fontSize: 12.sp, color: AppColors.kcPrimaryWhite),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
