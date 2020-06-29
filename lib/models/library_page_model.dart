import 'package:flutter/foundation.dart';
import 'package:musicboxflutter/dependency_resolver.dart';
import 'package:musicboxflutter/repositories/library_repository.dart';

import 'data/library_item_model.dart';

class LibraryPageModel extends ChangeNotifier {

  List<LibraryItemModel> _response = List();

  List<LibraryItemModel> get response => _response;

  final LibraryRepository _libraryRepository =
      Resolver.instance.libraryRepository;

  LibraryPageModel();

  Future<void> refreshRequest() async {
    _response = await _libraryRepository.getAllAsync();
    notifyListeners();
  }

  Future<void> setItemFavorite(String id, bool value) async {
    var existed = _response.firstWhere((e) => e.id == id, orElse: null);
    existed?.isFavorite = value;
    await _libraryRepository.setFavorite(id, value);
    notifyListeners();
  }
}