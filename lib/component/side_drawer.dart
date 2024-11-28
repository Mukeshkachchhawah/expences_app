import 'package:expense_app/component/custom_listTile.dart';
import 'package:expense_app/utils/app_colors.dart';
import 'package:expense_app/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class SideDrawerView extends StatelessWidget {
  const SideDrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(color: AppColors.redColors),
          ),
          hSpace(),
          CustomListTile(
            leading: Icon(Icons.light_mode),
            title: "Theme Mode",
            subtitle: "Dark & Light Mode",
            onTap: () {},
          ),
          hSpace(),
          CustomListTile(
              leading: Icon(Icons.help), title: 'Help', subtitle: "Help")
        ],
      ),
    );
  }
}
