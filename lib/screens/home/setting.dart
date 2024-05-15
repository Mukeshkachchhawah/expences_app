import 'package:expense_app/expense_bloc/expense_bloc.dart';
import 'package:expense_app/modal/filtereExpense_modal.dart';
import 'package:expense_app/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../modal/expense_modal.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _GrafState();
}

class _GrafState extends State<Setting> {
  List<FilterExpensceModalYearWise> arrFilterYearExpense = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ExpenseBloc>().add(FetchAllExpenseEvent());
  }

  final List<ChartDataYear> years = [
    ChartDataYear(DateTime(2015), 35),
    ChartDataYear(DateTime(2016), 28),
    ChartDataYear(DateTime(2017), 34),
    ChartDataYear(DateTime(2018), 32),
    ChartDataYear(DateTime(2019), 40),
    ChartDataYear(DateTime(2020), 9),
    ChartDataYear(DateTime(2021), 40),
    ChartDataYear(DateTime(2022), 40),
    ChartDataYear(DateTime(2023), 40),
    ChartDataYear(DateTime(2024), 40),
    ChartDataYear(DateTime(2025), 5),
    ChartDataYear(DateTime(2026), 40),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<ExpenseBloc, ExpenseState>(
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
          return arrFilterYearExpense.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
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
                              wSpacer(width: 2.0),
                              const Text("803.92",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "Total spent this month",
                                style: TextStyle(fontSize: 15),
                              ),
                              wSpacer(width: 10.0),
                              const CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 235, 167, 162),
                                radius: 10,
                                child: Icon(
                                  Icons.arrow_upward,
                                  size: 15,
                                  color: Colors.red,
                                ),
                              ),
                              wSpacer(width: 5.0),
                              const Text(
                                "1%",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              )
                            ],
                          ),
                        ],
                      ),
                      SfCartesianChart(
                        primaryXAxis: DateTimeAxis(),
                        series: <ChartSeries>[
                          LineSeries<ChartDataYear, DateTime>(
                            dataSource: years,
                            xValueMapper: (datum, index) => datum.year,
                            yValueMapper: (datum, index) => datum.sales,
                          )
                        ],
                      ),
                      hSpacer(mHight: 20.0),
                      Row(
                        children: [
                          bottom("Month"),
                          wSpacer(width: 10.0),
                          bottom("Year")
                        ],
                      ),
                      SizedBox(
                        height: 260,
                        child: ListView.builder(
                            itemCount: arrFilterYearExpense.length,
                            itemBuilder: (_, index) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(arrFilterYearExpense[index].year),
                                      Text(arrFilterYearExpense[index].amount),
                                    ],
                                  ),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: arrFilterYearExpense[index]
                                          .arrExpenseModal
                                          .length,
                                      itemBuilder: (_, subIndex) {
                                        var eachTrans =
                                            arrFilterYearExpense[index]
                                                .arrExpenseModal[subIndex];
                                        return ListTile(
                                          title: Text(eachTrans.exp_title),
                                          subtitle: Text(eachTrans.exp_desc),
                                          trailing:
                                              Text("\$ ${eachTrans.exp_amt}"),
                                        );
                                      })
                                ],
                              );
                            }),
                      )
                    ],
                  ),
                )
              : const Center(
                  child: Text("No Expense this year"),
                );
        }
        return Container();
      },
    ));
  }

  bottom(String text) {
    return Container(
      height: 50,
      width: 100,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(10)),
      child: Center(child: Text(text)),
    );
  }

  void getMonthWiseTransaction(List<ExpenseModal> data) {
    arrFilterYearExpense.clear();
    //getUniqueDates
    List<String> arrUniqueDate = [];

    for (ExpenseModal eachTrans in data) {
      var date = DateTime.parse(eachTrans.date);

      /// 09-2023
      var eachDate = "${date.year}";
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
        var mDate = "${date.year}";

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

      arrFilterYearExpense.add(FilterExpensceModalYearWise(
          year: eachDate,
          amount: amt.toString(),
          arrExpenseModal: eachDateTrans));
    }
  }
}

class ChartDataYear {
  final DateTime year;
  final double sales;
  ChartDataYear(this.year, this.sales);
}
