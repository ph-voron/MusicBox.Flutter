import 'package:flutter/material.dart';

import '../app_styles.dart';
import '../main_theme.dart';

class LibraryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LibraryPageState();
}

class LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return Future(() {});
      },
      child: _buildList(),
    );
  }

  Widget _buildList() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
              borderOnForeground: true,
              child: Container(
                height: 80,
                width: double.infinity,
                color: MainTheme.colorGray1,
                padding: EdgeInsets.only(left: 3, top: 1, right: 3, bottom: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(width: 2, height: double.infinity, color: MainTheme.colorPrimary, margin: EdgeInsets.only(right: 5),),
                    Container(margin: EdgeInsets.only(right: 5),
                        child: Image.network("http://mockman.azurewebsites.net/musicbox/covers/1.jpg")),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Title",
                            style: AppTextStyles.labelPrimary,),
                          Text("Description",
                            style: AppTextStyles.labelSecondary,)
                        ],
                      ),
                    ),
                    Flex(
                      direction: Axis.vertical,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.favorite, color: MainTheme.colorPrimary),
                          onPressed: () {  },)
                      ],
                    )
                  ],
                ),
              ));
        });
  }
}