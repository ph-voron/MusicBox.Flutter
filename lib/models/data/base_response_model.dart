import 'package:musicboxflutter/exceptions/web_response_error.dart';

import 'base_error_item_model.dart';

class BaseResponseModel<DataType> {
  DataType data;
  List<BaseErrorItemModel> errors;
  dynamic meta;

  DataType mapDataType(dynamic item) {
    return null;
  }

  BaseResponseModel(Map<String, dynamic> jsonMap) {
    this.data = mapDataType(jsonMap['data']);
    this.errors = (jsonMap['errors'] as List)
        ?.map((e) => BaseErrorItemModel.fromJson(e))
        ?.toList() ?? List();
  }

  bool hasErrors()  => errors != null && errors.length > 0;

  void throwIfHasErrors() {
    if(hasErrors()) {
      throw WebResponseError(webErrors: errors);
    }
  }
}