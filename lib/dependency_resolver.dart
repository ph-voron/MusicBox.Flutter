import 'logging/log.dart';
import 'logging/log_impl.dart';
import 'repositories/favorites_repository.dart';
import 'repositories/favorites_repository_impl.dart';
import 'repositories/library_repository_impl.dart';
import 'repositories/web_api.dart';
import 'repositories/web_api_impl.dart';
import 'repositories/library_repository.dart';

class Resolver{
  static Resolver _resolver;
  static Resolver get instance => _resolver = _resolver ?? Resolver._();

  final Log _log = LogImpl();
  final WebApi _webApi = WebApiImpl();
  LibraryRepository _libraryRepository;
  final FavoritesRepository _favoritesRepository = FavoritesRepositoryImpl();

  Log get log => _log;
  WebApi get webApi => _webApi;

  LibraryRepository get libraryRepository => _libraryRepository;
  FavoritesRepository get favoritesRepository => _favoritesRepository;

  Resolver._(){
    _libraryRepository = LibraryRepositoryImpl(
        webApi: webApi, favRepo: _favoritesRepository);
  }



}