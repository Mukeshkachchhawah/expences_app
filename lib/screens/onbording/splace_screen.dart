import 'dart:async';

import 'package:expense_app/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'bottom_bar_page.dart';
import 'user_account/login_page.dart';
import 'user_account/register_page.dart';

class Splace_Screen extends StatefulWidget {
  const Splace_Screen({super.key});

  @override
  State<Splace_Screen> createState() => SplaceScreenState();
}

class SplaceScreenState extends State<Splace_Screen> {
  static const String LOGIN_KEY = "Login Page";

  @override
  void initState() {
    super.initState();

    Shared_Preferenc();
  }

  void Shared_Preferenc() async {
    var sp = await SharedPreferences.getInstance();
    var islogin = sp.getBool(LOGIN_KEY);
    Timer(const Duration(seconds: 5), () {
      if (islogin != null) {
        if (islogin) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const BottomBarPages()));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        }
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Register_Page()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context);
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
