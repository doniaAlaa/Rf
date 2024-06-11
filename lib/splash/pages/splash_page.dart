import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test2/core/app_local_db/app_local_db.dart';
import 'package:test2/core/const/app_routers.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  isUserLoggedIn()async{
    String? userData = await SecureStorage().getUserModel();
    if (userData != null){

            Navigator.pushNamed(context, AppRoutes.homePage);

    }else{
         Navigator.pushNamed(context, AppRoutes.appIntroPage);

    }
  }

   @override
  void initState() {
    super.initState();
   Future.delayed(const Duration(seconds: 3), () {
    //isUserLoggedIn();
             Navigator.pushNamed(context, AppRoutes.loginPage);

        });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Center(
      child: Image.asset(
                        'assets/images/logo.jpg',
                        height: 200,
                      ),
    )),
    );
      
  }
}