import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/app_colors/app_colors.dart';

Widget buildLabels() {
  return Row(
    children: [
      Expanded(
          flex: 5,
          child: Text(
            "AUTHOR",
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.kcgreyFieldColor.withOpacity(0.5),
            ),
          )),
      Expanded(
          flex: 2,
          child: Text(
            "Phone Number",
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.kcgreyFieldColor.withOpacity(0.5),
            ),
          )),
      Expanded(
          flex: 1,
          child: Text(
            "Patients",
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.kcgreyFieldColor.withOpacity(0.5),
            ),
          )),
      Expanded(
          flex: 1,
          child: Text(
            "Registered",
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.kcgreyFieldColor.withOpacity(0.5),
            ),
          )),
      48.w.horizontalSpace,
    ],
  );
}

Widget buildTabelData(
    {required String photo,
    required String providerName,
    required String providerEmail,
    required String phoneNumber,
    required String totalPatients,
    required String registeredDate,
    required VoidCallback onEdit}) {
  return Row(
    children: [
      Expanded(
          flex: 5,
          child: Row(
            children: [
              SizedBox(
                height: 40.h,
                width: 48.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.asset(
                    photo,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              16.w.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    providerName,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.kcPrimaryTextColor,
                    ),
                  ),
                  Text(
                    providerEmail,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.kcgreyFieldColor.withOpacity(0.5),
                    ),
                  )
                ],
              )
            ],
          )),
      Expanded(
          flex: 2,
          child: Text(
            phoneNumber,
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.kcPrimaryTextColor,
            ),
          )),
      Expanded(
          flex: 1,
          child: Text(
            totalPatients,
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.kcPrimaryTextColor,
            ),
          )),
      Expanded(
          flex: 1,
          child: Text(
            registeredDate,
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.kcPrimaryTextColor,
            ),
          )),
      CupertinoButton(
          child: Text(
            "Edit",
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.kcgreyFieldColor.withOpacity(0.5),
            ),
          ),
          onPressed: () {})
    ],
  );
}
