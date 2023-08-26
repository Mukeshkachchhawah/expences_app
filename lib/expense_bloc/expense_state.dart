part of 'expense_bloc.dart';

@immutable
abstract class ExpenseState {}

class ExpenseInitialState extends ExpenseState {}

class ExpenseLodingState extends ExpenseState {}

class ExpenseLoadedState extends ExpenseState {
  // Check Database folder
//// check getAllData fache ListTpes
  List<ExpenseModal> lodedExpenses;
  ExpenseLoadedState({required this.lodedExpenses});
}

class ExpenseErroState extends ExpenseState {
  String erroExpenses;
  ExpenseErroState({required this.erroExpenses});
}
