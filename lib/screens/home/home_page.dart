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
      /* 
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddTaksPage()));
              },
              icon: Icon(
                Icons.add,
                color: Colors.black,

                /* 
                  //// add data button
                      Padding(
                        padding: const EdgeInsets.only(left: 330, top: 30),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.red,
                          child: Center(
                            child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddTaksPage()));
                                },
                                child: Icon(Icons.add)),
                          ),
                        ),
                      ),
                 */
              ))
        ],
      ),
    */
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
                      getDateWishTransaction(arrData);
                      return ListTile(
                        title: Text("${arrData[index].exp_title}"),
                      );
                    },
                  )

/* 
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          //// add data button
                          /*    Padding(
                            padding: const EdgeInsets.only(left: 330, top: 30),
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.red,
                              child: Center(
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AddTaksPage()));
                                    },
                                    child: Icon(Icons.add)),
                              ),
                            ),
                          ), */
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50, bottom: 50),
                            child: Column(
                              children: [
                                Text(
                                  "Spent this Week",
                                  style: TextStyle(fontSize: 15),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("\$",
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.black54)),
                                    wSpacher(width: 2.0),
                                    Text(
                                      "295",
                                      style: TextStyle(
                                          fontSize: 60,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      ".95",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1000,
                            child: Expanded(
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: arrData.length,
                                itemBuilder: (_, index) {
                                  getDateWishTransaction(arrData);
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 68, right: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              dummyData[index]['date'],
                                              style: textStyles18(),
                                            ),
                                            Text(
                                                "\$${dummyData[index]['amount']}"),
                                          ],
                                        ),
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
                                          itemCount: arrData.length,
                                          itemBuilder: (_, childIndex) {
                                            var chilData = dummyData[index]
                                                        ['dayTransaction']
                                                    [childIndex]
                                                as Map<String, dynamic>;

                                            return ListTile(
                                              leading: CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    chilData['imge']),
                                              ),
                                              title: Text(
                                                  "${arrData[index].exp_title}"),
                                              subtitle:
                                                  Text(chilData['subtitle']),
                                              trailing: Column(
                                                children: [
                                                  Text(chilData['amount']),
                                                  Text(chilData['trilExpence']),
                                                ],
                                              ),
                                            );
                                          })
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
               */
                : Center(
                    child: Text("Data Is Empty"),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }

  void getDateWishTransaction(List<ExpenseModal> data) {
    /// Fliter Expense modal
    List<FilterExpensceModal> arrFilterExpensceModal = [];

    /// get unique Dates
    List<String> arrUniqueDate = [];

    /// loop 1
    for (ExpenseModal eachExpensetrans in data) {
      var date = DateTime.parse(eachExpensetrans.exp_date);
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
        var date = DateTime.parse(eachtrans.exp_date);
        //// creant date 31-08-2023
        var mDate =

            /// creant date
            "${date.day}-${date.month.toString().length < 2 ? "0${date.month}" : date.month}-${date.year}";

        if (eachDate == mDate) {
          eachDateTranstion.add(eachtrans);

          /// logic in dabit and cardit ke liye
          if (eachtrans.exp_typ == 0) {
            // debit card se kam kar do
            amount -= eachtrans.exp_amount;
          } else {
            // cardit card me add kar do
            amount += eachtrans.exp_amount;
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

    /// print date and amount
    for (FilterExpensceModal modal in arrFilterExpensceModal) {
      print(
          "Date : ${modal.date} \n ${modal.amount}\n ${modal.arrExpenseModal}");
    }
  }
}
