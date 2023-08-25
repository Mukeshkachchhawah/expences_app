
import 'package:expense_app/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:time_chart/time_chart.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _GrafState();
}

class _GrafState extends State<Setting> {
   final data = [
    DateTimeRange(
      start: DateTime(2021,2,24,23,15),
      end: DateTime(2021,2,25,7,30),
    ),
    DateTimeRange(
      start: DateTime(2021,2,22,1,55),
      end: DateTime(2021,2,22,9,12),
    ),
    DateTimeRange(
      start: DateTime(2021,2,20,0,25),
      end: DateTime(2021,2,20,7,34),
    ),
    DateTimeRange(
      start: DateTime(2021,2,17,21,23),
      end: DateTime(2021,2,18,4,52),
    ),
    DateTimeRange(
      start: DateTime(2021,2,13,6,32),
      end: DateTime(2021,2,13,13,12),
    ),
    DateTimeRange(
      start: DateTime(2021,2,1,9,32),
      end: DateTime(2021,2,1,15,22),
    ),
    DateTimeRange(
      start: DateTime(2021,1,22,12,10),
      end: DateTime(2021,1,22,16,20),
    ),
  ];
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
                            style:
                                TextStyle(fontSize: 30, color: Colors.black54)),
                        wSpacher(width: 2.0),
                        Text(
                          "803.92",
                         style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500)
                        ),
                       
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
                      child: Icon(Icons.arrow_upward, size: 15,color: Colors.red,),
                    ),
                    wSpacher(width: 5.0),
                    Text("1%", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 17),)
                        ],
                      ),
                  ],
     
                    
                ),
                  /* Text('Weekly time chart'),
                  TimeChart(
                    data: data,
                    viewMode: ViewMode.weekly,
                  ), */
     
                  TimeChart(
                    data: data,
                    chartType: ChartType.amount,
                    viewMode: ViewMode.monthly,
                    barColor: Colors.deepPurple,
                  ),
                  hSpacher(hight: 20.0),
                  Row(children: [
                    buttom("Week"),
                    wSpacher(width: 10.0),
                    buttom("Month")
                  ],)
        ],
       ),
     ),
    );
  }
  buttom(String text){
    return Container(
      height: 50,
      width: 100,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red
        ),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(child: Text(text)),
    );
  }
}
