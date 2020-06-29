import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicboxflutter/nav_routes.dart';
import 'package:musicboxflutter/pages/library_item_details_page.dart';
import 'package:musicboxflutter/pages/main_page.dart';
import 'package:provider/provider.dart';

import 'models/library_item_details_page_model.dart';
import 'models/library_page_model.dart';

class MusicBoxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => LibraryPageModel()),
        ChangeNotifierProvider(create: (BuildContext context) => LibraryItemDetailsPageModel())
      ],
      child: MaterialApp(
        routes: {
          NavRoutes.mainPage: (context) =>  MainPage(),
          NavRoutes.libraryItemDetails: (context) => LibraryItemDetailsPage()
        },
      )
    );
  }
}