import 'logging/log.dart';
import 'logging/log_impl.dart';
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

  Log get log => _log;
  WebApi get webApi => _webApi;

  LibraryRepository get libraryRepository => _libraryRepository;

  Resolver._(){
    _libraryRepository = LibraryRepositoryImpl(webApi: webApi);
  }



}