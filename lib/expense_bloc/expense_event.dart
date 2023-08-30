part of 'expense_bloc.dart';

@immutable
class ExpenseEvent {}

/// add expense
class AddExpenseEvent extends ExpenseEvent {
  //  modal file to add ExpenseModal
  ExpenseModal newExpense;

  AddExpenseEvent({required this.newExpense});
}

/// fatchallExpense
class FatchAllExpenseEvent extends ExpenseEvent {}
