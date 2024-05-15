part of 'expense_bloc.dart';

@immutable
class ExpenseEvent {}

/// add expense
// ignore: must_be_immutable
class AddExpenseEvent extends ExpenseEvent {
  //  modal file to add ExpenseModal
  ExpenseModal newExpense;

  AddExpenseEvent({required this.newExpense});
}

/// fetch allExpense
class FetchAllExpenseEvent extends ExpenseEvent {}
