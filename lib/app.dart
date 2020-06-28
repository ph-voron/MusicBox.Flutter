import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicboxflutter/nav_routes.dart';
import 'package:musicboxflutter/pages/main_page.dart';
import 'package:provider/provider.dart';

import 'models/library_page_model.dart';

class MusicBoxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => LibraryPageModel())
      ],
      child: MaterialApp(
        routes: {
          NavRoutes.mainPage: (context) {
            return MainPage();
          }
        },
      )
    );
  }
}