import 'package:expense_app/database/db_helper.dart';

class ExpenseModal{

int exp_id;
int uid;
String exp_title;
String exp_desc;
num exp_amount;
num exp_balence;
int exp_typ;
int exp_cat;String exp_date;

ExpenseModal(
{required this.exp_id,
  required this.uid,
  required this.exp_title,
  required this.exp_desc,
  required this.exp_amount,
  required this.exp_balence,
  required this.exp_typ,
  required this.exp_cat,
  required this.exp_date});


Map<String, dynamic> toMap(){
  return {
    AppDatabase().EXPENSE_COLUM_ID: exp_id,
    AppDatabase().EXPENSE_COLUM_TITLE:exp_title
  };
}



}