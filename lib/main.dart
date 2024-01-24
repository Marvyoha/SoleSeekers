import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:sole_seekers/firebase_options.dart';
import 'package:sole_seekers/providers/db_provider.dart';
import 'package:sole_seekers/providers/theme_provider.dart';

import 'screens/homepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => DatabaseProvider()),
      ChangeNotifierProvider(create: (context) => ThemeProvider())
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SoleSeekers',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeMode,
      home: const HomePage(),
    );
  }
}
