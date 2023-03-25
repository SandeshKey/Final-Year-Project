import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Widget> _favproperties = [];

  List<Widget> get favproperties => _favproperties;

  void toggleFavorite(Widget favproperties) {
    final doesExist = _favproperties.contains(favproperties);

    if (doesExist) {
      _favproperties.remove(favproperties);
    } else {
      _favproperties.add(favproperties);
    }
    notifyListeners();
  }

  void clearFavorites() {
    _favproperties = [];
    notifyListeners();
  }
}
