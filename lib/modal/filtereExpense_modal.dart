import 'package:expense_app/modal/expense_modal.dart';

class FilterExpensceModal {
  String date;
  String amount;
  List<ExpenseModal> arrExpenseModal;

  FilterExpensceModal(
      {required this.date,
      required this.amount,
      required this.arrExpenseModal});
}
