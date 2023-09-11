import 'package:expense_app/app_widget/chartData.dart';
import 'package:expense_app/modal/expense_modal.dart';
import 'package:expense_app/modal/filtereExpense_modal.dart';
import 'package:expense_app/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Graf extends StatefulWidget {
  const Graf({super.key});

  @override
  State<Graf> createState() => _GrafState();
}

class _GrafState extends State<Graf> {
  List<ChartData> data = [
    ChartData(2010, 35, 23),
    ChartData(2011, 38, 49),
    ChartData(2012, 34, 12),
    ChartData(2013, 52, 33),
    ChartData(2014, 40, 30)
  ];

  List<FilterExpensceModalMonthWise> arrExpensceModalMonth = [];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
                        style: TextStyle(fontSize: 30, color: Colors.black54)),
                    wSpacher(width: 2.0),
                    Text("295.95",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500)),
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
                      backgroundColor: Color.fromARGB(255, 183, 233, 184),
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
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("KDfja"),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void getMonthWiseTrasation(List<ExpenseModal> data) {
    List<String> arrUiqueDate = [];
    for (ExpenseModal eachExpensce in data) {
      var date = DateTime.parse(eachExpensce.date);
      var eachMonth =
          "${date.month}- ${date.month.toString().length < 2 ? "0 ${date.month}" : date.month} -${date.year}";

      print(eachMonth);

      if (!arrUiqueDate.contains(eachMonth)) {
        arrUiqueDate.add(eachMonth);
      }
    }
    print(arrUiqueDate);
    for (String eachMonth in arrUiqueDate) {
      List<ExpenseModal> eachMonthTrans = [];
      num amount = 0;

      for (ExpenseModal eachTrans in data) {
        var month = DateTime.parse(eachTrans.date);
        var mmonthWise =
            "${month.day}- ${month.month.toString().length < 2 ? "0 ${month.month}" : month.month}-${month.year}";

        if (eachMonth == mmonthWise) {
          eachMonthTrans.add(eachTrans);

          if (eachTrans.exp_type == 0) {
            amount -= eachTrans.exp_amt;
          } else {
            amount += eachTrans.exp_amt;
          }
        }
      }
      arrExpensceModalMonth.add(FilterExpensceModalMonthWise(
          Month: eachMonth,
          amount: amount.toString(),
          arrExpenseModal: eachMonthTrans));
    }
  }
}
