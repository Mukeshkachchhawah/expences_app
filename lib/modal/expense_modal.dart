import 'package:expense_app/database/db_helper.dart';

class ExpenseModal {
  int? exp_id;
  int uid;
  String exp_title;
  String exp_desc;
  num exp_amt;
  num exp_bal;
  int cat_id;
  int exp_type;
  String date;

  ExpenseModal(
      {   this.exp_id,
      required this.uid,
      required this.exp_title,
      required this.exp_desc,
      required this.exp_amt,
      required this.exp_bal,
      required this.cat_id,
      required this.exp_type,
      required this.date});

  factory ExpenseModal.fromMap(Map<String, dynamic> map) {
    return ExpenseModal(
       exp_id: map[AppDatabase().EXPENSE_COLUMN_ID],
        uid: map[AppDatabase().USER_COLUMN_ID],
        exp_title: map[AppDatabase().EXPENSE_COLUMN_TITLE],
        exp_desc: map[AppDatabase().EXPENSE_COLUMN_DESC],
        exp_amt: map[AppDatabase().EXPENSE_COLUMN_AMT],
        exp_bal: map[AppDatabase().EXPENSE_COLUMN_BAL],
        cat_id: map[AppDatabase().EXPENSE_COLUMN_CAT_ID],
        exp_type: map[AppDatabase().EXPENSE_COLUMN_TYPE],
        date: map[AppDatabase().EXPENSE_COLUMN_DATE]);
  }

  Map<String, dynamic> toMap() {
    return {
        AppDatabase().EXPENSE_COLUMN_ID: exp_id,
        AppDatabase().USER_COLUMN_ID: uid,
        AppDatabase().EXPENSE_COLUMN_TITLE: exp_title,
        AppDatabase().EXPENSE_COLUMN_DESC: exp_desc,
        AppDatabase().EXPENSE_COLUMN_AMT: exp_amt,
        AppDatabase().EXPENSE_COLUMN_BAL: exp_bal,
        AppDatabase().EXPENSE_COLUMN_TYPE: exp_type,
        AppDatabase().EXPENSE_COLUMN_CAT_ID: cat_id,
        AppDatabase().EXPENSE_COLUMN_DATE: date,
    };
  }
}
