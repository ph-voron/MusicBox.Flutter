import 'package:musicboxflutter/models/base_error_item_model.dart';

class WebResponseError implements Exception {
  List<BaseErrorItemModel> webErrors;

  WebResponseError({this.webErrors});
}