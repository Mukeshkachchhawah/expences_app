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

class FilterExpensceModalMonthWise {
  String Month;
  String amount;
  List<ExpenseModal> arrExpenseModal;

  FilterExpensceModalMonthWise(
      {required this.Month,
      required this.amount,
      required this.arrExpenseModal});
}

class FilterExpensceModalYearWise {
  String year;
  String amount;
  List<ExpenseModal> arrExpenseModal;

  FilterExpensceModalYearWise(
      {required this.year,
      required this.amount,
      required this.arrExpenseModal});
}
