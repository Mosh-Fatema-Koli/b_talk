
import 'package:btalk/route/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => GetMaterialApp(
          theme: ThemeData(
           bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Colors.transparent)
            //fontFamily: GoogleFonts.lato().fontFamily,
          ),
          defaultTransition: Transition.cupertino,
          locale: const Locale('en', 'US'),
          getPages:  AppPages.routes,
        //  home: ChatDetailsPage(),
          initialRoute: Routes.splashScreen,
          debugShowCheckedModeBanner: false,
        ));
  }
}

//Office-in-charge 1237
//Driver 2068896
//Fleet Focal 2204002
//General Staff 1239
//Flutter SDK: 3.19.3

