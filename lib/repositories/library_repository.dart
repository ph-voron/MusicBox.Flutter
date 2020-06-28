
import 'package:musicboxflutter/models/data/library_item_model.dart';

abstract class LibraryRepository {
  Future<List<LibraryItemModel>> getAllAsync();
  Future<LibraryItemModel> findByIdAsync(String id);
}