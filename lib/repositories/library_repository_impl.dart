import 'package:musicboxflutter/models/library_item_model.dart';
import 'package:musicboxflutter/repositories/library_repository.dart';
import 'package:musicboxflutter/repositories/web_api.dart';

class LibraryRepositoryImpl implements LibraryRepository {

  final WebApi webApi;

  LibraryRepositoryImpl({this.webApi});

  @override
  Future<LibraryItemModel> findByIdAsync(String id) {
    // TODO: implement findByIdAsync
    throw UnimplementedError();
  }

  @override
  Future<List<LibraryItemModel>> getAllAsync() {
    // TODO: implement getAllAsync
    throw UnimplementedError();
  }

}