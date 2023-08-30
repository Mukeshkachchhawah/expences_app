import 'package:expense_app/expense_bloc/expense_bloc.dart';
import 'package:expense_app/screens/home/addTaks/addtakspage.dart';
import 'package:expense_app/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/constants.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ExpenseBloc>().add(FatchAllExpenseEvent());
  }

  @override
  Widget build(BuildContext context) {
    var dummyData = Constants.transaction;
    return Scaffold(
      body: BlocBuilder<ExpenseBloc, ExpenseState>(
        builder: (context, state) {
          if (state is ExpenseLodingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ExpenseErroState) {
            return Center(
              child: Text("${state.erroMaess}"),
            );
          } else if (state is ExpenseLoadedState) {
            var arrData = state.lodedExpenses;
            return arrData.isNotEmpty
                ? ListView.builder(
                    itemCount: arrData.length,
                    itemBuilder: (ctx, index) {
                      return ListTile(
                        title: Text("${arrData[index].exp_title}"),
                      );
                    },
                  )
                : Center(
                    child: Text("Data Is Empty"),
                  );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddTaksPage(),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
