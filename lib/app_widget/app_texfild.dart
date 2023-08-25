import 'package:flutter/material.dart';

class App_TextFild extends StatelessWidget {
  String text;

  String lebletext;



  App_TextFild({
    super.key,
    required this.text,
    required this.lebletext,
   
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            onTap: () {},
            validator: (value) {
              
            },
            decoration: InputDecoration(
                labelText: lebletext,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
