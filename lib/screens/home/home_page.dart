import 'package:expense_app/constants/constants.dart';
import 'package:expense_app/expense_bloc/expense_bloc.dart';
import 'package:expense_app/modal/expense_modal.dart';
import 'package:expense_app/modal/filtereExpense_modal.dart';
import 'package:expense_app/screens/home/addTaks/addtakspage.dart';
import 'package:expense_app/theme_provider/theme_provider.dart';
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
  /// arrFilterExpense ko global kar dete hain jise puri ui me excce kar sakte hain
  List<FilterExpensceModal> arrFilterExpensceModal = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ExpenseBloc>().add(FatchAllExpenseEvent());
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Expenso"),
        leading: CircleAvatar(),
        actions: [
          // handle dart theme and light theme
          Switch(
            value: context.watch<ThemeProvider>().themeValue,
            onChanged: (value) {
              context.read<ThemeProvider>().themeValue = value;
            },
          )
        ],
      ),
      body: BlocBuilder<ExpenseBloc, ExpenseState>(
        builder: (context, state) {
          if (state is ExpenseLodingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ExpenseErroState) {
            return Center(child: Text("${state.errorMsg}"));
          } else if (state is ExpenseLoadedState) {
            var arrData = state.arrExpenses;
            getDateWishTransaction(arrData);
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  children: [
                    hSpacher(),
                    SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: Card(
                        //   color: Colors.red,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Spent this Week",
                              style: TextStyle(fontSize: 15),
                            ),
                            Align(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("\$",
                                      style: TextStyle(
                                          fontSize: 30, color: Colors.black54)),
                                  wSpacher(width: 2.0),
                                  Text(
                                    "000",
                                    style: TextStyle(
                                        fontSize: 60,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    ".00",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    hSpacher(),
                    arrFilterExpensceModal.isNotEmpty
                        ? CustomListView()
                        : Text("Expances is empty"),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),

      floatingActionButton: FloatingActionButton(
        tooltip: 'Add New Expenses',
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddTaksPage(),
              ));
        },
        child: Icon(Icons.add),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }

  Widget CustomListView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      reverse: true,
      itemCount: arrFilterExpensceModal.length,
      itemBuilder: (_, index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Date:- ${arrFilterExpensceModal[index].date}",
                    style: textStyles18(),
                  ),
                  Text(
                    "Amount:- ${arrFilterExpensceModal[index].amount}",
                    style: textStyles16(),
                  ),
                ],
              ),
            ),
            hSpacher(),
            // Divider(
            //   color: Colors.black,
            //   height: 1,
            // ),
            ListView.builder(
                shrinkWrap: true,
                reverse: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: arrFilterExpensceModal[index].arrExpenseModal.length,
                itemBuilder: (_, childIndex) {
                  var arreach =
                      arrFilterExpensceModal[index].arrExpenseModal[childIndex];

                  var image = AppConstants.catagery.firstWhere((element) =>
                      element['id'] == arreach.cat_id.toString())['image'];

                  return ListTile(
                    leading: CircleAvatar(
                      child: Image.asset(image),
                    ),
                    title: Text(arreach.exp_title),
                    subtitle: Text(arreach.exp_desc),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("\$ ${arreach.exp_amt}"), Text("Debit")],
                    ),
                  );
                })
          ],
        );
      },
    );
  }

  /// data wish transaction
  void getDateWishTransaction(List<ExpenseModal> data) {
    arrFilterExpensceModal.clear();
    List<String> arrUniqueDate = [];
    for (ExpenseModal eachExpensetrans in data) {
      var date = DateTime.parse(eachExpensetrans.date);
      var eachDate =
          "${date.day}-${date.month.toString().length < 2 ? "0${date.month}" : date.month}-${date.year}";
      print(eachDate);
      if (!arrUniqueDate.contains(eachDate)) {
        arrUniqueDate.add(eachDate);
      }
    }
    print(arrUniqueDate);
    for (String eachDate in arrUniqueDate) {
      List<ExpenseModal> eachDateTranstion = [];
      num amount = 0;
      for (ExpenseModal eachtrans in data) {
        var date = DateTime.parse(eachtrans.date);
        var mDate =
            "${date.day}-${date.month.toString().length < 2 ? "0${date.month}" : date.month}-${date.year}";
        if (eachDate == mDate) {
          eachDateTranstion.add(eachtrans);
          if (eachtrans.exp_type == 0) {
            amount -= eachtrans.exp_amt;
          } else {
            amount += eachtrans.exp_amt;
          }
        }
      }
      arrFilterExpensceModal.add(FilterExpensceModal(
          date: eachDate,
          amount: amount.toString(),
          arrExpenseModal: eachDateTranstion));
    }
  }
}
