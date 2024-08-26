import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeitnah_admin/ui/constants/app_colors/app_colors.dart';
import 'package:zeitnah_admin/ui/screens/app_views.dart';

import 'ui/controller_bindings.dart';
import 'ui/utils/app_language/app_strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1300, 600),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return 
    
    GetMaterialApp(
      title: 'Zeitnah Admin',
      initialBinding: ControllerBinding(),
       translations: AppLanguage(),
              // locale: const Locale('de'),
      locale: const Locale('en_US'),
              // fallbackLocale: const Locale('de'),
              fallbackLocale: const Locale('en_US'),
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kcPrimaryColor),
        useMaterial3: true,
      ),
      home: const AuthScreenHome(),
    );});
  }
}

