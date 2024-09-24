import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeitnah_admin/ui/constants/app_colors/app_colors.dart';

import 'appointment_free_slot_widgets/priority_widget.dart';

class AppointmentFreeSlot extends StatelessWidget {
  const AppointmentFreeSlot({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          margin: EdgeInsets.only(left: size.width * 0.1),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          height: size.height * 0.75,
          width: size.width * 0.35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: AppColors.kcgreyFieldColor.withOpacity(0.5),
                    offset: const Offset(0, 0),
                    blurRadius: 3),
              ],
              color: AppColors.kcPrimaryWhite),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 8),
                  Text("Appointment Free Slot",
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            color: AppColors.kcPrimaryTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
                  const SizedBox(height: 24),
                  const AppointmentOptionWidget(
                    image: 'assets/icons/date.svg',
                    label: "Date",
                  ),
                  const AppointmentOptionWidget(
                    image: 'assets/icons/start_time.svg',
                    label: "Start Time",
                  ),
                  const AppointmentOptionWidget(
                    image: 'assets/icons/stop_time.svg',
                    label: "End Time",
                  ),
                  const AppointmentOptionWidget(
                    image: 'assets/icons/user.svg',
                    label: "Select Doctor (Optional)",
                  ),
                  // ~
                  const PriorityWidget(),
                  const SizedBox(height: 32),

                  GestureDetector(
                    onTap: () {
                      log(size.height.toString());
                      log(size.width.toString());
                    },
                    child: customButtom(
                        size: size,
                        color: AppColors.kcPrimaryColor,
                        buttonSize: size.width * 0.12,
                        label: "Update"),
                  )

                  // ~
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppointmentOptionWidget extends StatelessWidget {
  final String image;
  final String label;

  const AppointmentOptionWidget(
      {super.key, required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      // height: size.height * 0.06,
      height: 48,
      margin: const EdgeInsets.only(bottom: 24),
      width: size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.kcgreyFieldColor,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      // padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Center(
        child: ListTile(
          leading: SvgPicture.asset(image,
              height: 28, color: AppColors.kcPrimaryColor), // Image.asset(
          //   image,
          //   color: Colors.blueAccent,
          // ),
          title: Text(
            label,
            style: const TextStyle(
                color: AppColors.kcPrimaryTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
