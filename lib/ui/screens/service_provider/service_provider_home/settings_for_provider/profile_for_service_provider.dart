import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget_of_settings_for_provider/profile_sections.dart';

class ProfileForProvider extends StatelessWidget {
  const ProfileForProvider({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      // height: size.height,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileSectionWidget(),
          32.h.verticalSpace,
          const MyQrCodeSectionWidget()
        ],
      ),
    );
  }
}
