abstract class FavoritesRepository {
  Future<List<String>> getAllFavoriteItems();
  Future<void> addFavorite(String id);
  Future<void> removeFavorite(String id);
}