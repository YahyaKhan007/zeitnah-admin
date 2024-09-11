import 'package:flutter/material.dart'; // import 'package:get/get.dart';
import 'package:zeitnah_admin/ui/constants/app_colors/app_colors.dart';
import 'package:zeitnah_admin/ui/constants/app_strings.dart/app_strings.dart';

// import '../../../../services/get_controllers_service/zeitnah_admin_controller.dart';
import 'widgets/build_table_data.dart';

class ServiceProvidersForAdminSide extends StatelessWidget {
  const ServiceProvidersForAdminSide({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // final adminController = Get.find<ZeitnahAdminController>();
    return Container(
      height: size.height * 0.8,
      width: size.width * 0.77,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(016),
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
      padding: const EdgeInsets.only(top: 24),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Service Providers",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.kcPrimaryTextColor,
                  fontSize: 18),
            ),
            const SizedBox(height: 16),
            buildLabels(),
            const SizedBox(height: 8),
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
                  return buildTabelData(
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
}
