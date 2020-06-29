import 'favorites_repository.dart';

class FavoritesRepositoryImpl extends FavoritesRepository {

  List<String> _favList = List();

  @override
  Future<List<String>> getAllFavoriteItems() async {
    return _favList;
  }

  @override
  Future<void> addFavorite(String id) async {
    if(_favList.contains(id)) return;
    _favList.add(id);
  }

  @override
  Future<void> removeFavorite(String id) async {
    var index = _favList.indexOf(id);
    if(index > -1)
      _favList.removeAt(index);
  }

  @override
  Future<bool> checkItemFavorite(String id) async {
    return _favList.contains(id);
  }

}