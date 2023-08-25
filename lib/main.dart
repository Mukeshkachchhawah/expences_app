import 'package:expense_app/screens/onbording/splace_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context,child){
        return MaterialApp(
        title: 'Expense App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
         
          primarySwatch: Colors.blue,
        ),
        home: Splace_Screen(),
      );
      },
    );
  }
}

