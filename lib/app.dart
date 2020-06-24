import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicboxflutter/nav_routes.dart';
import 'package:musicboxflutter/pages/main_page.dart';
import 'package:musicboxflutter/repositories/library_repository.dart';

import 'logging/log.dart';

class MusicBoxApp extends StatefulWidget {

  final Log log;
  final LibraryRepository libraryRepository;

  MusicBoxApp({this.log, this.libraryRepository});

  @override
  State<StatefulWidget> createState() {
    return MusicBoxAppState();
  }

}

class MusicBoxAppState extends State<MusicBoxApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        NavRoutes.mainPage: (context) {
          return MainPage();
        }
      },
    );
  }

}