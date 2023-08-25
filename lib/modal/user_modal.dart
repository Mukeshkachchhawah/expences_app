

import '../database/db_helper.dart';

class UserModel {
  int? uid;
  String email;
  String password;

  UserModel({
    this.uid,
    required this.email,
    required this.password,

  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        uid: map[AppDatabase().USER_COLUMN_ID],
        email: map[AppDatabase().USER_COLUMN_EMAIL],
        password: map[AppDatabase().USER_COLUMN_PASSWORD]
    );
  }

  Map<String,dynamic> toMap(){
    return {
      AppDatabase().USER_COLUMN_ID:uid,
      AppDatabase().USER_COLUMN_EMAIL:email,
      AppDatabase().USER_COLUMN_PASSWORD:password,


    };
  }
}
