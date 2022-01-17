import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tech_task/core/view_model/ingredients_vm.dart';

final List providers = <SingleChildWidget>[

  ChangeNotifierProvider(create: (_) => IngredientsViewModel()),
];
