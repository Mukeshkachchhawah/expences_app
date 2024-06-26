
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
      emit(ExpenseLoadingState());
      var check = await db.addNewNote(event.newExpense);
      if (check) {
        var data = await db.getAllExpense();
        emit(ExpenseLoadedState(arrExpenses: data));
      } else {
        emit(ExpenseErrorState(errorMsg: "Expense Not Added!!"));
      }
    });

    on<FetchAllExpenseEvent>((event, emit) async {
      emit(ExpenseLoadingState());
      var data = await db.getAllExpense();
      emit(ExpenseLoadedState(arrExpenses: data));
    });
  }
}
