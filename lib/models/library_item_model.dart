import 'package:flutter/foundation.dart';

class LibraryItemModel with ChangeNotifier {
  bool _isFavorite;

  String id;
  String title;
  String artist;
  String year;
  String genre;
  String album;
  String playlist;
  String description;
  Uri imageUrl;

  bool get isFavorite => _isFavorite;
  set isFavorite(bool value) {
    _isFavorite = value;
    notifyListeners();
  }

  LibraryItemModel({
    this.title,
    this.id,
    this.album,
    this.artist,
    this.description,
    this.genre,
    this.imageUrl,
    this.playlist,
    this.year
  });

  factory LibraryItemModel.fromJson(Map<String, dynamic> jsonMap) {
    return LibraryItemModel(
      id: jsonMap['id'],
      title: jsonMap['title'],
      album: jsonMap['album'],
      artist: jsonMap['artist'],
      description: jsonMap['description'],
      genre: jsonMap['genre'],
      imageUrl: jsonMap['imageUrl'],
      playlist: jsonMap['playlist'],
      year: jsonMap['year']
    );
  }
}