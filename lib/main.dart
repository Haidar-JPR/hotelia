import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelio/src/features/signIn/screens/sign_in_screen.dart';
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
                return const Intro();
              } else {
                return HomeScreen();
              }
            },
          );
        },
        AppRoute.intro: (context) => const Intro(),
        AppRoute.home: (context) => HomeScreen(),
        AppRoute.signin: (context) => SignInScreen(),
        AppRoute.detail: (context) => HomeScreen(),
        AppRoute.checkout: (context) => HomeScreen(),
        AppRoute.checkoutSuccess: (context) => HomeScreen(),
        AppRoute.detailBooking: (context) => HomeScreen(),
      },
    );
  }
}
