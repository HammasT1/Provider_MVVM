import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basics/provider/auth_provider.dart';
import 'package:provider_basics/provider/count_provider.dart';
import 'package:provider_basics/provider/example_one_provider.dart';
import 'package:provider_basics/provider/favorite_provider.dart';
import 'package:provider_basics/provider/theme_changer_provider.dart';
import 'package:provider_basics/screen/dark_theme.dart';
import 'package:provider_basics/screen/login.dart';
// import 'package:provider_basics/screen/count_example.dart';
// import 'package:provider_basics/screen/example_one.dart';
// import 'package:provider_basics/screen/favorite/favorite_screen.dart';
// import 'package:provider_basics/why_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteitemProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.yellow
              ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.purple,
              primaryColor: Colors.teal,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.yellow
              ),
              iconTheme: IconThemeData(
                color: Colors.pink
              )
            ),
            home: LoginScreen (),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
