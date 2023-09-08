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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
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
             /*  ColumnSeries<ChartData, DateTime.now()>(
                  opacity: 0.9,
                  width: 0.4,
                  dataSource: data,
                  xValueMapper: (datum, index) => datum.x,
                  yValueMapper: (datum, index) => datum.y) */
            ],
          ),
          hSpacher(hight: 20.0),
          Row(
            children: [buttom("Week"), wSpacher(width: 10.0), buttom("Month")],
          )
        ],
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

class ChartData {
  final int x;
  final double y;
  final double y1;
  ChartData(this.x, this.y, this.y1);
}
