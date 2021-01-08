import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './add_item_screen.dart';
import '../providers/freezer_items.dart';

class ItemsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Fryseren'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddItemScreen.routeName);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<FreezerItems>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<FreezerItems>(
                child: Center(
                  child: Text('Der er ikke noget i fryseren.\nLad os fylde noget i!'),
                ),
                builder: (ctx, freezerItems, ch) => freezerItems.items.length <= 0
                    ? ch
                    : ListView.builder(
                        itemCount: freezerItems.items.length,
                        itemBuilder: (ctx, i) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage: FileImage(
                              freezerItems.items[i].image,
                            ),
                          ),
                          title: Text(freezerItems.items[i].title),
                          onTap: () {
                            // Go to detail page...
                          },
                        ),
                      ),
              ),
      ),
    );
  }
}
