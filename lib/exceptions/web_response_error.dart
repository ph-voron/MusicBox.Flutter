import 'package:musicboxflutter/models/data/base_error_item_model.dart';

class WebResponseError implements Exception {
  List<BaseErrorItemModel> webErrors;

  WebResponseError({this.webErrors});
}