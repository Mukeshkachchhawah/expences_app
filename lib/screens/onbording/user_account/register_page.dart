import 'package:expense_app/screens/onbording/user_account/login_page.dart';
import 'package:expense_app/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../constructor/social_media.dart';
import '../../../database/db_helper.dart';
import '../../../modal/user_modal.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Lottie.asset(
                  "assets/lottie_animation/animation_lkqmem5n.json",
                  width: 200,
                  height: 200),
            ),
            Text(
              "Create your account",
              style: textStyleFonts28(context),
            ),
            hSpace(),
            const Text(
              "Let's get Started with your 30 days free trial",
              style: TextStyle(fontSize: 18),
            ),
            hSpace(),

            /// Enter Email Fomr Fild
            Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextFormFills(
                      "Enter Your Email",

                      /// voidCallBack validator
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter email!";
                        } else {
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return "Please Enter Valid Email";
                          }
                        }
                      },
                      BorderRadius.circular(10),
                      onchaged: (value) {
                        formKey.currentState?.validate();
                      }),
                  hSpace(),
                  CustomTextFormFills(
                      "Enter Your Password", BorderRadius.circular(10),
                      validator: (value) {
                    if (value == "" || value!.length < 5) {
                      return "Please enter valid Password(length must be 6 characters)!";
                    }
                    return null;
                  }),
                  hSpace(),
                  CustomTextFormFills(
                      "Confirm Your Password", BorderRadius.circular(10),
                      validator: (value) {
                    if (value == "" || value!.length < 5) {
                      return "Password should be Same(length must be 6 characters)!";
                    }
                    return null;
                  }),
                  hSpace(),
                ],
              ),
            ),
            hSpace(),
            /*   hSpace(),
            const Text(
              "I Agree to all Teem, Privacy Policy and Fees",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
            hSpace(), */
            InkWell(
              onTap: () async {
                print("=========== User Click Button ==============");
                if (formKey.currentState!.validate()) {
                  var check = await AppDatabase().createUser(UserModel(
                    email: emailController.text,
                    password: passwordController.text,
                  ));
                  print('======= Check == $check');
                  if (check) {
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreenView(),
                        ));
                  } else {
                    // show error
                    SnackBar(content: Text("Registion Failled"));
                  }
                }
              },
              child: Container(
                height: 50,
                width: double.infinity,
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
            hSpace(mHight: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?",
                    style: TextStyle(
                      fontSize: 16,
                    )),
                wSpace(),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreenView(),
                          ));
                    },
                    child: const Text("Log in",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 34, 30, 30),
                            fontWeight: FontWeight.bold)))
              ],
            ),
            hSpace(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 1,
                  width: media.size.width * 0.35,
                  color: Colors.black,
                ),
                // wSpacher(),
                const Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    "or",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                // wSpacher(),
                Container(
                  height: 1,
                  width: media.size.width * 0.35,
                  color: Colors.black,
                ),
              ],
            ),
            hSpace(mHight: 20.0),

            /// Social Button
            SocialMedia()
          ],
        ),
      ),
    )));
  }

  Widget CustomTextFormFills(String text, BorderRadius, {validator, onchaged}) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        //  fillColor: AppColors.greyColor,
        hintText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius,
          // borderSide: BorderSide(color: AppColors.blackColor),
        ),
      ),
      validator: validator,
      onChanged: onchaged,
    );
  }

  Widget SocialMedia() {
    return Row(
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
            images: "https://cdn-icons-png.flaticon.com/512/2/2235.png",
            scaleValue: 20,
            textValue: "Mac")
      ],
    );
  }
}
