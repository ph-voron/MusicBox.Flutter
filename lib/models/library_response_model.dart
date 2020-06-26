import 'package:flutter/cupertino.dart';
import 'package:musicboxflutter/models/base_response_model.dart';
import 'package:musicboxflutter/models/library_item_model.dart';

class LibraryResponseModel extends BaseResponseModel<List<LibraryItemModel>> {
  LibraryResponseModel(Map<String, dynamic> jsonMap) : super(jsonMap);

  @override
  List<LibraryItemModel> mapDataType(dynamic item) {
    return (item as List)
        ?.map((e) => LibraryItemModel.fromJson(e))
        ?.toList() ?? List();
  }
}