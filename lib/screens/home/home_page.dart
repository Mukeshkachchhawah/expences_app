import 'package:expense_app/constants/constants.dart';
import 'package:expense_app/expense_bloc/expense_bloc.dart';
import 'package:expense_app/modal/expense_modal.dart';
import 'package:expense_app/modal/filtereExpense_modal.dart';
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
      body: BlocBuilder<ExpenseBloc, ExpenseState>(
        builder: (context, state) {
          if (state is ExpenseLodingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ExpenseErroState) {
            return Center(
              child: Text("${state.errorMsg}"),
            );
          } else if (state is ExpenseLoadedState) {
            var arrData = state.arrExpenses;
            getDateWishTransaction(arrData);
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 60, left: 10, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddTaksPage(),
                                ));
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  hSpacher(hight: 20.0),
                  Column(
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
                                  fontSize: 60, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              ".00",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      arrFilterExpensceModal.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: media.size.height * .9,
                                child: ListView.builder(
                                  // shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: arrFilterExpensceModal.length,
                                  itemBuilder: (_, index) {
                                    return Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              arrFilterExpensceModal[index]
                                                  .date,
                                              style: textStyles18(),
                                            ),
                                            Text(arrFilterExpensceModal[index]
                                                .amount),
                                          ],
                                        ),
                                        hSpacher(hight: 10.0),
                                        // Divider(
                                        //   color: Colors.black,
                                        //   height: 1,
                                        // ),
                                        ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount:
                                                arrFilterExpensceModal[index]
                                                    .arrExpenseModal
                                                    .length,
                                            itemBuilder: (_, childIndex) {
                                              var arreach =
                                                  arrFilterExpensceModal[index]
                                                          .arrExpenseModal[
                                                      childIndex];

                                              var image = AppConstants.catagery
                                                  .firstWhere((element) =>
                                                      element['id'] ==
                                                      arreach.cat_id
                                                          .toString())['image'];

                                              return ListTile(
                                                leading: CircleAvatar(
                                                  child: Image.asset(image),
                                                ),
                                                title: Text(arreach.exp_title),
                                                subtitle:
                                                    Text(arreach.exp_desc),
                                                trailing: Text(
                                                    "\$ ${arreach.exp_amt}"),
                                              );
                                            })
                                      ],
                                    );
                                  },
                                ),
                              ),
                            )
                          : Center(
                              child: Text("Data Is Empty"),
                            ),
                    ],
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),

      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Tracation',
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

  void getDateWishTransaction(List<ExpenseModal> data) {
    arrFilterExpensceModal.clear();

    /// Fliter Expense modal
    /// get unique Dates
    List<String> arrUniqueDate = [];

    /// loop 1
    for (ExpenseModal eachExpensetrans in data) {
      var date = DateTime.parse(eachExpensetrans.date);
      var eachDate =

          /// creant date
          "${date.day}-${date.month.toString().length < 2 ? "0${date.month}" : date.month}-${date.year}";
      print(eachDate);

      if (!arrUniqueDate.contains(eachDate)) {
        arrUniqueDate.add(eachDate);
      }
    }
    print(arrUniqueDate);

    /// loop 2
    for (String eachDate in arrUniqueDate) {
      List<ExpenseModal> eachDateTranstion = [];
      num amount = 0;

      for (ExpenseModal eachtrans in data) {
        var date = DateTime.parse(eachtrans.date);
        //// creant date 31-08-2023
        ////// creant date
        var mDate =
            "${date.day}-${date.month.toString().length < 2 ? "0${date.month}" : date.month}-${date.year}";
        if (eachDate == mDate) {
          eachDateTranstion.add(eachtrans);

          /// logic in dabit and cardit ke liye
          if (eachtrans.exp_type == 0) {
            // debit card se kam kar do
            amount -= eachtrans.exp_amt;
          } else {
            // cardit card me add kar do
            amount += eachtrans.exp_amt;
          }
        }
      }
      //// add Fliter Date Transtion
      /// add expense date or expense amount and date transtion
      arrFilterExpensceModal.add(FilterExpensceModal(
          date: eachDate,
          amount: amount.toString(),
          arrExpenseModal: eachDateTranstion));
    }
  }

/*   void getDaywishName(DateTime dateTime) {
    String day = "${dateTime.weekday}";
    switch (day) {
      case 1:
        return "Sunday";
    }
  }

  void getMonthWishTransaction() {
    //  List<String> weeklyTran = [];
    DateTime? weeklyTran;
    DateTime day = DateTime.now();
    for (int i = 1; i < 7; i++) {}
  } */
}
