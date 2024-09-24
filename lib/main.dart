import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:zeitnah_admin/ui/constants/app_colors/app_colors.dart';
import 'package:zeitnah_admin/ui/screens/service_provider/auth_screens/auth_screen_home.dart';

import 'firebase_options.dart';
import 'ui/controller_bindings.dart';
import 'ui/utils/app_language/app_strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your applicatyesion.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Zeitnah Admin',
      initialBinding: ControllerBinding(),
      translations: AppLanguage(),
      // locale: const Locale('de'),
      locale: const Locale('en_US'),
      // fallbackLocale: const Locale('de'),
      fallbackLocale: const Locale('en_US'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kcPrimaryColor),
        fontFamily: 'abel',
        useMaterial3: true,
      ),
      home: const AuthScreenHome(),
      // home: const AdminHome(),
    );
  }
}
