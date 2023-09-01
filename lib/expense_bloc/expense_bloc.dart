import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:expense_app/database/db_helper.dart';
import 'package:meta/meta.dart';

import '../modal/expense_modal.dart';

part 'expense_event.dart';
part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  AppDatabase db;
  ExpenseBloc({required this.db}) : super(ExpenseInitialState()) {
    on<AddExpenseEvent>((event, emit) async {
      emit(ExpenseLodingState());
      var check = await db.addNewNote(event.newExpense);
      if (check) {
        var data = await db.getAllExpense();
        emit(ExpenseLoadedState(arrExpenses: data));
      } else {
        emit(ExpenseErroState(erroMaess: "not added"));
      }
    });

    on<FatchAllExpenseEvent>((event, emit) async {
      var data = await db.getAllExpense();
      emit(ExpenseLoadedState(arrExpenses: data));
    });
  }
}
