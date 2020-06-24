import 'package:flutter/material.dart';
import 'package:musicboxflutter/logging/log_impl.dart';
import 'package:musicboxflutter/repositories/library_repository_impl.dart';
import 'package:musicboxflutter/repositories/web_api_impl.dart';

import 'app.dart';

void main() {
  var log = LogImpl();
  var webApiSingleton = WebApiImpl();
  var libRepoSingleton = LibraryRepositoryImpl(webApi: webApiSingleton);
  runApp(MusicBoxApp(
    log: log,
    libraryRepository: libRepoSingleton,
  ));
}
