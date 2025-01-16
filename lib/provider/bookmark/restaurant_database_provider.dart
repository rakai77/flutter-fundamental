import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/data/database/restaurant_database_service.dart';
import 'package:restaurant_app/data/model/restaurant.dart';

class RestaurantDatabaseProvider extends ChangeNotifier {

  final RestaurantDatabaseService _databaseService;

  RestaurantDatabaseProvider(this._databaseService);

  String _message = "";
  String get message => _message;

  List<Restaurant>? _restaurantList;
  List<Restaurant>? get restaurantList => _restaurantList;

  Restaurant? _restaurant;
  Restaurant? get restaurant => _restaurant;

  Future<void> saveRestaurantValue(Restaurant value) async {
    try {
      final result = await _databaseService.insertItem(value);
      final isError = result == 0;
      if(isError) {
        _message = "Failed to save your data";
        notifyListeners();
      } else {
        _message = "Your data is saved";
        notifyListeners();
      }
    } catch (e) {
      _message = "Failed to save your data";
      notifyListeners();
    }
  }

  Future<void> loadAllRestaurantValue() async {
    try {
      _restaurantList = await _databaseService.getAllItems();
      _message = "All of your data is loaded";
      notifyListeners();
    } catch (e) {
      _message = "Failed to load your all data";
      notifyListeners();
    }
  }

  Future<void> loadRestaurantValueById(String id) async {
    try {
      _restaurant = await _databaseService.getItemById(id);
      _message = "Your data is loaded";
      notifyListeners();
    } catch (e) {
      _message = "Failed to load your data";
      notifyListeners();
    }
  }

  Future<void> removeRestaurantValueById(String id) async {
    try {
      await _databaseService.removeItem(id);
      _message = "Your data is removed";
      notifyListeners();
    } catch (e) {
      _message = "Failed to remove your data";
      notifyListeners();
    }
  }

}