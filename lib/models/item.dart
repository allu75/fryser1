import 'dart:io';

import 'package:flutter/foundation.dart';

class Item {
  final String id;
  final String title;
  final File image;

  Item({
    @required this.id,
    @required this.title,
    @required this.image,
  });
}
