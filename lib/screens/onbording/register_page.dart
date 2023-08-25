import 'package:expense_app/screens/onbording/login_page.dart';
import 'package:expense_app/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';



import '../../constructor/social_media.dart';
import '../../database/db_helper.dart';
import '../../modal/user_modal.dart';

class Register_Page extends StatefulWidget {
  const Register_Page({super.key});

  @override
  State<Register_Page> createState() => _Register_PageState();
}

class _Register_PageState extends State<Register_Page> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  var orientation;
  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Lottie.asset(
                                "assets/lottie_animation/animation_lkqmem5n.json",
                                width: 200,
                                height: 200)),
                        Center(
                            child: Text(
                          "Create your account",
                          style: loginTop1(),
                        )),
                        hSpacher(),
                        Text(
                          "Let's get Started with your 30 days free trial",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                        ),
                        hSpacher(),
                      
                        hSpacher(),
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            hintText: "Enter Your Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              //   borderSide: BorderSide(color: AppColors.blackColor),
                            ),
                           
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter email!";
                            }else{
                              if(!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                return "Please Enter Valid Email";
                              }
                            }
                           
                          },
                          onChanged: (value) {
                            formKey.currentState?.validate();
                          },
                        ),
                        hSpacher(),
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            //  fillColor: AppColors.greyColor,
                            hintText: "Enter Your Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              //   borderSide: BorderSide(color: AppColors.blackColor),
                            ),
                          ),
                          validator: (value) {
                            if (value == "" || value!.length < 5) {
                              return "Please enter valid Password(length must be 6 characters)!";
                            }
                            return null;
                          },
                        ),
                        hSpacher(),
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            //  fillColor: AppColors.greyColor,
                            hintText: "Confirm Your Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              // borderSide: BorderSide(color: AppColors.blackColor),
                            ),
                          ),
                          validator: (value) {
                            if (value == "" || value!.length < 5) {
                              return "Password should be Same(length must be 6 characters)!";
                            }
                            return null;
                          },
                        ),
                        hSpacher(),
                        /*    Text(
                          "I Agree to all Teem, Privacy Policy and Fees",
                          style: midtextStyles(),
                        ), */
                        hSpacher(),
                         InkWell(
                          onTap: () async{
                              if (formKey.currentState!.validate()) {
                                  var check = await AppDatabase().createUser(UserModel(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ));
                      
                                  if (check) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
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
                         ),
                    
                        hSpacher(hight: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account?", style: TextStyle(fontSize: 16, )),
                            wSpacher(),
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginScreen(),
                                      ));
                                },
                                child: Text("Log in", style: TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold)))
                          ],
                        ),
                        hSpacher(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 1,
                              width: 160,
                              color: Colors.black,
                            ),
                            wSpacher(),
                            Text("Or", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                            wSpacher(),
                             Container(
                              height: 1,
                              width: 160,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        hSpacher(hight: 20.0),
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
                ],
              ),
            ),
          )),
    );
  }

  /// UI Portraited Mood ///

//// Ui LeandScap Mood ////
}
