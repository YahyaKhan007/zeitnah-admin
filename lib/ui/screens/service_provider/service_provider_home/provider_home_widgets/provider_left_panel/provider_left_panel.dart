import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah_admin/services/get_controllers_service/zeitnah_admin_controller.dart';
import 'package:zeitnah_admin/ui/constants/app_colors/app_colors.dart';

class ProviderLeftSidePanel extends StatelessWidget {
  final PageController adminPageController;

  const ProviderLeftSidePanel({super.key, required this.adminPageController});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final adminController = Get.find<ZeitnahAdminController>();

    return SizedBox(
      height: size.height * 0.955,
      width: size.width * 0.2,
      // color: AppColors.kcPrimaryColor.withOpacity(0.05),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const Text(
            "Praxis für Physiotherapie & Gesundheit - Eduard Stabel",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: AppColors.kcPrimaryTextColor),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Divider(),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 24),
            child: Column(
              children: [
                _buildDashboardOption(
                  image: 'assets/icons/home.png',
                  index: 0,
                  label: 'Dashboard',
                  onTap: () {
                    adminController.dashboardScreentIndex.value = 0;
                    adminController.selectedPage.value = "Dashboard";
                    adminPageController.animateToPage(
                      0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                _buildDashboardOption(
                  image: 'assets/icons/provider.png',
                  index: 1,
                  label: 'Users',
                  onTap: () {
                    adminController.dashboardScreentIndex.value = 1;
                    adminController.selectedPage.value = "Users";

                    adminPageController.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                _buildDashboardOption(
                  image: 'assets/icons/appointment.png',
                  index: 2,
                  label: 'Statistics',
                  onTap: () {
                    adminController.dashboardScreentIndex.value = 2;
                    adminController.selectedPage.value = "Statistics";

                    adminPageController.animateToPage(
                      2,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                Text(
                  "ACCOUNT SETTINGS",
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        letterSpacing: -0.5,
                        color: AppColors.kcPrimaryTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                const SizedBox(height: 8),
                _buildDashboardOption(
                  image: 'assets/icons/setting.png',
                  index: 4,
                  label: 'Settings',
                  onTap: () {
                    adminController.dashboardScreentIndex.value = 4;
                    adminController.selectedPage.value = "Settings";

                    adminPageController.animateToPage(
                      4,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ],
            ),
          )
        ],
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
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
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
                : AppColors.kcPrimaryWhite,
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor:
                    adminController.dashboardScreentIndex.value == index
                        ? AppColors.kcPrimaryWhite
                        : AppColors.kcPrimaryColor,
                child: Image.asset(
                  image,
                  color: adminController.dashboardScreentIndex.value != index
                      ? AppColors.kcPrimaryWhite
                      : AppColors.kcPrimaryColor,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                label,
                style: TextStyle(
                  color: adminController.dashboardScreentIndex.value == index
                      ? AppColors.kcPrimaryWhite
                      : AppColors.kcPrimaryTextColor,
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
