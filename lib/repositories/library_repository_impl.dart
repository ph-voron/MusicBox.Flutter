import 'dart:convert';

import 'package:musicboxflutter/models/data/library_item_model.dart';
import 'package:musicboxflutter/models/data/library_response_model.dart';
import 'package:musicboxflutter/repositories/favorites_repository.dart';
import 'library_repository.dart';
import 'web_api.dart';

class LibraryRepositoryImpl implements LibraryRepository {

  final WebApi webApi;
  final FavoritesRepository favRepo;

  LibraryRepositoryImpl({this.webApi, this.favRepo});

  LibraryItemModel _transform(List<String> favorites, LibraryItemModel source) {
    source.imageUrl = '${webApi.coversPathUri.toString()}${source.id}.jpg';
    source.isFavorite = favorites.contains(source.id);
    return source;
  }

  @override
  Future<LibraryItemModel> findByIdAsync(String id) async {
    var library = await getAllAsync();
    return library.firstWhere((element) => element.id == id,
        orElse: () => null);
  }

  @override
  Future<List<LibraryItemModel>> getAllAsync() async {
    var response = await webApi.requestLibraryJsonAsync();
    var favorites = await favRepo.getAllFavoriteItems();
    var responseModel = LibraryResponseModel(json.decode(response));
    responseModel?.throwIfHasErrors();
    return responseModel?.data?.map((e) => _transform(favorites, e))?.toList();
  }

  @override
  Future<void> setFavorite(String id, bool value) async {
    if(value) {
      await favRepo.addFavorite(id);
    } else {
      await favRepo.removeFavorite(id);
    }
  }

}