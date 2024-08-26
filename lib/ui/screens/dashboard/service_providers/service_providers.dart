import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeitnah_admin/ui/constants/app_colors/app_colors.dart';
import 'package:zeitnah_admin/ui/constants/app_strings.dart/app_strings.dart';

import '../../../../services/get_controllers_service/zeitnah_admin_controller.dart';

class ServieProviders extends StatelessWidget {
  const ServieProviders({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final adminController = Get.find<ZeitnahAdminController>();
    return Container(
      height: size.height * 0.8,
      width: size.width * 0.77,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.kcWhite,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 8,
            blurStyle: BlurStyle.outer,
            offset: const Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      padding: EdgeInsets.only(top: 24.h),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24).w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Service Providers",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.kcPrimaryTextColor,
                  fontSize: 18.sp),
            ),
            16.h.verticalSpace,
            _buildLabels(),
            8.h.verticalSpace,
            Expanded(
              child: ListView.separated(
                itemCount: AppStrings.providerPhotos.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) {
                  return Divider(
                    color: AppColors.kcgreyFieldColor.withOpacity(0.5),
                  );
                },
                itemBuilder: (context, index) {
                  return _buildTabelData(
                      onEdit: () {},
                      phoneNumber: AppStrings.providerPhone[index],
                      photo: AppStrings.providerPhotos[index],
                      providerEmail: AppStrings.providerEmails[index],
                      providerName: AppStrings.providerNames[index],
                      registeredDate: AppStrings.registereddates[index],
                      totalPatients:
                          AppStrings.totalPatients[index].toString());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabels() {
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

  Widget _buildTabelData(
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
                  height: 40.h, width: 48.w,
                  child: ClipRRect(
                     borderRadius: BorderRadius.circular(8.r),
                    child: Image.asset(photo, fit: BoxFit.cover,),
                  
                    
                  
                  ),
                ),
                16.w.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,children: [Text(
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
            )],)
              ],
            )),
        Expanded(
            flex: 2,
            child: Text(
              phoneNumber,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                                color: AppColors.                               kcPrimaryTextColor,


              ),
            )),
        Expanded(
            flex: 1,
            child: Text(
              totalPatients,
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.   kcPrimaryTextColor,
              ),
            )),
        Expanded(
            flex: 1,
            child: Text(
              registeredDate,
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.   kcPrimaryTextColor,
              ),
            )),
        CupertinoButton(
            child: Text(
              "Edit",
              style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors  . kcgreyFieldColor.withOpacity(0.5),),
            ),
            onPressed: () {})
      ],
    );
  }
}
