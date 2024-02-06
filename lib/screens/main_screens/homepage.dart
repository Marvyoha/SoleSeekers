import 'package:carbon_icons/carbon_icons.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sole_seekers/core/providers/services_provider.dart';

import '../../core/providers/db_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dbProvider = Provider.of<DatabaseProvider>(context, listen: false);
    final servicesProvider =
        Provider.of<ServicesProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(actions: [
          IconButton(
              onPressed: () {
                servicesProvider.signOut(context);
              },
              icon: Icon(CarbonIcons.logout))
        ]),
        body: FirestoreQueryBuilder(
            query: dbProvider.shoesDb.orderBy('id'),
            builder: (context, snapshot, _) {
              if (snapshot.isFetching) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text('Pagination Error: ${snapshot.error}');
              }
              return ListView.builder(
                itemCount: snapshot.docs.length,
                itemBuilder: (context, index) {
                  // if we reached the end of the currently obtained items, we try to
                  // obtain more items
                  if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
                    // Telling FirestoreQueryBuilder to try to obtain more items.
                    // It is safe to call this function from within the build method.
                    snapshot.fetchMore();
                  }

                  final item = snapshot.docs[index];
                  return ListTile(
                    title: Text(item['name']),
                    subtitle: Text(item['description']),
                    leading: Image.network(item['image']),
                    trailing: Text(item['id'].toString()),
                  );
                },
              );
            }));
  }
}
