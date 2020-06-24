import 'package:flutter/foundation.dart';

class LibraryItemModel with ChangeNotifier {
  bool _isFavorite;

  String id;
  String title;
  String artist;
  String year;
  String genre;
  String album;
  String playlist;
  String description;
  Uri imageUrl;

  bool get isFavorite => _isFavorite;
  set isFavorite(bool value) {
    _isFavorite = value;
    notifyListeners();
  }
}