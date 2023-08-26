import 'package:expense_app/screens/home/addTaks/addtakspage.dart';
import 'package:expense_app/ui_helper.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    var dummyData = Constants.transaction;
    return Scaffold(
      body: Padding(
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
                    child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTaksPage()));
                        },
                        child: Icon(Icons.add)),
                  ),
                ),
              ),
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
                            style:
                                TextStyle(fontSize: 30, color: Colors.black54)),
                        wSpacher(width: 2.0),
                        Text(
                          "295",
                          style: TextStyle(
                              fontSize: 60, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          ".95",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
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
                    itemCount: dummyData.length,
                    itemBuilder: (_, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 68,right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(dummyData[index]['date'], style: textStyles18(),),
                                Text("\$${dummyData[index]['amount']}"),
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
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: (dummyData[index]['dayTransaction']
                                      as List<Map<String, dynamic>>)
                                  .length,
                              itemBuilder: (_, childIndex) {
                                var chilData = dummyData[index]
                                        ['dayTransaction'][childIndex]
                                    as Map<String, dynamic>;
                               
                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(chilData['imge']),
                                  ),
                                  title: Text(chilData['name']),
                                  subtitle: Text(chilData['subtitle']),
                                  trailing: Column(
                                    children: [
                                      Text(chilData['amount']), Text(chilData['trilExpence']),
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
      ),
    );
  }
}
