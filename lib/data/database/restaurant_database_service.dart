import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:sqflite/sqflite.dart';

class RestaurantDatabaseService {
  static const String _databaseName = "restaurant-app.db";
  static const String _tableName = "restaurant";
  static const int _version = 1;

  Future<void> createTable(Database database) async {
    await database.execute(
        """CREATE TABLE $_tableName(
        id TEXT PRIMARY KEY,
        name TEXT,
        description TEXT,
        city TEXT,
        pictureId TEXT,
        rating DOUBLE
      )
      """
    );
  }

  Future<Database> _initialDb() async {
    return openDatabase(
      _databaseName,
      version: _version,
      onCreate: (Database database, int version) async {
        await createTable(database);
      }
    );
  }

  Future<int> insertItem(Restaurant restaurant) async {
    final db = await _initialDb();

    final data = restaurant.toJson();
    final id = await db.insert(
      _tableName,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace
    );
    return id;
  }

  Future<List<Restaurant>> getAllItems() async {
    final db = await _initialDb();
    final result = await db.query(_tableName);

    return result.map((result) => Restaurant.fromJson(result)).toList();
  }

  Future<Restaurant> getItemById(String id) async {
    final db = await _initialDb();
    final result = await db.query(_tableName, where: "id = ?", whereArgs: [id], limit: 1);

    return result.map((result) => Restaurant.fromJson(result)).first;
  }

  Future<void> removeItem(String id) async {
    final db = await _initialDb();
    await db.delete(_tableName, where: "id = ?", whereArgs: [id]);
  }
}