import 'package:flutter/material.dart';

import '../../../database/db_helper.dart';
import 'login_page.dart';



class Resend_Password extends StatefulWidget {
  String email;
  Resend_Password({required this.email, super.key});

  @override
  State<Resend_Password> createState() => _Resend_PasswordState();
}

class _Resend_PasswordState extends State<Resend_Password> {
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
                      child: Icon(Icons.arrow_back)),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Reset Your Password',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Enter Your Password Here"),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "New Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                            validator: (value) {
                              if(value=="" || value!.length<5){
                                return "Enter Your New Possword";
                              }
                            },
                  ),
                   SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Conform Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                           validator: (value) {
                              if(value=="" || value!.length<5){
                                return "conform Your New Possword";
                              }
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
                                builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        "Go Login Page",
                        style: TextStyle(fontSize: 16),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: ()async {
                      if(formKey.currentState!.validate()){
                        var check = await AppDatabase().resetPassword(newPasswordController.text, widget.email);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
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
                          color: Color.fromARGB(255, 7, 7, 71)),
                      child: Center(
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
