import 'package:expense_app/expense_bloc/expense_bloc.dart';
import 'package:expense_app/screens/home/home_page.dart';
import 'package:expense_app/screens/onbording/splace_screen.dart';
import 'package:expense_app/theme_provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'database/db_helper.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => ExpenseBloc(db: AppDatabase()),

    /// nesting provider
    child: ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
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
          title: 'Expense App dfsdfh kdh',
          debugShowCheckedModeBanner: false,

          /// value ko listen karna hain es liye wathch kar rahe hai
          themeMode: context.watch<ThemeProvider>().themeValue
              ? ThemeMode.dark
              : ThemeMode.light,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          // theme: ThemeData(
          //     primarySwatch: Colors.grey,
          //     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          //         selectedItemColor: Colors.blueAccent)),
          //  home: Home_Page(),
          home: const Splace_Screen(),
        );
        // ffffff
        // f8f9fa
      },
    );
  }
}
