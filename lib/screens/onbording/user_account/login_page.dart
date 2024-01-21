/* import 'package:flutter/material.dart';
import 'package:response_app/screens/home/home_page.dart';

import 'package:response_app/screens/onbording/forget_pass.dart';
import 'package:response_app/screens/onbording/splace_screen.dart';

import 'package:response_app/ui_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../database/db_helper.dart';
import 'register_page.dart';
import 'package:lottie/lottie.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  var formKeys = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var orientation;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Lottie.asset(
                    "assets/lottie_animation/animation_lkqksu5m.json",
                    width: 200,
                    height: 200),
              ),
              hSpacher(),
              Text("Log in to your account", style: loginTop1()),
              hSpacher(),
              Text(
                "Please enter your details to acces your account",
                style: loginmid2(),
              ),
              hSpacher(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.red)),
                    child: Image.network(
                      "https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-google-icon-logo-png-transparent-svg-vector-bie-supply-14.png",
                      scale: 100,
                    ),
                  ),
                  wSpacher(width: 20.0),
                  Container(
                    height: 50,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.red)),
                    child: Image.network(
                      "https://cdn-icons-png.flaticon.com/512/2/2235.png",
                      scale: 18,
                    ),
                  ),
                  wSpacher(width: 20.0),
                  Container(
                    height: 50,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.red)),
                    child: Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/1024px-Facebook_Logo_%282019%29.png",
                      scale: 35,
                    ),
                  )
                ],
              ),
              hSpacher(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 2,
                    width: 150,
                    color: Colors.black,
                  ),
                  wSpacher(),
                  Text(
                    "or",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  wSpacher(),
                  Container(
                    height: 2,
                    width: 150,
                    color: Colors.black,
                  ),
                ],
              ),
              hSpacher(),
               SizedBox(
                  width: media.size.width * .9,
                  child: TextFormField(
                    onTap: () {},
                    decoration: InputDecoration(
                      filled: true,
                     // fillColor: AppColors.greyColor,
                      hintText: "Enter Your Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                     //   borderSide: BorderSide(color: AppColors.blackColor),
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
                hSpacher(),
                SizedBox(
                  width: media.size.width * .9,
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                    //  fillColor: AppColors.greyColor,
                      hintText: "Enter Your Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      //  borderSide: BorderSide(color: AppColors.blackColor),
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
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Forget_Pass(),
                        ));
                  },
                  child: Text("Forget password")),
              hSpacher(hight: 20.0),
               SizedBox(
                  height: media.size.height * .07,
                  width: media.size.width * .9,
                  child: ElevatedButton(
                     
                      onPressed: () async {
                        // if and if user is Authenticated!

                        if (formKeys.currentState!.validate()) {
                          var check = await AppDatabase().authenticateUser(
                            email: emailController.text,
                            password: passwordController.text,
                          );

                          if (check) {
                            var pref = await SharedPreferences.getInstance();
                            pref.setBool(SplaceScreenState.uservalue, true);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Home_Page(),
                                ));
                          } else {
                            // show error
                          }
                        }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          //  color: AppColors.whiteColor,
                            fontSize: 22,
                           // fontFamily: "poppins"
                            ),
                      )),
                ),
              hSpacher(hight: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: textStyles(),
                  ),
                  wSpacher(),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register_Page()));
                      },
                      child: Text("Log in",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.red))),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
 */

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constructor/social_media.dart';
import '../../../database/db_helper.dart';
import '../../../ui_helper.dart';
import '../bottom_bar_page.dart';
import 'forget_pass.dart';
import '../splace_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var portraitKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var orientation;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);

    return Scaffold(
          backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                      Text(
                        "Log in to your account",
                        style: loginTop1()
                      ),
                      hSpacher(),
                      Text(
                        "Please enter your details to acces your account",
                        style: TextStyle(fontSize: 18),
                      ),
                      hSpacher(),
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
                      hSpacher(),
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
                      hSpacher(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Forget_Pass(),));
                              },
                              child: Text(
                                "Forget Password?", style: TextStyle(color: Color(0xFFFF0000), fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      hSpacher(),
                      InkWell(
                        onTap: ()async {
                            if (portraitKey.currentState!.validate()) {
                                    var check = await AppDatabase().authenticateUser(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                  
                                    if (check) {
                                      var pref = await SharedPreferences.getInstance();
                                      pref.setBool(SplaceScreenState.LOGIN_KEY, true);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => BottomBarPages(),
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
                              color: Color.fromARGB(255, 4, 19, 58),
                              borderRadius: BorderRadius.circular(10)),child: Center(
                                child: Text("Login", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
                              ),
                        ),
                      )
                      
                      ,
                      hSpacher(mHight: 20.0),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Container(
                              height: 1,
                              color: Colors.black,
                              width: 150,
                            ),
                            wSpacher(),
                            Text(
                              "Or",
                              style: TextStyle(fontSize: 20),
                            ),
                            wSpacher(),
                            Container(
                              height: 1,
                              color: Colors.black,
                              width: 150,
                            ),
                          ],
                        ),
                      ),
                      hSpacher(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Social_Midia_Button(
                              images:
                                  "https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png",
                              scale_value: 40,
                              textValue: "google"),
                          Social_Midia_Button(
                              images:
                                  "https://1000logos.net/wp-content/uploads/2021/04/Facebook-logo.png",
                              scale_value: 20,
                              textValue: "Facbook"),
                          Social_Midia_Button(
                              images:
                                  "https://cdn-icons-png.flaticon.com/512/2/2235.png",
                              scale_value: 20,
                              textValue: "Mac")
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
