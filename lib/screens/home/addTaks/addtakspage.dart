import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class AddTaksPage extends StatefulWidget {
  const AddTaksPage({super.key});

  @override
  State<AddTaksPage> createState() => _AddTaksPageState();
}

class _AddTaksPageState extends State<AddTaksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.category),
                  suffixIcon: Icon(Icons.memory),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.category),
                  suffixIcon: Icon(Icons.memory),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.category),
                  suffixIcon: Icon(Icons.memory),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    context: context,
                    builder: (context) {

                      return Container(
                          decoration: BoxDecoration(),
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4),
                         itemCount: 10,
                            itemBuilder: (context, index) {
                              var catagery;
                              return Text("${catagery[index]}");
                            },
                          ));
                    },
                  );
                },
                child: Text("data"))
          ],
        ),
      ),
    );
  }
}
