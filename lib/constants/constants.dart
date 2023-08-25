import 'package:expense_app/constants/image_constants.dart';

class Constants {
  //// dummy data ///
  static const List<Map<String, dynamic>> transaction = <Map<String, dynamic>>[
    {
      'date': 'today',
      'amount': "120",
      'dayTransaction': [
        {'title': 'Dog', 'subtitle': 'treat', 'amount': '50'},
        {'title': 'Dog', 'subtitle': 'treat', 'amount': '50'},
        {'title': 'Dog', 'subtitle': 'treat', 'amount': '50'}
      ]
    },
    {
      'date': 'yesterday',
      'amount': "500",
      'dayTransaction': [
        {'title': 'rravel', 'subtitle': 'treat', 'amount': '50'},
        {'title': 'shoping', 'subtitle': 'treat', 'amount': '360'},
        {'title': 'movie', 'subtitle': 'treat', 'amount': '90'}
      ]
    },
    {
      'date': '19-08-2023',
      'amount': "500",
      'dayTransaction': [
        {'title': 'rravel', 'subtitle': 'treat', 'amount': '50'},
        {'title': 'shoping', 'subtitle': 'treat', 'amount': '360'},
        {'title': 'movie', 'subtitle': 'treat', 'amount': '90'}
      ]
    },
  ];
}

class AppConstants {
  static final app_name = "Expenser";

  static const List<Map<String, dynamic>> catagery = [
    // imgPath = "assets/icon/";
    {"id": "1", "name": "car", "image": ImageConstants.carimg},
    {"id": "1", "name": "car", "image": "{assets/expense_icon/car.png"},
    {"id": "1", "name": "car", "image": "{assets/expense_icon/car.png"},
    {"id": "1", "name": "car", "image": "{assets/expense_icon/car.png"},
    {"id": "1", "name": "car", "image": "{assets/expense_icon/car.png"}
  ];
}
