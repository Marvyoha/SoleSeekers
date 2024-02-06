import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sole_seekers/core/providers/services_provider.dart';
import 'package:sole_seekers/core/routes.dart';
import 'package:sole_seekers/firebase_options.dart';
import 'package:sole_seekers/core/providers/db_provider.dart';
import 'package:sole_seekers/core/providers/theme_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ServicesProvider()),
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
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (context, child) => MaterialApp(
        title: 'SoleSeekers',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: 'splash',
        // themeMode: ThemeMode.dark,
        theme: Provider.of<ThemeProvider>(context).themeMode,
        // darkTheme: darkMode,
      ),
    );
  }
}
