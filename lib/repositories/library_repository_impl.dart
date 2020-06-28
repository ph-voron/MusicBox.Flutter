import 'dart:convert';

import 'package:musicboxflutter/models/data/library_item_model.dart';
import 'package:musicboxflutter/models/data/library_response_model.dart';
import 'library_repository.dart';
import 'web_api.dart';

class LibraryRepositoryImpl implements LibraryRepository {

  final WebApi webApi;

  LibraryRepositoryImpl({this.webApi});

  LibraryItemModel _transform(LibraryItemModel source) {
    source.imageUrl = '${webApi.coversPathUri.toString()}${source.id}.jpg';
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
    var responseModel = LibraryResponseModel(json.decode(response));
    responseModel?.throwIfHasErrors();
    return responseModel?.data?.map((e) => _transform(e))?.toList();
  }

}