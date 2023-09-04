import 'package:expense_app/expense_bloc/expense_bloc.dart';
import 'package:expense_app/modal/expense_modal.dart';
import 'package:expense_app/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/constants.dart';

class AddTaksPage extends StatefulWidget {
  const AddTaksPage({super.key});

  @override
  State<AddTaksPage> createState() => _AddTaksPageState();
}

class _AddTaksPageState extends State<AddTaksPage> {
  var titleController = TextEditingController();
  var descController = TextEditingController();
  var amountController = TextEditingController();

  // var SeletededCard = -1;

  List<String> arrTransactionCardTypes = ["Debit", "Credit"];
  String seletRrasactionCardtypes = "Debit";

  var selectcat = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("New Transaction"),
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
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.grey),
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
                                child: InkWell(
                                  onTap: () {
                                    /// selet image show bottom sheet
                                    selectcat = index;
                                    setState(() {});
                                    Navigator.pop(context);
                                  },
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        /// drop down image and text show
                                        child: Image.asset(AppConstants
                                            .catagery[index]['image']),
                                      ),
                                      Text(
                                          "${AppConstants.catagery[index]['name']}"),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    //logic in chose category
                    /// select category >=0 hain to add image or name
                    child: selectcat >= 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppConstants.catagery[selectcat]['image'],
                                width: 30,
                              ),
                              wSpacher(width: 10.0),
                              Text(AppConstants.catagery[selectcat]['name'])
                            ],
                          )
                        : Text("Chose Category"))),
            DropdownButton(
              /// difalut value in dropdown value
              value: seletRrasactionCardtypes,
              items: arrTransactionCardTypes.map((e) {
                return DropdownMenuItem(
                  child: Text(e),
                  value: e,
                );
              }).toList(),
              onChanged: (value) {
                seletRrasactionCardtypes = value!;
                setState(() {});
              },
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      context.read<ExpenseBloc>().add(AddExpenseEvent(
                          newExpense: ExpenseModal(
                              uid: 1,
                              exp_title: titleController.text.toString(),
                              exp_desc: descController.text.toString(),
                              exp_amt:
                                  int.parse(amountController.text.toString()),
                              exp_bal: 0,
                              exp_id: int.parse(
                                  AppConstants.catagery[selectcat]['id']),
                              exp_type:
                                  seletRrasactionCardtypes == "debit" ? 0 : 1,
                              cat_id: int.parse(
                                  AppConstants.catagery[selectcat]['id']),
                              date: DateTime.now().toString())));
                      Navigator.pop(context);
                    },
                    child: Text('Add Transaction')))
          ],
        ),
      ),
    );
  }
}
