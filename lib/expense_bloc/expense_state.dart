part of 'expense_bloc.dart';

@immutable
abstract class ExpenseState {}

class ExpenseInitialState extends ExpenseState {}

class ExpenseLodingState extends ExpenseState {}

class ExpenseLoadedState extends ExpenseState {
  // Check Database folder
//// check getAllData fache ListTpes
  List<ExpenseModal> arrExpenses;
  ExpenseLoadedState({required this.arrExpenses});
}

class ExpenseErroState extends ExpenseState {
  String erroMaess;
  ExpenseErroState({required this.erroMaess});
}
