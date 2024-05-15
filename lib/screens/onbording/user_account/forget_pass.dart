import 'package:expense_app/database/db_helper.dart';
import 'package:flutter/material.dart';

import 'resend_password.dart';



class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back)),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Forget Password',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Enter Your Email Here"),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "xyz@gmail.com",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                    validator: (value) {
                      if (value == "" || !value!.contains("@")) {
                        return "Pleace Enter Valid Email";
                      }
                      return null;
                    },
                  )
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        // ignore: unused_local_variable
                        var check = await AppDatabase()
                            .forgetPassword(emailController.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResendPasswordView(
                                email: emailController.text,
                              ),
                            ));
                      } else {
                        /// show erro
                      }
                    },
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 7, 7, 71)),
                      child: const Center(
                        child: Text(
                          "Conform",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
