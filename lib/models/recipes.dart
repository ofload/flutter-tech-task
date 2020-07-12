import 'package:sqflite/sqflite.dart';
import 'model.dart';

class RecipeModel extends Model {
  String table = 'recipes';

  final String id;
  final String title;
  final String ingredients;
  final String date;

  RecipeModel({this.id, this.title, this.ingredients, this.date});

  // Convert a recipe into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'ingredients': ingredients, 'date': date};
  }

  // Define a function that inserts recipes into the database
  Future<void> insert(RecipeModel recipe) async {
    // Get a reference to the database.
    final Database db = await database();

    // Insert the recipe into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same recipe is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      table,
      recipe.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the recipes from the recipes table.
  Future<List<RecipeModel>> getAll() async {
    // Get a reference to the database.
    final Database db = await database();

    // Query the table for all The recipes.
    final List<Map<String, dynamic>> maps = await db.query(table);

    // Convert the List<Map<String, dynamic> into a List<recipe>.
    return List.generate(maps.length, (i) {
      return RecipeModel(
          id: maps[i]['id'],
          title: maps[i]['title'],
          ingredients: maps[i]['ingredients'],
          date: maps[i]['date']);
    });
  }

  Future<void> update(RecipeModel recipe) async {
    // Get a reference to the database.
    final db = await database();

    // Update the given recipe.
    await db.update(table, recipe.toMap(),
        // Ensure that the recipe has a matching id.
        where: "id = ?",
        // Pass the recipe's id as a whereArg to prevent SQL injection.
        whereArgs: [recipe.id]);
  }

  Future<void> delete(int id) async {
    // Get a reference to the database.
    final db = await database();

    // Remove the recipe from the Database.
    await db.delete(table,
        // Use a `where` clause to delete a specific recipe.
        where: "id = ?",
        // Pass the recipe's id as a whereArg to prevent SQL injection.
        whereArgs: [id]);
  }
}
