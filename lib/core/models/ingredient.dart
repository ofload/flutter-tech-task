
class Ingredient {
  String title;
  String useBy;
  bool isSelected = false;
  bool isExpired = false;

  Ingredient({
    this.title,
    this.useBy,
    this.isSelected,
    this.isExpired,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
    title: json["title"],
    useBy: json["use-by"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "use-by": useBy,
  };
}