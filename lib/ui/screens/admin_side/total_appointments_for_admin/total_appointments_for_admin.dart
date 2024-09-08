import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// import '../../../../services/get_controllers_service/zeitnah_admin_controller.dart';
import '../../../constants/app_colors/app_colors.dart';
import '../../../constants/app_strings.dart/app_strings.dart';
import 'appointment_widgets/build_table_daappointment_ta.dart';

class TotalAppointmentsForAdmin extends StatelessWidget {
  const TotalAppointmentsForAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // final adminController = Get.find<ZeitnahAdminController>();
    return Container(
      height: size.height * 0.8,
      width: size.width * 0.77,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(016.r),
        color: AppColors.kcPrimaryWhite,
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
              "Appointments",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.kcPrimaryTextColor,
                  fontSize: 18.sp),
            ),
            16.h.verticalSpace,
            buildAppointmentLabels(),
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
                  return buildAppointmentTabelData(
                      onEdit: () {},
                      phoneNumber: AppStrings.providerPhone[index],
                      registerTime: AppStrings.registeredTime[index],
                      providerEmail: AppStrings.providerEmails[index],
                      providerName: AppStrings.providerNames[index],
                      registeredDate: AppStrings.registereddates[index],
                      patientName: "Esthera Jackson");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
