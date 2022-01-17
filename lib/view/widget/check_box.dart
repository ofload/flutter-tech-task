import 'package:flutter/material.dart';
import 'package:tech_task/view/utils/colors.dart';


class AppCheckBox extends StatelessWidget {
  final bool isActive;

  const AppCheckBox({Key key, this.isActive}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive? kPrimaryColor: Colors.transparent,
        border: isActive? Border.all(style: BorderStyle.none): Border.all(color: kGrey),
      ),
    );
  }
}