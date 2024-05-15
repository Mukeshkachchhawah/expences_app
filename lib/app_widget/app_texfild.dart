import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppTextFil extends StatelessWidget {
  String text;

  String labelText;

  AppTextFil({
    super.key,
    required this.text,
    required this.labelText,
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
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            onTap: () {},
            validator: (value) {
              return null;
            },
            decoration: InputDecoration(
                labelText: labelText,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
