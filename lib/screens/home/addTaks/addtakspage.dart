import 'package:expense_app/expense_bloc/expense_bloc.dart';
import 'package:expense_app/modal/expense_modal.dart';
import 'package:expense_app/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => SleetedCard();
}

class SleetedCard extends State<AddTaskPage> {
  var titleController = TextEditingController();
  var descController = TextEditingController();
  var amountController = TextEditingController();

  // var SeletededCard = -1;

  List<String> arrTransactionCardTypes = ["Debit", "Credit"];
  String selectTransactionCardtypes = "Debit";

  var selectCat = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        //  iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "New Transaction",
          // style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.edit),
                  // suffixIcon: Icon(Icons.memory),
                  hintText: "title",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            hSpacer(),
            TextField(
              controller: descController,

              /// minLines: 1,
              /// maxLines: 3,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.edit),
                  // suffixIcon: Icon(Icons.memory),
                  hintText: "Desc.....",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Amount",
                  prefixIcon: const Icon(Icons.monetization_on_sharp),
                  //suffixIcon: Icon(Icons.memory),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(
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
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        context: context,
                        builder: (context) {
                          return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4),
                            itemCount: AppConstants.category.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: InkWell(
                                  onTap: () {
                                    /// select image show bottom sheet
                                    selectCat = index;
                                    setState(() {});
                                    Navigator.pop(context);
                                  },
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        /// drop down image and text show
                                        child: Image.asset(AppConstants
                                            .category[index]['image']),
                                      ),
                                      Text(
                                          "${AppConstants.category[index]['name']}"),
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
                    /// select category >=0 hai to add image or name
                    child: selectCat >= 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppConstants.category[selectCat]['image'],
                                width: 30,
                              ),
                              wSpacer(width: 10.0),
                              Text(AppConstants.category[selectCat]['name'])
                            ],
                          )
                        : const Text("Chose Category"))),
            DropdownButton(
              /// default value in dropdown value
              value: selectTransactionCardtypes,
              items: arrTransactionCardTypes.map((e) {
                return DropdownMenuItem(
                  child: Text(e),
                  value: e,
                );
              }).toList(),
              onChanged: (value) {
                selectTransactionCardtypes = value!;
                setState(() {});
              },
            ),
            const SizedBox(
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
                              exp_type:
                                  selectTransactionCardtypes == "Debit" ? 0 : 1,
                              cat_id: int.parse(
                                  AppConstants.category[selectCat]['id']),
                              date: DateTime.now().toString())));
                      Navigator.pop(context);
                    },
                    child: const Text('Add Transaction')))
          ],
        ),
      ),
    );
  }
}
