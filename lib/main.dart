import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'firebase_options.dart';

import '../src/config/app_colors.dart';
import '../src/config/app_routes.dart';
import '../src/config/session.dart';
import '../src/features/home/screens/home_screen.dart';
import '../src/features/intro/screens/intro_screen.dart';
import '../src/models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initializeDateFormatting('en_US');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: AppColor.bgScaffold,
        primaryColor: AppColor.primaryC,
        colorScheme: const ColorScheme.light(
          primary: AppColor.primaryC,
          secondary: AppColor.secondaryC,
        ),
      ),
      routes: {
        '/': (context) {
          return FutureBuilder(
            future: Session.getUser(),
            builder: (context, AsyncSnapshot<User> snapshot) {
              if (snapshot.data == null || snapshot.data!.id == null) {
                return Intro();
              } else {
                return Home();
              }
            },
          );
        },
        AppRoute.intro: (context) => Intro(),
        AppRoute.home: (context) => Home(),
        AppRoute.signin: (context) => Home(),
        AppRoute.detail: (context) => Home(),
        AppRoute.checkout: (context) => Home(),
        AppRoute.checkoutSuccess: (context) => Home(),
        AppRoute.detailBooking: (context) => Home(),
      },
      home: Scaffold(),
    );
  }
}
