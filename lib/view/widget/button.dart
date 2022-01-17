
import 'package:flutter/material.dart';
import 'package:tech_task/view/utils/colors.dart';

class AppButton extends StatelessWidget {

  const AppButton({Key key, this.onTap, this.text}) : super(key: key);


  final VoidCallback onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: kPrimaryColor,
        ),
        child: Center(
            child: Text(text,
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: kWhite))),
      ),
    );
  }
}
