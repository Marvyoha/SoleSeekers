import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../models/shoes_model.dart';

class DatabaseProvider extends ChangeNotifier {
  final _shoesDb = FirebaseFirestore.instance
      .collection('catalogs')
      .withConverter<Item>(
          fromFirestore: (snapshot, _) => Item.fromJson(snapshot.data()!),
          toFirestore: (item, _) => item.toJson());

  CollectionReference<Item> get shoesDb => _shoesDb;
}
