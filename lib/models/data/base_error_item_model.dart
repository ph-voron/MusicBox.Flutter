class BaseErrorItemModel {
  String id;
  String status;
  String code;
  String title;

  BaseErrorItemModel({
    this.id,
    this.status,
    this.code,
    this.title
  });

  factory BaseErrorItemModel.fromJson(Map<String, dynamic> jsonMap) {
    return BaseErrorItemModel(
        id: jsonMap['id'],
        status: jsonMap['status'],
        code: jsonMap['code'],
        title: jsonMap['title']
    );
  }
}