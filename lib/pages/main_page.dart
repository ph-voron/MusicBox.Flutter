import 'package:flutter/material.dart';
import 'file:///D:/temp/%23projects/MusicBox/Flutter/musicbox_flutter/lib/models/data/tab_choice_model.dart';
import 'package:musicboxflutter/pages/library_page.dart';
import 'package:musicboxflutter/pages/profile_page.dart';

const List<TabChoiceModel> choices = const <TabChoiceModel>[
  const TabChoiceModel(title: "Library", icon: Icons.library_music, id: TabLibrary),
  const TabChoiceModel(title: 'Profile', icon: Icons.person, id: TabProfile),
];

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: choices.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Music Box"),
          bottom: TabBar(
            isScrollable: false,
            tabs: choices.map((TabChoiceModel choice) {
              return Tab(
                text: choice.title,
                icon: Icon(choice.icon),
              );
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: choices.map((TabChoiceModel choice) {
            return Padding(
              padding: EdgeInsets.all(10.0),
              child: _getTabWidgetById(choice.id),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _getTabWidgetById(int id) {
    switch(id) {
      case TabProfile:
        return ProfilePage();
      case TabLibrary:
      default:
        return LibraryPage();
    }
  }

}