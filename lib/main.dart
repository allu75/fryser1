import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/freezer_items.dart';
import './screens/items_list_screen.dart';
import './screens/add_item_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: FreezerItems(),
      child: MaterialApp(
          title: 'Fryseren',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            accentColor: Colors.amber,
          ),
          home: ItemsListScreen(),
          routes: {
            AddItemScreen.routeName: (ctx) => AddItemScreen(),
          }),
    );
  }
}
