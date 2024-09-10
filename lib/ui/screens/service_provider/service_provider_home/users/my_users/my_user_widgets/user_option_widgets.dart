import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../../services/get_controllers_service/zeitnah_admin_controller.dart';
import '../../../../../../constants/app_colors/app_colors.dart';

class UserPageOptionWidget extends StatelessWidget {
  final PageController userPageController;
  const UserPageOptionWidget({super.key, required this.userPageController});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = Get.find<ZeitnahAdminController>();
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        customOptionContainerForUser(
          controller: controller,
          image: 'assets/icons/my_user.svg',
          label: "My Users",
          size: size,
          index: 0,
          show: false,
          onTap: () {
            userPageController.animateToPage(0,
                duration: const Duration(milliseconds: 200),
                curve: Curves.linear);
            controller.providerUserTab.value = 0;
          },
        ),
        16.w.horizontalSpace,
        customOptionContainerForUser(
            controller: controller,
            label: "User Requests",
            size: size,
            show: true,
            image: 'assets/icons/add_user.svg',
            onTap: () {
              userPageController.animateToPage(1,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.linear);
              controller.providerUserTab.value = 1;
            },
            index: 1)
      ],
    );
  }

  Widget customOptionContainerForUser(
      {required ZeitnahAdminController controller,
      required Size size,
      required String label,
      required bool show,
      required String image,
      required VoidCallback onTap,
      required int index}) {
    return Obx(
      () => GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40.h,
          width: size.width * 0.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: controller.providerUserTab.value == index
                ? AppColors.kcPrimaryColor
                : AppColors.kcPrimaryWhite,
            boxShadow: [
              BoxShadow(
                  color: AppColors.kcgreyFieldColor.withOpacity(0.5),
                  blurRadius: 3),
            ],
          ),
          child: Center(
            child: ListTile(
              contentPadding: EdgeInsets.only(left: 8.w, right: 2.w),
              leading: Container(
                height: 24.h,
                width: 24.w,
                decoration: BoxDecoration(
                  color: controller.providerUserTab.value == index
                      ? AppColors.kcPrimaryWhite
                      : AppColors.kcPrimaryColor,
                  borderRadius: BorderRadius.circular(
                    8.r,
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    image,
                    color: controller.providerUserTab.value == index
                        ? AppColors.kcPrimaryColor
                        : AppColors.kcPrimaryWhite,
                    height: size.height * 0.015,
                  ),
                ),
              ),
              title: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  label,
                  style: TextStyle(
                      fontSize: 10.sp,
                      color: controller.providerUserTab.value == index
                          ? AppColors.kcPrimaryWhite
                          : AppColors.kcPrimaryTextColor,
                      fontWeight: FontWeight.normal),
                ),
              ),
              trailing: Visibility(
                visible: show,
                child: CircleAvatar(
                  radius: 14.r,
                  backgroundColor: AppColors.kcPrimaryColor,
                  child: Text(
                    "+2",
                    style: TextStyle(
                        color: AppColors.kcPrimaryWhite, fontSize: 10.sp),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
