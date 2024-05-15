// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../database/db_helper.dart';
import 'login_page.dart';



class ResendPasswordView extends StatefulWidget {
  String email;
  ResendPasswordView({required this.email, super.key});

  @override
  State<ResendPasswordView> createState() => _ResendPasswordViewState();
}

class _ResendPasswordViewState extends State<ResendPasswordView> {
   var formKey = GlobalKey<FormState>();
   TextEditingController newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 8.0, right: 8.0, bottom: 20),
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
                    'Reset Your Password',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Enter Your Password Here"),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "New Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                            validator: (value) {
                              if(value=="" || value!.length<5){
                                return "Enter Your New Password";
                              }
                              return null;
                            },
                  ),
                   const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Conform Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                           validator: (value) {
                              if(value=="" || value!.length<5){
                                return "conform Your New Password";
                              }
                              return null;
                            }
                  )
                ],
              ),
              Column(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreenView()));
                      },
                      child: const Text(
                        "Go Login Page",
                        style: TextStyle(fontSize: 16),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: ()async {
                      if(formKey.currentState!.validate()){
                        // ignore: unused_local_variable
                        var check = await AppDatabase().resetPassword(newPasswordController.text, widget.email);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreenView(),));
                      }
                      else{
                        // errow show
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
