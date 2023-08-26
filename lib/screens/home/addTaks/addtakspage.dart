import 'package:expense_app/ui_helper.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class AddTaksPage extends StatefulWidget {
  const AddTaksPage({super.key});

  @override
  State<AddTaksPage> createState() => _AddTaksPageState();
}

class _AddTaksPageState extends State<AddTaksPage> {
  List<String> addcard = ["Cardit", "Debit"];
  var titleController = TextEditingController();
  var descController = TextEditingController();
  var amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.edit),
                  // suffixIcon: Icon(Icons.memory),
                  hintText: "title",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: descController,

              /// minLines: 1,
              /// maxLines: 3,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.edit),
                  // suffixIcon: Icon(Icons.memory),
                  hintText: "Desc.....",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Ammount",
                  prefixIcon: Icon(Icons.monetization_on_sharp),
                  //suffixIcon: Icon(Icons.memory),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  onPressed: () {
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      context: context,
                      builder: (context) {
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4),
                          itemCount: AppConstants.catagery.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    child: Image.asset(
                                        AppConstants.catagery[index]['image']),
                                  ),
                                  Text(
                                      "${AppConstants.catagery[index]['name']}"),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  child: Text("Add Catagory")),
            ),
            // DropdownButton(items: [
            //   DropdownMenuItem(
            //     child: FilledButton.icon(
            //         onPressed: () {},
            //         icon: Icon(Icons.abc),
            //         label: Text("data")),
            //   ),
            //   DropdownMenuItem(
            //     child: FilledButton.icon(
            //         onPressed: () {},
            //         icon: Icon(Icons.abc),
            //         label: Text("data")),
            //   ),
            //   DropdownMenuItem(
            //     child: FilledButton.icon(
            //         onPressed: () {},
            //         icon: Icon(Icons.abc),
            //         label: Text("data")),
            //   )
            // ], onChanged: (value) {}),




          ],
        ),
      ),
    );
  }
}
