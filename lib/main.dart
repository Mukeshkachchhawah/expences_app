import 'package:expense_app/expense_bloc/expense_bloc.dart';
import 'package:expense_app/screens/home/home_page.dart';
import 'package:expense_app/screens/onbording/splace_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'database/db_helper.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => ExpenseBloc(db: AppDatabase()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          title: 'Expense App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        //  home: Home_Page(),
           home: Splace_Screen(),
        );
      },
    );
  }
}
