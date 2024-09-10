import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../services/get_controllers_service/zeitnah_admin_controller.dart';
import '../../../../constants/app_colors/app_colors.dart';

class ProviderHomeTopbarWidget extends StatelessWidget {
  const ProviderHomeTopbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final zeitnahControler = Get.find<ZeitnahAdminController>();

    return SizedBox(
      height: size.height * 0.13,
      child: Row(
        children: [
          SizedBox(
            width: size.width * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: size.width * 0.025,
                  backgroundImage:
                      const AssetImage('assets/images/profile_pic.png'),
                )
              ],
            ),
          ),
          Obx(
            () => SizedBox(
              width: size.width * 0.7,
              child: Padding(
                padding: const EdgeInsets.only(left: 40).w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "pages ",
                                style: TextStyle(
                                    color: AppColors.kcgreyFieldColor
                                        .withOpacity(0.5)),
                              ),
                              Text(
                                "/ ${zeitnahControler.selectedPage.value}",
                                style: const TextStyle(
                                  color: AppColors.kcPrimaryTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: false,
                          // visible: !zeitnahControler.selectedPage.value
                          //     .startsWith('Dash'),
                          child: Container(
                            height: size.height * 0.05,
                            width: size.width * 0.15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40.r),
                              color: AppColors.kcPrimaryWhite,
                            ),
                            alignment: Alignment.centerLeft,
                            // padding: EdgeInsets.only(
                            //     left: 8.w, right: 8.w, bottom: 16.h),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search,
                                      size: 16.r,
                                      color: AppColors.kcgreyFieldColor
                                          .withOpacity(0.6)),
                                  hintText: "Type here ...",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontSize: 10.sp,
                                      color: AppColors.kcgreyFieldColor
                                          .withOpacity(0.6))),
                            ),
                          ),
                        )
                      ],
                    ),
                    4.h.verticalSpace,
                    Text(
                      "Dashboard",
                      style: TextStyle(
                        color: AppColors.kcPrimaryTextColor,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
