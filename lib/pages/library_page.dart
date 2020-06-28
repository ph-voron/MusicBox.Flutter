import 'package:flutter/material.dart';
import 'package:musicboxflutter/dependency_resolver.dart';
import 'package:musicboxflutter/logging/log.dart';
import 'package:musicboxflutter/models/data/library_item_model.dart';
import 'package:musicboxflutter/models/library_page_model.dart';
import 'package:provider/provider.dart';

import '../app_styles.dart';
import '../main_theme.dart';

class LibraryPage extends StatelessWidget {

  LibraryPageModel _libraryPageModel;

  @override
  Widget build(BuildContext context) {
    _libraryPageModel = Provider.of<LibraryPageModel>(context, listen: false);
    _libraryPageModel.refreshRequest();
    return RefreshIndicator(
      onRefresh: _libraryPageModel.refreshRequest,
      child: _buildList(),
    );
  }
  Widget _buildList() {
    return Consumer<LibraryPageModel>(builder:
        (BuildContext context, LibraryPageModel value, Widget child) {
      return ListView.builder(
          itemCount: value.response.length,
          itemBuilder: (context, index) {
            return _buildListRow(value.response[index]);
          });
    });
  }

  Widget _buildListRow(LibraryItemModel item) {
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
              Container(width: 80, height: 80, color: Colors.grey, margin: EdgeInsets.only(right: 5),
                  child: Image.network(item.imageUrl)),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(item.title,
                      style: AppTextStyles.labelPrimary,),
                    Text(item.artist,
                      style: AppTextStyles.labelSecondary,)
                  ],
                ),
              ),
              Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  _buildFavButton(item)
                ],
              )
            ],
          ),
        ));
  }

  Widget _buildFavButton(LibraryItemModel item) {
    return IconButton(
      icon: item.isFavorite ?
      Icon(Icons.favorite, color: MainTheme.colorPrimary) :
      Icon(Icons.favorite_border),
      onPressed: () {
        _libraryPageModel.setItemFavorite(
            item.id, !item.isFavorite);
      },);
  }
}