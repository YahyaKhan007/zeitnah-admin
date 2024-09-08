 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants/app_colors/app_colors.dart';

Widget dashboardTopBar({required Size size, required BuildContext context}) {
    return Row(
      children: [
        dashboardTopBarOption(
            count: 125,
            image: 'assets/icons/appointment.png',
            label: 'Service Providers',
            size: size),
        16.w.horizontalSpace,
        dashboardTopBarOption(
            count: 80,
            image: 'assets/icons/globe.png',
            label: 'Active Users',
            size: size),
        16.w.horizontalSpace,
        dashboardTopBarOption(
            count: 115,
            image: 'assets/icons/appointment.png',
            label: 'Assigned Appointments',
            size: size),
        16.w.horizontalSpace,
        dashboardTopBarOption(
            count: 385,
            image: 'assets/icons/provider.png',
            label: 'Total Users',
            size: size),
      ],
    );
  }

  Widget dashboardTopBarOption(
      {required Size size,
      required String label,
      required int count,
      required String image}) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.kcSecondaryTextColor,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                count.toString(),
                style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.kcPrimaryTextColor,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
          Container(
            height: size.height * 0.05,
            width: size.width * 0.025,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.kcPrimaryColor,
            ),
            child: Center(
              child: Image.asset(image),
            ),
          )
        ],
      ),
    ));
  }