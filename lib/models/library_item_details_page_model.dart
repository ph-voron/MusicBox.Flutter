import 'package:flutter/foundation.dart';
import 'package:musicboxflutter/repositories/library_repository.dart';

import '../dependency_resolver.dart';
import 'data/library_item_model.dart';

class LibraryItemDetailsPageModel extends ChangeNotifier {

  final LibraryRepository _libraryRepository =
      Resolver.instance.libraryRepository;

  LibraryItemModel _item = LibraryItemModel();

  LibraryItemModel get item => _item;
  bool get isFavorite => _item?.isFavorite ?? false;

  void init(LibraryItemModel item) {
    _item = item;
  }

  void setFavorite(bool value) {
    _item.isFavorite = value;
    _libraryRepository.setFavorite(_item.id, value);
    notifyListeners();
  }

}