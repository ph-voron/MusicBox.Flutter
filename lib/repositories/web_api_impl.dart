import 'dart:convert';

import 'package:musicboxflutter/repositories/web_api.dart';
import 'package:http/http.dart' as http;

class WebApiImpl implements WebApi {

  final String _host = 'mockman.azurewebsites.net';

  @override
  Uri get coversPathUri => Uri.http(_host, '/musicbox/covers/');

  @override
  Future<String> requestLibraryJsonAsync() async {
    var uri = Uri.http(_host, '/musicbox/songs.json');
    var response = await http.get(uri);
    return utf8.decode(response.bodyBytes);
  }

}