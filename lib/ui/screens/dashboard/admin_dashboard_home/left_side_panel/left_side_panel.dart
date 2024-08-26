import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah_admin/services/get_controllers_service/zeitnah_admin_controller.dart';
import 'package:zeitnah_admin/ui/constants/app_colors/app_colors.dart';

class LeftSidePanel extends StatelessWidget {
  const LeftSidePanel({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final adminController = Get.find<ZeitnahAdminController>();

    return SizedBox(
      height: size.height * 0.9,
      width: size.width * 0.2,
      // color: AppColors.kcPrimaryColor.withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 24).w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            16.h.verticalSpace,
            _buildDashboardOption(
              image: 'assets/icons/home.png',
              index: 0,
              label: 'Dashboard',
              onTap: () {
                adminController.dashboardScreentIndex.value = 0;
              },
            ),
            _buildDashboardOption(
              image: 'assets/icons/appointment.png',
              index: 1,
              label: 'Appointments',
              onTap: () {
                adminController.dashboardScreentIndex.value = 1;
              },
            ),
            _buildDashboardOption(
              image: 'assets/icons/provider.png',
              index: 2,
              label: 'Service Provider',
              onTap: () {
                adminController.dashboardScreentIndex.value = 2;
              },
            ),
            _buildDashboardOption(
              image: 'assets/icons/appointment.png',
              index: 3,
              label: 'Billing',
              onTap: () {
                adminController.dashboardScreentIndex.value = 3;
              },
            ),
            Text(
              "ACCOUNT SETTINGS",
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                    letterSpacing: -0.5,
                    color: AppColors.kcPrimaryTextColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.normal),
              ),
            ),
            8.h.verticalSpace,
            _buildDashboardOption(
              image: 'assets/icons/setting.png',
              index: 4,
              label: 'Settings',
              onTap: () {
                adminController.dashboardScreentIndex.value = 4;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardOption({
    required String image,
    required String label,
    required int index,
    required VoidCallback onTap,
  }) {
    final adminController = Get.find<ZeitnahAdminController>();
    return Obx(
      () => GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(bottom: 16.h),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: adminController.dashboardScreentIndex.value != index
                ? const <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 8,
                      blurStyle: BlurStyle.outer,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    )
                  ]
                : null,
            color: adminController.dashboardScreentIndex.value == index
                ? AppColors.kcPrimaryColor
                : AppColors.kcWhite,
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 16.r,
                backgroundColor:
                    adminController.dashboardScreentIndex.value == index
                        ? AppColors.kcWhite
                        : AppColors.kcPrimaryColor,
                child: Image.asset(
                  image,
                  color: adminController.dashboardScreentIndex.value != index
                      ? AppColors.kcWhite
                      : AppColors.kcPrimaryColor,
                ),
              ),
              16.w.horizontalSpace,
              Text(
                label,
                style: TextStyle(
                  color: adminController.dashboardScreentIndex.value == index
                      ? AppColors.kcWhite
                      : AppColors.kcPrimaryTextColor,
                  fontSize: 14.sp,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
