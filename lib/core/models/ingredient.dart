
class Ingredient {
  String title;
  String useBy;
  bool isSelected;
  bool isExpired;

  Ingredient({
    this.title,
    this.useBy,
    this.isSelected= false,
    this.isExpired= false,
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