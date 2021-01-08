import 'package:flutter/foundation.dart';
import 'dart:io';

import '../models/item.dart';
import '../helpers/db_helper.dart';

class FreezerItems with ChangeNotifier {
  List<Item> _items = [];

  List<Item> get items {
    return [..._items];
  }

  void addItem(
    String pickedTitle,
    File pickedImage,
  ) {
    final newItem = Item(
      id: DateTime.now().toString(),
      image: pickedImage,
      title: pickedTitle,
    );
    _items.add(newItem);
    notifyListeners();
    DBHelper.insert('freezer_items', {
      'id': newItem.id,
      'title': newItem.title,
      'image': newItem.image.path
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('freezer_items');
    _items = dataList
        .map(
          (item) => Item(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
          ),
        )
        .toList();
    notifyListeners();
  }
}
