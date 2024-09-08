import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zeitnah_admin/ui/constants/app_colors/app_colors.dart';
import 'widgets/dashboard_top_bar.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          dashboardTopBar(size: size, context: context),
          16.h.verticalSpace,
          dashboardGraphs(context: context, size: size)
        ],
      ),
    );
  }

  Widget dashboardGraphs({
    required Size size,
    required BuildContext context,
  }) {
    return Row(
      children: [
        graphContainer1(graphNo: 1, size: size),
        24.w.horizontalSpace,
        graphContainer1(graphNo: 2, size: size),
      ],
    );
  }

  Widget graphContainer1({required Size size, required int graphNo}) {
    return Expanded(
      flex: graphNo == 1 ? 5 : 7,
      child: Container(
        height: size.height * 0.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: graphNo == 1
            ? graph1Data(size: size, activeUsers: 2000)
            : graph2Data(),
      ),
    );
  }

  Widget graph1Data({required Size size, required int activeUsers}) {
    return Padding(
      padding: const EdgeInsets.all(16).h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 26, 1, 61),
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
          ),
          16.h.verticalSpace,
          Text(
            "Active Users",
            style:
                TextStyle(fontSize: 12.sp, color: AppColors.kcPrimaryTextColor),
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: '(+23) ',
                    style: TextStyle(
                      color: Colors.green.withOpacity(0.5),
                      fontSize: 10.sp,
                    )),
                TextSpan(
                  text: 'than Last Week',
                  style: TextStyle(
                    color: AppColors.kcSecondaryTextColor.withOpacity(0.5),
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ),
          8.h.verticalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  height: 24.h,
                  width: 24.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      color: AppColors.kcPrimaryColor),
                  child: Image.asset('assets/icons/provider.png'),
                ),
                title: Text(
                  'Users',
                  style: TextStyle(
                      color: AppColors.kcgreyFieldColor.withOpacity(0.5),
                      fontSize: 10.sp),
                ),
              ),
              Text(
                activeUsers.toString(),
                style: TextStyle(color: Colors.black, fontSize: 12.sp),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget graph2Data() {
    return Padding(
      padding: const EdgeInsets.all(16).h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Usage Stats",
            style:
                TextStyle(fontSize: 12.sp, color: AppColors.kcPrimaryTextColor),
          ),
          8.h.verticalSpace,
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: '(+5) more ',
                    style: TextStyle(
                      color: Colors.green.withOpacity(0.5),
                      fontSize: 10.sp,
                    )),
                TextSpan(
                  text: 'in 2021',
                  style: TextStyle(
                    color: AppColors.kcSecondaryTextColor.withOpacity(0.5),
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
