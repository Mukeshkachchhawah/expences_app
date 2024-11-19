import 'package:expense_app/app_widget/chartData.dart';
import 'package:expense_app/component/button.dart';
import 'package:expense_app/modal/expense_modal.dart';
import 'package:expense_app/modal/filtereExpense_modal.dart';
import 'package:expense_app/screens/home/addTaks/addtakspage.dart';
import 'package:expense_app/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../expense_bloc/expense_bloc.dart';

class ExpenseMonth extends StatefulWidget {
  const ExpenseMonth({super.key});

  @override
  State<ExpenseMonth> createState() => _ExpenseMonthState();
}

class _ExpenseMonthState extends State<ExpenseMonth> {
  List<FilterExpensceModalMonthWise> arrFilterMonthExpense = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ExpenseBloc>().add(FetchAllExpenseEvent());
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
          if (state is ExpenseLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ExpenseErrorState) {
            return Center(
              child: Text(state.errorMsg),
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
                          const Padding(
                            padding: EdgeInsets.only(left: 330, top: 30),
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.black,
                              child: Center(
                                child: Icon(Icons.add),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text("\$",
                                      style: TextStyle(
                                          fontSize: 30, color: Colors.black54)),
                                  wSpace(width: 2.0),
                                  const Text("295.95",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Total spent this week",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  wSpace(width: 10.0),
                                  const CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 183, 233, 184),
                                    radius: 10,
                                    child: Icon(
                                      Icons.arrow_downward,
                                      size: 15,
                                      color: Colors.green,
                                    ),
                                  ),
                                  wSpace(width: 5.0),
                                  const Text(
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
                          const Text('Weekly time chart'),

                          /// graf package sfCardtesianchart
                          SfCartesianChart(
                            series: <ChartSeries<ChartData, int>>[
                              ColumnSeries<ChartData, int>(
                                  dataSource: data,
                                  xValueMapper: (datum, index) => datum.x,
                                  yValueMapper: (datum, index) => datum.y),
                            ],
                          ),
                          hSpace(mHight: 20.0),
                          Row(
                            children: [
                              button("Week"),
                              wSpace(width: 10.0),
                              button("Month")
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
                                              const NeverScrollableScrollPhysics(),
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
                : const Center(
                    child: Text("No Expense Addend"),
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
                builder: (context) => const AddTaskPage(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

//// month wish expense amount
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
