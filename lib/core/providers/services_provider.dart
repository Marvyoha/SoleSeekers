import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class ServicesProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? docId;
  Map<String, dynamic>? _currentUserDoc;
  bool _loader = false;

  //Getters
  FirebaseFirestore? get firestore => _firestore;
  FirebaseAuth? get auth => _auth;
  User? get user => _auth.currentUser;
  Map<String, dynamic>? get currentUserDoc => _currentUserDoc;
  bool get loader => _loader;

  set loader(bool newLoader) {
    _loader = newLoader;
  }

  set currentUserDoc(Map<String, dynamic>? newUserDoc) {
    _currentUserDoc = newUserDoc;
  }

// Firebase Authentication functions
  Future<void> signIn(
      String email, String password, BuildContext context) async {
    loader = true;
    notifyListeners();
    try {
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      // To check if the user is valid
      auth?.authStateChanges().listen((user) {
        if (user != null) {
          // Navigate to home
          Navigator.pushReplacementNamed(
            context,
            'homePage',
          );
        }
      });
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      debugPrint('Authentication Error: [${e.code}]' + ' ${e.message}');
      // Fluttertoast.showToast(
      //     msg: '${e.message}',
      //     gravity: ToastGravity.TOP,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.black,
      //     fontSize: 20.sp);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          content: Center(
            child: Text(
              e.message!,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      );
      notifyListeners();
    }
    loader = false;
    notifyListeners();
  }

  Future<void> signUp(String email, String password, String confirmPassword,
      String fullname, BuildContext context) async {
    loader = true;
    notifyListeners();
    if (confirmPassword == password) {
      try {
        await _auth.createUserWithEmailAndPassword(
            email: email.trim(), password: password.trim());

        storeUserDetails(email: email, fullname: fullname);

        signOut(context);

        notifyListeners();
      } on FirebaseAuthException catch (e) {
        debugPrint('Authentication Error: [${e.code}]' + ' ${e.message}');

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
            content: Center(
              child: Text(
                e.message!,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
        notifyListeners();
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.white,
          content: Center(
            child: Text(
              'Password does not match',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      );
    }
    loader = false;
    notifyListeners();
  }

  Future<void> resetPassword(String email, BuildContext context) async {
    loader = true;
    notifyListeners();
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.white,
          content: Center(
            child: Text(
              'Password reset link sent, check your email',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      );
      Future.delayed(const Duration(milliseconds: 2500), () {
        Navigator.pushReplacementNamed(context, 'login');
      });
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      debugPrint('Authentication Error: ${e.message}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Center(
            child: Text(
              e.message!,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      );
      notifyListeners();
    }
    loader = false;
    notifyListeners();
  }

  Future<void> signOut(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushReplacementNamed(context, 'login');
    notifyListeners();
  }

// Firebase Cloud firestore functions
  Future<void> storeUserDetails(
      {required String email, required String fullname}) async {
    try {
      await firestore?.collection('users').add({
        'email': email.trim(),
        'name': fullname.trim(),
        'isFavorited': [],
        'checkout': [],
        'purchased': [],
      });
    } on FirebaseException catch (e) {
      debugPrint('Database Error: [${e.code}]' + ' ${e.message}');
    }
  }

  Future<void> updateUserDetails({
    required String? documentId,
    required String? fullname,
  }) async {
    try {
      getCurrentUserDoc();
      if (documentId != null) {
        await firestore?.collection('users').doc(documentId).update({
          'name': fullname?.trim(),
        });
      }
    } on FirebaseException catch (e) {
      debugPrint('Database Error: [${e.code}]' + ' ${e.message}');
    }
  }

  Future<Map<String, dynamic>?> getCurrentUserDoc() async {
    try {
      var collection = await firestore?.collection('users').get();
      if (collection != null) {
        for (var element in collection.docs) {
          if (element['email'] == user?.email) {
            docId = element.id;
            _currentUserDoc = element.data();
            break;
          }
        }
      }
    } on FirebaseException catch (e) {
      debugPrint('Database Error: [${e.code}]' + ' ${e.message}');
    }
    return currentUserDoc;
  }

  Future<void> deleteUser() async {
    try {
      firestore?.collection('users').doc(docId).delete();
      currentUserDoc = {};
      docId = '';
      user?.delete();
    } on FirebaseException catch (e) {
      debugPrint('Deletion Error: [${e.code}]' + ' ${e.message}');
    }
  }
}
