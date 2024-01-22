import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../models/shoes_model.dart';

class DatabaseProvider extends ChangeNotifier {
  List<Item> _fullDb = [];
  DocumentSnapshot? _lastDocument;
  bool _hasMoreItems = true;

  List<Item> get fullDb => _fullDb;
  bool get hasMoreItems => _hasMoreItems;

  Future<List<Item>> getItems() async {
    if (!_hasMoreItems) return [];

    Query query = FirebaseFirestore.instance
        .collection('catalogs')
        .orderBy('id')
        .limit(12);
    if (_lastDocument != null) {
      query = query.startAfterDocument(_lastDocument!);
      debugPrint('Database Log: Fetching another query.');
    }

    var snapshot = await query.get();
    if (snapshot.docs.isEmpty) {
      debugPrint('Database Log: No remaining items.');
      _hasMoreItems = false;
      return [];
    }

    _lastDocument = snapshot.docs.last;

    var items = snapshot.docs.map((doc) {
      return Item(
        id: doc['id'],
        image: doc['image'],
        description: doc['description'],
        price: doc['price'],
        gender: doc['gender'],
        brand: doc['brand'],
        name: doc['name'],
      );
    }).toList();

    _fullDb.addAll(items);
    debugPrint('Database Log: Data has been fetched.');
    notifyListeners();
    return items;
  }
}
