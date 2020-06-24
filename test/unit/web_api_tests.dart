import 'package:flutter_test/flutter_test.dart';
import 'package:musicboxflutter/repositories/web_api_impl.dart';

void main() {
  test('Request Library Json',() async {
    var webApiImpl = WebApiImpl();
    var response = await webApiImpl.requestLibraryJsonAsync();
    expect(response, isNotEmpty);
  });
}