import 'package:expense_app/app_widget/chartData.dart';
import 'package:expense_app/modal/expense_modal.dart';
import 'package:expense_app/modal/filtereExpense_modal.dart';
import 'package:expense_app/screens/home/addTaks/addtakspage.dart';
import 'package:expense_app/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../expense_bloc/expense_bloc.dart';

class Expense_Month extends StatefulWidget {
  const Expense_Month({super.key});

  @override
  State<Expense_Month> createState() => _Expense_MonthState();
}

class _Expense_MonthState extends State<Expense_Month> {
  List<FilterExpensceModalMonthWise> arrFilterMonthExpense = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ExpenseBloc>().add(FatchAllExpenseEvent());
  }

  List<ChartData> data = [
    ChartData(2010, 35, 23),
    ChartData(2011, 38, 49),
    ChartData(2012, 34, 12),
    ChartData(2013, 52, 33),
    ChartData(2014, 40, 30)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ExpenseBloc, ExpenseState>(
        builder: (_, state) {
          if (state is ExpenseLodingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ExpenseErroState) {
            return Center(
              child: Text("${state.errorMsg}"),
            );
          } else if (state is ExpenseLoadedState) {
            var arrData = state.arrExpenses.reversed.toList();
            getMonthWiseTransaction(arrData);
            return arrFilterMonthExpense.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 330, top: 30),
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.black,
                              child: Center(
                                child: Icon(Icons.add),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("\$",
                                      style: TextStyle(
                                          fontSize: 30, color: Colors.black54)),
                                  wSpacher(width: 2.0),
                                  Text("295.95",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Total spent this week",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  wSpacher(width: 10.0),
                                  CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 183, 233, 184),
                                    radius: 10,
                                    child: Icon(
                                      Icons.arrow_downward,
                                      size: 15,
                                      color: Colors.green,
                                    ),
                                  ),
                                  wSpacher(width: 5.0),
                                  Text(
                                    "13%",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Text('Weekly time chart'),

                          /// graf package sfCardtesianchart
                          SfCartesianChart(
                            series: <ChartSeries<ChartData, int>>[
                              ColumnSeries<ChartData, int>(
                                  dataSource: data,
                                  xValueMapper: (datum, index) => datum.x,
                                  yValueMapper: (datum, index) => datum.y),
                            ],
                          ),
                          hSpacher(hight: 20.0),
                          Row(
                            children: [
                              buttom("Week"),
                              wSpacher(width: 10.0),
                              buttom("Month")
                            ],
                          ),



                          SizedBox(
                            height: 260,
                            child: ListView.builder(
                                itemCount: arrFilterMonthExpense.length,
                                itemBuilder: (_, index) {
                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(arrFilterMonthExpense[index]
                                              .Month),
                                          Text(arrFilterMonthExpense[index]
                                              .amount),
                                        ],
                                      ),
                                      ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount:
                                              arrFilterMonthExpense[index]
                                                  .arrExpenseModal
                                                  .length,
                                          itemBuilder: (_, subIndex) {
                                            var eachTrans =
                                                arrFilterMonthExpense[index]
                                                    .arrExpenseModal[subIndex];
                                            return ListTile(
                                              title: Text(eachTrans.exp_title),
                                              subtitle:
                                                  Text(eachTrans.exp_desc),
                                              trailing: Text(
                                                  "\$ ${eachTrans.exp_amt}"),
                                            );
                                          })
                                    ],
                                  );
                                }),
                          )
                       


                        ],
                      ),
                    ),
                  )
                : Center(
                    child: Text("No Expenser Addend"),
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


  void getMonthWiseTransaction(List<ExpenseModal> data) {
    arrFilterMonthExpense.clear();
    //getUniqueDates
    List<String> arrUniqueDate = [];

    for (ExpenseModal eachTrans in data) {
      var date = DateTime.parse(eachTrans.date);

      /// 09-2023
      var eachDate =
          "${date.month.toString().length < 2 ? '0${date.month}' : date.month}-${date.year}";
      print(eachDate);

      if (!arrUniqueDate.contains(eachDate)) {
        arrUniqueDate.add(eachDate);
      }
    }
    print(arrUniqueDate);

    //2
    for (String eachDate in arrUniqueDate) {
      print("EachDate : $eachDate");

      List<ExpenseModal> eachDateTrans = [];
      num amt = 0;

      for (ExpenseModal eachTrans in data) {
        var date = DateTime.parse(eachTrans.date);

        /// 08-2023
        var mDate =
            "${date.month.toString().length < 2 ? '0${date.month}' : date.month}-${date.year}";

        if (eachDate == mDate) {
          eachDateTrans.add(eachTrans);
          if (eachTrans.exp_type == 0) {
            //debit
            amt -= eachTrans.exp_amt;
          } else {
            //credit
            amt += eachTrans.exp_amt;
          }
        }

        //continue from here..
      }

      arrFilterMonthExpense.add(FilterExpensceModalMonthWise(
          Month: eachDate,
          amount: amt.toString(),
          arrExpenseModal: eachDateTrans));
    }
  }


}
