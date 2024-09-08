import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zeitnah_admin/ui/screens/admin_side/admin_home/admin_right_side_panel/admin_right_side_panel.dart';
import 'package:zeitnah_admin/ui/screens/app_views.dart';

import '../../../constants/app_colors/app_colors.dart';
import 'widgets/admin_top_bar.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  PageController adminPageController = PageController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.kcPrimaryColor.withOpacity(0.05),
      body: SingleChildScrollView(
        child: Column(
          children: [
            16.h.verticalSpace,
            topBar(size: size, context: context),
            Row(
              children: [
                AdminLeftSidePanel(
                  adminPageController: adminPageController,
                ),
                24.w.horizontalSpace,
                AdminRightSidePanel(
                  adminPageController: adminPageController,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
