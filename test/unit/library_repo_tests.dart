import 'package:flutter_test/flutter_test.dart';
import 'package:musicboxflutter/repositories/library_repository_impl.dart';
import 'package:musicboxflutter/repositories/web_api_impl.dart';

void main() {
  test('Request All Items',() async {
    var webApiImpl = WebApiImpl();
    var libRepo = LibraryRepositoryImpl(webApi: webApiImpl);
    var response = await libRepo.getAllAsync();
    expect(response, isNotEmpty);
  });

  test('Request Existed Single Item',() async {
    var webApiImpl = WebApiImpl();
    var libRepo = LibraryRepositoryImpl(webApi: webApiImpl);
    var response = await libRepo.findByIdAsync('10');
    expect(response, isNotNull);
  });

  test('Request Not Existed Single Item',() async {
    var webApiImpl = WebApiImpl();
    var libRepo = LibraryRepositoryImpl(webApi: webApiImpl);
    var response = await libRepo.findByIdAsync('99999');
    expect(response, isNull);
  });
}