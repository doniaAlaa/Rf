import 'package:flutter/material.dart';
import 'package:test2/face_detection/edit_face_detection.dart';
import 'package:test2/page/app_intro_page.dart';

import 'package:test2/page/attendance_menu.dart';
import 'package:test2/page/checkin_checkout_page.dart';
import 'package:test2/page/control_panel_page.dart';
import 'package:test2/page/face_register_page.dart';
import 'package:test2/page/home_page.dart';
import 'package:test2/leaves_list/leaves_list_page.dart';
import 'package:test2/page/leaves/leaves_menu_options.dart';
import 'package:test2/page/login_page.dart';
import 'package:test2/page/new_leaves_page.dart';
import 'package:test2/splash/pages/splash_page.dart';

class AppRoutes {
  AppRoutes._();
  static const String splashPage = "splashPage";
  static const String loginPage = 'loginPage';
  static const String controlPanelPage = 'controlPanelPage';
  static const String homePage = 'homePage';
  static const String attendanceMenu = 'attendanceMenu';
  static const String newLeavesPage = 'newLeavesPage';
  static const String forgetPasswordView = 'forgetPasswordView';
  static const String faceRegisterPage = 'faceRegisterPage';
  static const String checkCheckoutPage = 'checkCheckoutPage';
  static const String faceDetectionPage = 'faceDetectionPage';
  static const String appIntroPage = 'appIntroPage';
  static const String leavesMenuOptions = 'leavesMenuOptions';
  static const String leavesListPage = 'leavesListPage';
  static const String editFaceDetectionPage = 'editFaceDetectionPage';




  
  



  

  static Map<String, WidgetBuilder> define() {
    return {
      splashPage: (context) => SplashPage(),
      appIntroPage: (context) => AppIntroPage(),
      loginPage: (context) => const LoginPage(),
      controlPanelPage: (context) => const ControlPanelPage(loginResult: null,endpoint: '',companyId: '', businessUnitResult: null,),
      homePage: (context) =>  HomePage(),
      attendanceMenu: (context) =>  AttendanceMenu(),
      leavesMenuOptions: (context) =>const LeavesMenuOptions(),
      newLeavesPage: (context) => NewLeavesPage(),
      faceRegisterPage: (context) => const FaceRegisterPage(),
      checkCheckoutPage: (context) => const CheckCheckoutPage(),
      leavesListPage: (context) => LeavesListPage(),
      editFaceDetectionPage: (context) => const EditFaceDetection(loginResult: null,endpoint: '',companyId: '', businessUnitResult: null,),




    };
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashPage:
        return MaterialPageRoute(builder: (_) => SplashPage());
       case AppRoutes.appIntroPage:
        return MaterialPageRoute(builder: (_) =>  AppIntroPage());
      case AppRoutes.loginPage:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case AppRoutes.controlPanelPage:
        return MaterialPageRoute(builder: (_) => const ControlPanelPage(loginResult: null,endpoint: '',companyId: '', businessUnitResult: null,));
      case AppRoutes.homePage:
        return MaterialPageRoute(builder: (_) =>  HomePage());
      case AppRoutes.newLeavesPage:
        return MaterialPageRoute(builder: (_) => NewLeavesPage());
      case AppRoutes.leavesMenuOptions:
        return MaterialPageRoute(builder: (_) => LeavesMenuOptions());
      case AppRoutes.leavesListPage:
        return MaterialPageRoute(builder: (_) => LeavesListPage());
      case AppRoutes.faceRegisterPage:
        return MaterialPageRoute(builder: (_) => const FaceRegisterPage());
      case AppRoutes.checkCheckoutPage:
        return MaterialPageRoute(builder: (_) =>  CheckCheckoutPage());
      case AppRoutes.editFaceDetectionPage:
        return MaterialPageRoute(builder: (_) => EditFaceDetection(loginResult: null,endpoint: '',companyId: '', businessUnitResult: null,));

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }

}
