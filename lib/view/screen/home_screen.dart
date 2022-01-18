import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_task/core/view_model/view_model.dart';
import 'package:tech_task/view/utils/colors.dart';
import 'package:tech_task/view/widget/button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<ViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pick a date',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  'Change date:',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: (){
                    _viewModel.pickDate(context);
                  },
                  child: Container(
                    key: Key("showDate"),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: kGrey)),
                    child: Row(
                      children: [
                        Consumer<ViewModel>(
                          builder: (context, ingredientViewModel, child) => Text(
                            ingredientViewModel.formatDate(),
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Icon(Icons.keyboard_arrow_down_sharp),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const Spacer(),
            AppButton(
              text: 'Get Ingredients',
              onTap: (){
                _viewModel.getIngredients(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
