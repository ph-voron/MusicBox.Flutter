import 'package:flutter/foundation.dart';
import 'package:musicboxflutter/dependency_resolver.dart';
import 'package:musicboxflutter/repositories/library_repository.dart';

import 'data/library_item_model.dart';

class LibraryPageModel extends ChangeNotifier {

  List<LibraryItemModel> _response = List();
  List<String> _favorites = List();

  List<LibraryItemModel> get response => _response;

  final LibraryRepository _libraryRepository =
      Resolver.instance.libraryRepository;

  LibraryPageModel();

  Future<void> refreshRequest() async {
    var items = await _libraryRepository.getAllAsync();
    _response = items.map((e) {
      e.isFavorite = _favorites.contains(e.id);
      return e;
    }).toList();
    notifyListeners();
  }

  void setItemFavorite(String id, bool value) {
    var item = _response.firstWhere((e) => e.id == id, orElse: null);
    item?.isFavorite = value;
    if(!_favorites.contains(id))
      _favorites.add(id);
    notifyListeners();
  }
}