
import '../view/page/auth/login.dart';
import '../view/page/auth/reg.dart';
import '../view/page/intro/intro.dart';
import '../view/page/splash/splash.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [

    GetPage(
      name: Routes.splashScreen,
      page: (() => SplashPage()),
    ),

    GetPage(
      name: Routes.introScreen,
      page: (() => IntroPage()),
    ),

    GetPage(
      name: Routes.loginScreen,
      page: (() => LogINPage()),
    ),

    GetPage(
      name: Routes.regScreen,
      page: (() => RegistrationPage()),
  ),
  //
  //   GetPage(
  //     name: Routes.homeScreen,
  //     page: (() =>  HomePage()),
  //     ),
  //   GetPage(
  //     name: Routes.profileScreen,
  //     page: (() =>  ProfilePage()),
  //   ),
  //   GetPage(
  //     name: Routes.addTravelReqScreen,
  //     page: (() =>  AddRequestPage()),
  //   ),
  //   GetPage(
  //     name: Routes.addSof,
  //     page: (() =>  SourceOfFundPage()),
  //   ),
  //
  //   GetPage(
  //     name: Routes.checkListScreen,
  //     page: (() =>  CheckListPage()),
  //   ),
  //   GetPage(
  //     name: Routes.myRequestScreen,
  //     page: (() =>  MyRequestListPage()),
  //   ),
  //   GetPage(
  //     name: Routes.fuelScreen,
  //     page: (() =>  FuelPage()),
  //   ),
  //   GetPage(
  //     name: Routes.assignRequestScreen,
  //     page: (() =>  AssignListPage()),
  //   ),
  //   GetPage(
  //     name: Routes.driverListScreen,
  //     page: (() =>  DriverListPage()),
  //   ),
  //   GetPage(
  //     name: Routes.staffListScreen,
  //     page: (() =>  StaffListPage()),
  //   ),
  //

  ];
}

