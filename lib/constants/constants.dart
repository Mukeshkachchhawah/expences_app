import 'package:expense_app/constants/image_constants.dart';

class Constants {
  //// dummy data ///
  static const List<Map<String, dynamic>> transaction = <Map<String, dynamic>>[
    {
      'date': 'today',
      'amount': "120",
      'dayTransaction': [
        {
          'imge': 'https://cdn-icons-png.flaticon.com/512/616/616408.png',
          'subtitle': 'treat',
          'amount': '50',
          'name': "text",
          'trilExpence': '2.55\$'
        },
        {
          'imge': 'https://cdn-icons-png.flaticon.com/512/616/616408.png',
          'subtitle': 'treat',
          'amount': '50',
          'name': "text",
          'trilExpence': '2.55\$'
        },
      ]
    },
    {
      'date': 'yesterday',
      'amount': "120",
      'dayTransaction': [
        {
          'imge': 'https://cdn-icons-png.flaticon.com/512/616/616408.png',
          'subtitle': 'treat',
          'amount': '50',
          'name': "text",
          'trilExpence': '2.55\$'
        },
        {
          'imge': 'https://cdn-icons-png.flaticon.com/512/616/616408.png',
          'subtitle': 'treat',
          'amount': '50',
          'name': "text",
          'trilExpence': '2.55\$'
        },
      ]
    },
    {
      'date': '16-03-2023',
      'amount': "120",
      'dayTransaction': [
        {
          'imge': 'https://cdn-icons-png.flaticon.com/512/616/616408.png',
          'subtitle': 'treat',
          'amount': '50',
          'name': "text",
          'trilExpence': '2.55\$'
        },
        {
          'imge': 'https://cdn-icons-png.flaticon.com/512/616/616408.png',
          'subtitle': 'treat',
          'amount': '50',
          'name': "text",
          'trilExpence': '2.55\$'
        },
      ]
    },

  ];
}

class AppConstants {
  static final app_name = "Expenser";

  static const List<Map<String, dynamic>> catagery = [
    {"id": "1", "name": "car", "image": ImageConstants.carimg},
    {"id": "2", "name": "car", "image": ImageConstants.cokaimg},
    {"id": "3", "name": "car", "image": ImageConstants.flaytimg},
    {"id": "4", "name": "car", "image": ImageConstants.frenchimg},
    {"id": "5", "name": "car", "image": ImageConstants.helicopatr},
    {"id": "6", "name": "car", "image": ImageConstants.movieimg},
    {"id": "7", "name": "car", "image": ImageConstants.popcornimg},
    {"id": "8", "name": "car", "image": ImageConstants.shoppingimg},
    {"id": "9", "name": "car", "image": ImageConstants.train},
    {"id": "10", "name": "car", "image": ImageConstants.travelingimg}
  ];
}
