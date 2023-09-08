import 'package:expense_app/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _GrafState();
}

class _GrafState extends State<Setting> {
  final List<ChartDataYear> Years = [
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
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
                    Text("803.92",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500)),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Total spent this month",
                      style: TextStyle(fontSize: 15),
                    ),
                    wSpacher(width: 10.0),
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 235, 167, 162),
                      radius: 10,
                      child: Icon(
                        Icons.arrow_upward,
                        size: 15,
                        color: Colors.red,
                      ),
                    ),
                    wSpacher(width: 5.0),
                    Text(
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
                  dataSource: Years,
                  xValueMapper: (datum, index) => datum.year,
                  yValueMapper: (datum, index) => datum.sales,
                )
              ],
            ),
            hSpacher(hight: 20.0),
            Row(
              children: [
                buttom("Month"),
                wSpacher(width: 10.0),
                buttom("Year")
              ],
            )
          ],
        ),
      ),
    );
  }

  buttom(String text) {
    return Container(
      height: 50,
      width: 100,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(10)),
      child: Center(child: Text(text)),
    );
  }
}

class ChartDataYear {
  final DateTime year;
  final double sales;
  ChartDataYear(this.year, this.sales);
}
