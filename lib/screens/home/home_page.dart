import 'package:expense_app/constants/constants.dart';
import 'package:expense_app/expense_bloc/expense_bloc.dart';
import 'package:expense_app/modal/expense_modal.dart';
import 'package:expense_app/modal/filtereExpense_modal.dart';
import 'package:expense_app/screens/home/addTaks/addtakspage.dart';
import 'package:expense_app/screens/onbording/user_account/login_page.dart';
import 'package:expense_app/theme_provider/theme_provider.dart';
import 'package:expense_app/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// arrFilterExpense ko global kar date hain jise puri ui me excce kar sakte hain
  List<FilterExpensceModal> arrFilterExpensceModal = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ExpenseBloc>().add(FetchAllExpenseEvent());
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense"),
        actions: [
          // handle dart theme and light theme
          Switch(
            value: context.watch<ThemeProvider>().themeValue,
            onChanged: (value) {
              context.read<ThemeProvider>().themeValue = value;
            },
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreenView(),
                      ));
                },
                child: const Text("Log Out"))
          ],
        ),
      ),
      body: BlocBuilder<ExpenseBloc, ExpenseState>(
        builder: (context, state) {
          if (state is ExpenseLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ExpenseErrorState) {
            return Center(child: Text(state.errorMsg));
          } else if (state is ExpenseLoadedState) {
            var arrData = state.arrExpenses;
            getDateWishTransaction(arrData);
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  children: [
                    hSpacer(),
                    SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: Card(
                        //   color: Colors.red,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Spent this Week",
                              style: TextStyle(fontSize: 15),
                            ),
                            Align(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("\$",
                                      style: TextStyle(
                                          fontSize: 30, color: Colors.black54)),
                                  wSpacer(width: 2.0),
                                  const Text(
                                    "000",
                                    style: TextStyle(
                                        fontSize: 60,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Text(
                                    ".00",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    hSpacer(),
                    arrFilterExpensceModal.isNotEmpty
                        ? customListView()
                        : const Text("Expanses is empty"),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),

      floatingActionButton: FloatingActionButton(
        tooltip: 'Add New Expenses',
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddTaskPage(),
              ));
        },
        child: const Icon(Icons.add),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }

  Widget customListView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      reverse: true,
      itemCount: arrFilterExpensceModal.length,
      itemBuilder: (_, index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Date:- ${arrFilterExpensceModal[index].date}",
                    style: textStyles18(),
                  ),
                  Text(
                    "Amount:- ${arrFilterExpensceModal[index].amount}",
                    style: textStyles16(),
                  ),
                ],
              ),
            ),
            hSpacer(),
            // Divider(
            //   color: Colors.black,
            //   height: 1,
            // ),
            ListView.builder(
                shrinkWrap: true,
                reverse: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: arrFilterExpensceModal[index].arrExpenseModal.length,
                itemBuilder: (_, childIndex) {
                  var arreach =
                      arrFilterExpensceModal[index].arrExpenseModal[childIndex];

                  var image = AppConstants.category.firstWhere((element) =>
                      element['id'] == arreach.cat_id.toString())['image'];

                  return ListTile(
                    leading: CircleAvatar(
                      child: Image.asset(image),
                    ),
                    title: Text(arreach.exp_title),
                    subtitle: Text(arreach.exp_desc),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("\$ ${arreach.exp_amt}"),
                        const Text("Debit")
                      ],
                    ),
                  );
                })
          ],
        );
      },
    );
  }

  /// date wish transaction
  void getDateWishTransaction(List<ExpenseModal> data) {
    arrFilterExpensceModal.clear();
    List<String> arrUniqueDate = [];
    for (ExpenseModal eachExpenseTrans in data) {
      var date = DateTime.parse(eachExpenseTrans.date);
      var eachDate =
          "${date.day}-${date.month.toString().length < 2 ? "0${date.month}" : date.month}-${date.year}";
      print(eachDate);
      if (!arrUniqueDate.contains(eachDate)) {
        arrUniqueDate.add(eachDate);
      }
    }
    print(arrUniqueDate);
    for (String eachDate in arrUniqueDate) {
      List<ExpenseModal> eachDateTransition = [];
      num amount = 0;
      for (ExpenseModal eachTransition in data) {
        var date = DateTime.parse(eachTransition.date);
        var mDate =
            "${date.day}-${date.month.toString().length < 2 ? "0${date.month}" : date.month}-${date.year}";
        if (eachDate == mDate) {
          eachDateTransition.add(eachTransition);
          if (eachTransition.exp_type == 0) {
            amount -= eachTransition.exp_amt;
          } else {
            amount += eachTransition.exp_amt;
          }
        }
      }
      arrFilterExpensceModal.add(FilterExpensceModal(
          date: eachDate,
          amount: amount.toString(),
          arrExpenseModal: eachDateTransition));
    }
  }
}
