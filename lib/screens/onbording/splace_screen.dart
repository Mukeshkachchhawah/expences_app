import 'dart:async';

import 'package:expense_app/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'bottom_bar_page.dart';
import 'user_account/login_page.dart';
import 'user_account/register_page.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreenView> {
  // ignore: constant_identifier_names
  static const String LOGIN_KEY = "Login Page";

  @override
  void initState() {
    super.initState();

    sharedPreference();
  }

  void sharedPreference() async {
    var sp = await SharedPreferences.getInstance();
    var isLogin = sp.getBool(LOGIN_KEY);
    Timer(const Duration(seconds: 5), () {
      if (isLogin != null) {
        if (isLogin) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const BottomBarPages()));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreenView()));
        }
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const RegisterView()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Scaffold(
        // backgroundColor: Color(0xFFFFFF00),
        backgroundColor: Colors.white,
        body: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icon/wallet.png",
                      scale: 10,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      AppConstants.app_name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              );
            } else {
              /// lendScap Code ///
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icon/wallet.png",
                      scale: 10,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Response App",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              );
            }
          },
        ));
  }
}
