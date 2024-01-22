import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/shoes_model.dart';
import '../providers/db_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dbProvider = Provider.of<DatabaseProvider>(context, listen: false);

    return Scaffold(
      body: FutureBuilder(
        future: dbProvider.getItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (snapshot.hasData) {
              var items = snapshot.data as List<Item>;
              return NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollInfo) {
                  if (scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                    dbProvider.getItems(); // Fetch next batch of items
                  }
                  return true;
                },
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    if (index == items.length) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    var item = items[index];
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text(item.id.toString()),
                      leading: Image.network(item.image),
                      trailing: Text(item.price.toString()),
                    );
                  },
                ),
              );
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
