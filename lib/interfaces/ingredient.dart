class IngredientInterface {
  final String title;
  final String useBy;
  final bool selected;

  IngredientInterface({this.title, this.useBy, this.selected});

  IngredientInterface.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        useBy = json['use-by'],
        selected = json['selected'] != null ? json['selected'] : false;

  Map<String, dynamic> toJson() =>
      {'title': title, 'use-by': useBy, 'selected': selected};
}
