import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah_admin/ui/screens/app_views.dart';

import '../../constants/app_colors/app_colors.dart';

class AdminDashboardHome extends StatefulWidget {
  const AdminDashboardHome({super.key});

  @override
  State<AdminDashboardHome> createState() => _AdminDashboardHomeState();
}

class _AdminDashboardHomeState extends State<AdminDashboardHome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.kcPrimaryColor.withOpacity(0.05),
      body: SingleChildScrollView(
        child: Column(
          children: [
            topBar(size: size),
            Row(
              children: [
                const LeftSidePanel(),
                24.w.horizontalSpace,
                ServieProviders()
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget topBar({required Size size}) {
    return Row(
      children: [
        SizedBox(
          width: size.width * 0.2,
          child: Center(
            child: Text(
              "Admin Panel",
              style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      color: AppColors.kcPrimaryTextColor,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ),
        SizedBox(
          width: size.width * 0.7,
          child: Padding(
            padding: const EdgeInsets.only(left: 40).w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "pages ",
                      style: TextStyle(
                          color: AppColors.kcgreyFieldColor.withOpacity(0.5)),
                    ),
                    const Text(
                      "/ Dashboard",
                      style: TextStyle(
                        color: AppColors.kcPrimaryTextColor,
                      ),
                    ),
                  ],
                ),
                4.h.verticalSpace,
                 Text("Dashboard",style: TextStyle(color: AppColors.kcPrimaryTextColor, fontSize: 16.sp,),),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
