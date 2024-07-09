import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constructor/social_media.dart';
import '../../../database/db_helper.dart';
import '../../../ui_helper.dart';
import '../bottom_bar_page.dart';
import 'forget_pass.dart';
import '../splace_screen.dart';
import 'register_page.dart';

class LoginScreenView extends StatefulWidget {
  const LoginScreenView({super.key});

  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  var portraitKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var orientation;
  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context);

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                hSpacer(mHight: 60.0),
                Form(
                  key: portraitKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Lottie.asset(
                              "assets/lottie_animation/animation_lkqksu5m.json",
                              height: 200,
                              width: 200),
                        ),
                        Text("Log in to your account", style: loginTop1()),
                        hSpacer(),
                        const Text(
                          "Please enter your details to acces your account",
                          style: TextStyle(fontSize: 18),
                        ),
                        hSpacer(),
                        SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            onTap: () {},
                            decoration: InputDecoration(
                              filled: true,
                              hintText: "Enter Your Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            validator: (value) {
                              if (value == "" || !value!.contains("@")) {
                                return "Please enter valid email!";
                              }
                              return null;
                            },
                          ),
                        ),
                        hSpacer(),
                        SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              hintText: "Enter Your Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            validator: (value) {
                              if (value == "" || value!.length < 5) {
                                return "Please enter valid Password(length must be 6 characters)!";
                              }
                              return null;
                            },
                          ),
                        ),
                        hSpacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgetPasswordView(),
                                      ));
                                },
                                child: const Text(
                                  "Forget Password?",
                                  style: TextStyle(
                                      color: Color(0xFFFF0000),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        hSpacer(),
                        InkWell(
                          onTap: () async {
                            if (portraitKey.currentState!.validate()) {
                              var check = await AppDatabase().authenticateUser(
                                email: emailController.text,
                                password: passwordController.text,
                              );

                              if (check) {
                                var pref =
                                    await SharedPreferences.getInstance();
                                pref.setBool(SplashScreenState.LOGIN_KEY, true);
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                    // ignore: use_build_context_synchronously
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const BottomBarPages(),
                                    ));
                              } else {
                                // show error
                              }
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 380,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 4, 19, 58),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        hSpacer(),
                        Center(
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterView(),
                                    ));
                              },
                              child: const Text("Create New Account")),
                        ),
                        hSpacer(),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Container(
                                height: 1,
                                color: Colors.black,
                                width: 150,
                              ),
                              wSpacer(),
                              const Text(
                                "Or",
                                style: TextStyle(fontSize: 15),
                              ),
                              wSpacer(),
                              Container(
                                height: 1,
                                color: Colors.black,
                                width: 150,
                              ),
                            ],
                          ),
                        ),
                        hSpacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SocialMediaButton(
                                images:
                                    "https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png",
                                scaleValue: 40,
                                textValue: "google"),
                            SocialMediaButton(
                                images:
                                    "https://1000logos.net/wp-content/uploads/2021/04/Facebook-logo.png",
                                scaleValue: 20,
                                textValue: "Facbook"),
                            SocialMediaButton(
                                images:
                                    "https://cdn-icons-png.flaticon.com/512/2/2235.png",
                                scaleValue: 20,
                                textValue: "Mac")
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
