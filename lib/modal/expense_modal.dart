import 'package:expense_app/database/db_helper.dart';

class ExpenseModal {
  int? exp_id;
  int? uid;
  String exp_title;
  String exp_desc;
  num exp_amount;
  num exp_balence;
  int exp_typ;
  int exp_cat;
  String exp_date;

  ExpenseModal(
      {this.exp_id,
      this.uid,
      required this.exp_title,
      required this.exp_desc,
      required this.exp_amount,
      required this.exp_balence,
      required this.exp_typ,
      required this.exp_cat,
      required this.exp_date});

  factory ExpenseModal.toform(Map<String, dynamic> map) {
    return ExpenseModal(
        exp_id: map[AppDatabase().EXPENSE_COLUM_ID],
        uid: map[AppDatabase().USER_COLUMN_ID],
        exp_title: map[AppDatabase().EXPENSE_COLUM_TITLE],
        exp_desc: map[AppDatabase().EXPENSE_COLUM_DESC],
        exp_amount: map[AppDatabase().EXPENSE_COLUM_AMOUNT],
        exp_balence: map[AppDatabase().EXPENSE_COLUM_BALENCE],
        exp_typ: map[AppDatabase().EXPENSE_COLUM_TYPE],
        exp_cat: map[AppDatabase().EXPENSE_COLUM_CATGERY_ID],
        exp_date: map[AppDatabase().EXPENSE_COLUM_CATGERY_DATE]);
  }

  Map<String, dynamic> toMap() {
    return {
      AppDatabase().EXPENSE_COLUM_ID: exp_id,
      AppDatabase().USER_COLUMN_ID: uid,
      AppDatabase().EXPENSE_COLUM_TITLE: exp_title,
      AppDatabase().EXPENSE_COLUM_DESC: exp_desc,
      AppDatabase().EXPENSE_COLUM_AMOUNT: exp_amount,
      AppDatabase().EXPENSE_COLUM_BALENCE: exp_balence,
      AppDatabase().EXPENSE_COLUM_TYPE: exp_typ,
      AppDatabase().EXPENSE_COLUM_CATGERY_ID: exp_cat,
      AppDatabase().EXPENSE_COLUM_CATGERY_DATE: exp_date
    };
  }
}
