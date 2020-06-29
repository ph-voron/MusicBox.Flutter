import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:musicboxflutter/models/data/library_item_model.dart';
import 'package:musicboxflutter/models/library_item_details_page_model.dart';
import 'package:provider/provider.dart';

import '../app_styles.dart';
import '../main_theme.dart';

class LibraryItemDetailsPage extends StatelessWidget {

  LibraryItemDetailsPageModel _model;

  @override
  Widget build(BuildContext context) {
    final LibraryItemModel item = ModalRoute.of(context).settings.arguments;
    _model = Provider.of<LibraryItemDetailsPageModel>(context, listen: false);
    _model.init(item);
    return Consumer<LibraryItemDetailsPageModel>(builder:
        (BuildContext context, LibraryItemDetailsPageModel value, Widget child) {
      return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 300,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      background: Image.network(item.imageUrl,
                        fit: BoxFit.cover,
                      )),
                ),
              ];
            },
            body: ListView(
              padding: EdgeInsets.all(15),
              children: <Widget>[
                Text(
                  item.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.labelTitle1,),
                Container(
                  height: 45,
                  margin: EdgeInsets.only(bottom: 10, top: 10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: MainTheme.colorPrimary,
                            borderRadius: BorderRadius.all(Radius.circular(24))
                        ),
                        width: 45,
                        height: 45,
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.only(right: 20),
                        child: Image.asset('assets/images/ic_musicbox_white.png'),),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(item.artist, textAlign: TextAlign.start, style: AppTextStyles.labelPrimary,),
                            Text(item.album, style: AppTextStyles.labelSecondary)
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                Text(item.description ?? '', style: AppTextStyles.labelSecondary,)
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              _model.setFavorite(!_model.isFavorite);
            },
            child: _model.item.isFavorite ?
            Icon(Icons.favorite, color: MainTheme.colorPrimary):
            Icon(Icons.favorite_border, color: Colors.black,),
            backgroundColor: Colors.white,
          )
      );
    });
  }
}