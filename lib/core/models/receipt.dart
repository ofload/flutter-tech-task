class Recipe {
  String title;
  List<dynamic> ingredients;

  Recipe({
    this.title,
    this.ingredients,
  });



  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
    title: json["title"],
    ingredients: json["ingredients"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "ingredients": ingredients,
  };
}
