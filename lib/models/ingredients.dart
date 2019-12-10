class Ingredients {
  final String title;
  final String useBy;

  Ingredients.fromJson(Map<String, dynamic> parsedJson)
    : title = parsedJson["title"],
      useBy = parsedJson["use-by"];
}