import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:sole_seekers/models/shoes_model.dart';

class DatabaseProvider extends ChangeNotifier {
  get fullDb => getItems();

  Future<List<Item>> getItems() async {
    var items = <Item>[];

    var snapshot =
        await FirebaseFirestore.instance.collection('catalogs').limit(5).get();

    for (var doc in snapshot.docs) {
      items.add(Item(
          id: doc['id'],
          image: doc['image'],
          description: doc['description'],
          price: doc['price'],
          gender: doc['gender'],
          brand: doc['brand'],
          name: doc['name']));
    }
    items.shuffle();
    if (kDebugMode) {
      print('Items fetched.');
    }
    return items;
  }

  // List<ShoesModel> _shuffled = [];
  // List<ShoesModel> get shuffled => _shuffled;

  // Future<void> shuffleShoes() async {
  //   var raw = allShoes();
  //   _shuffled = [];
  //   _shuffled = raw as List<ShoesModel>;
  //   _shuffled.shuffle();
  // }

  // Future<List<ShoesModel>> allShoes() async {
  //   final snapshot =
  //       await FirebaseFirestore.instance.collection('catalogs').limit(10).get();
  //   final allShoes =
  //       snapshot.docs.map((e) => ShoesModel.fromSnapshot(e)).toList();
  //   if (kDebugMode) {
  //     print(allShoes);
  //   }
  //   return allShoes;
  // }

  // List<Map<String, dynamic>>? _shoeDb = [];
  // List<Map<String, dynamic>>? _shuffledDb = [];

  // List<Map<String, dynamic>>? get shoeDb => _shoeDb;
  // List<Map<String, dynamic>>? get shuffledDb => _shuffledDb;

  // Future<void> getShoeDb() async {
  //   try {
  //     var collection = await FirebaseFirestore.instance
  //         .collection('catalogs')
  //         .limit(10)
  //         .get();
  //     _shoeDb = [];
  //     for (var element in collection.docs) {
  //       _shoeDb!.add(element.data());
  //     }
  //     debugPrint(_shoeDb.toString());
  //     notifyListeners();
  //   } on FirebaseException catch (e) {
  //     debugPrint('Firebase Error: ${e.message}');
  //   }
  // }

  // Future<List<Map<String, dynamic>>?> updateShoeDb() async {
  //   getShoeDb();
  //   _shuffledDb = [];
  //   _shuffledDb = _shoeDb;
  //   _shuffledDb!.shuffle();
  //   return _shuffledDb;
  // }
}
