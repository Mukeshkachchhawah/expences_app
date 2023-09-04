import 'package:expense_app/modal/expense_modal.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../modal/user_modal.dart';

class AppDatabase {
  var USER_TABLE = "user";
  var USER_COLUMN_ID = "uid";
  var USER_COLUMN_EMAIL = "email";
  var USER_COLUMN_PASSWORD = "password";

  /// Expence Data
/*   var EXPENSE_TABLE = "expense";
  // var USER_COLUMN_ID = "uid";
  var EXPENSE_COLUM_ID = "exp_id";
  var EXPENSE_COLUM_TITLE = "exp_title";
  var EXPENSE_COLUM_DESC = "exp_desc";
  var EXPENSE_COLUM_AMOUNT = "exp_amount";
  var EXPENSE_COLUM_BALENCE = "exp_balence";
  var EXPENSE_COLUM_TYPE = "exp_typ"; // 0 for debit card and 1 for credit card
  var EXPENSE_COLUM_CATGERY_ID = "exp_cat_id";
  var EXPENSE_COLUM_CATGERY_DATE = "exp_date"; // current milli stared here
 */

  var EXPENSE_TABLE = "expense";
//var USER_COLUMN_ID = "uid";
  var EXPENSE_COLUMN_ID = "exp_id";
  var EXPENSE_COLUMN_TITLE = "exp_title";
  var EXPENSE_COLUMN_DESC = "exp_desc";
  var EXPENSE_COLUMN_AMT = "exp_amt";
  var EXPENSE_COLUMN_BAL = "exp_bal";
  var EXPENSE_COLUMN_TYPE = "exp_type"; //0 for debit & 1 for credit
  var EXPENSE_COLUMN_CAT_ID = "exp_cat_id";
  var EXPENSE_COLUMN_DATE = "exp_date"; //current milli stored here

  Future<Database> openDB() async {
    //directory path
    var mDirectory = await getApplicationDocumentsDirectory();

    //created the path
    await mDirectory.create(recursive: true);

    var dbPath = "$mDirectory/mainDB.db";

    return await openDatabase(dbPath, version: 1, onCreate: (db, version) {
      var createTableQuery =
          "create table $USER_TABLE ( $USER_COLUMN_ID integer primary key autoincrement, $USER_COLUMN_EMAIL text unique, $USER_COLUMN_PASSWORD text)";
      var expenseTableQuery =
                "create table $EXPENSE_TABLE ( $EXPENSE_COLUMN_ID integer primary key autoincrement, $USER_COLUMN_ID integer, $EXPENSE_COLUMN_TITLE text, $EXPENSE_COLUMN_DESC text, $EXPENSE_COLUMN_AMT real, $EXPENSE_COLUMN_BAL real, $EXPENSE_COLUMN_TYPE integer, $EXPENSE_COLUMN_CAT_ID integer, $EXPENSE_COLUMN_DATE text)";

         // "create table $EXPENSE_TABLE ( $EXPENSE_COLUM_ID integer primary key autoincrement, $USER_COLUMN_ID integer, $EXPENSE_COLUM_TITLE text, $EXPENSE_COLUM_DESC text, $EXPENSE_COLUM_AMOUNT real, $EXPENSE_COLUM_BALENCE real, $EXPENSE_COLUM_TYPE integer, $EXPENSE_COLUM_CATGERY_ID integer, $EXPENSE_COLUM_CATGERY_DATE text)";
      db.execute(createTableQuery);
      db.execute(expenseTableQuery);
    });
  }

  Future<bool> createUser(UserModel user) async {
    var db = await openDB();
    if (await checkIfEmailAlreadyExists(user.email)) {
      return false;
    } else {
      var check = await db.insert(USER_TABLE, user.toMap());
      return check > 0;
    }
  }

  Future<bool> checkIfEmailAlreadyExists(String email) async {
    var db = await openDB();

    var check = await db
        .query(USER_TABLE, where: "$USER_COLUMN_EMAIL = ?", whereArgs: [email]);
    return check.isNotEmpty;
  }

  Future<bool> authenticateUser(
      {required String email, required String password}) async {
    var db = await openDB();
    var check = await db.query(USER_TABLE,
        where: "$USER_COLUMN_EMAIL = ? and $USER_COLUMN_PASSWORD = ?",
        whereArgs: [email, password]);
    return check.isNotEmpty;
  }

  //reset password
  //forget password

  Future<bool> forgetPassword(String email) async {
    return await checkIfEmailAlreadyExists(email);
  }

  Future<bool> resetPassword(String newPassword, String email) async {
    var db = await openDB();
    var check = await db.update(USER_TABLE, {USER_COLUMN_PASSWORD: newPassword},
        where: "$USER_COLUMN_EMAIL = ?", whereArgs: [email]);
    return check > 0;
  }

  //// function in Expense App /////
  ///add New Expense

  Future<bool> addNewNote(ExpenseModal newExpense) async {
    var db = await openDB();
    var check = await db.insert(EXPENSE_TABLE, newExpense.toMap());

    return check > 0;
  }

  Future<List<ExpenseModal>> getAllExpense() async {
    var db = await openDB();
    List<Map<String, dynamic>> expense = await db.query(EXPENSE_TABLE);

    List<ExpenseModal> arrExpense = [];

    for (Map<String, dynamic> eachExpense in expense) {
      var eacModal = ExpenseModal.fromMap(eachExpense);
      arrExpense.add(eacModal);
    }
    return arrExpense;
  }
}

//// Expence Funtion
