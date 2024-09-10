import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/app_colors/app_colors.dart';

Widget buildBillingLabels() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
          flex: 3,
          child: Text(
            "Users",
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.kcgreyFieldColor.withOpacity(0.5),
            ),
          )),
      Expanded(
          flex: 1,
          child: Center(
            child: Text(
              "Amount",
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.kcgreyFieldColor.withOpacity(0.5),
              ),
            ),
          )),
      Expanded(
          flex: 1,
          child: Center(
            child: Text(
              "Time",
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.kcgreyFieldColor.withOpacity(0.5),
              ),
            ),
          )),
      Expanded(
          flex: 1,
          child: Center(
            child: Text(
              "Date",
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.kcgreyFieldColor.withOpacity(0.5),
              ),
            ),
          )),
      48.w.horizontalSpace,
    ],
  );
}

Widget buildBillingTabelData(
    {required String registerTime,
    required String providerName,
    required String providerEmail,
    required String amount,
    required String patientName,
    required String registeredDate,
    required VoidCallback onEdit}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                patientName,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.kcPrimaryTextColor,
                ),
              ),
              Text(
                providerEmail,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.kcgreyFieldColor.withOpacity(0.5),
                ),
              )
            ],
          )),
      Expanded(
          flex: 1,
          child: Column(
            children: [
              Container(
                height: 24.h,
                width: 64.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: AppColors.kcPrimaryGreen),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    // "\$$amount",
                    "\$512",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.kcPrimaryWhite,
                    ),
                  ),
                ),
              ),
            ],
          )),
      Expanded(
          flex: 1,
          child: Center(
            child: Text(
              registerTime,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.kcPrimaryTextColor,
              ),
            ),
          )),
      Expanded(
          flex: 1,
          child: Center(
            child: Text(
              registeredDate,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.kcPrimaryTextColor,
              ),
            ),
          )),
      CupertinoButton(
          child: Text(
            "Edit",
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.kcgreyFieldColor.withOpacity(0.5),
            ),
          ),
          onPressed: () {})
    ],
  );
}
