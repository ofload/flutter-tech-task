class RecipeInterface {
  final String title;
  final List<dynamic> ingredients;

  RecipeInterface({this.title, this.ingredients});

  RecipeInterface.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        ingredients = json['ingredients'];

  Map<String, dynamic> toJson() => {'title': title, 'ingredients': ingredients};
}
