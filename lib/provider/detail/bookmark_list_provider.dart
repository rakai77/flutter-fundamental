import 'package:flutter/widgets.dart';
import '../../data/model/restaurant.dart';

class BookmarkListProvider extends ChangeNotifier {
  final List<Restaurant> _bookmarkList = [];

  List<Restaurant> get bookmarkList => _bookmarkList;

  void addBookmark(Restaurant value) {
    _bookmarkList.add(value);
    notifyListeners();
  }

  void removeBookmark(Restaurant value) {
    _bookmarkList.removeWhere((element) => element.id == value.id);
    notifyListeners();
  }

  bool checkItemBookmark(Restaurant value) {
    final restaurantList = _bookmarkList.where((element) => element.id == value.id);
    return restaurantList.isNotEmpty;
  }
}