import 'package:flutter/material.dart';
import 'package:imdbdata/src/view/title_basics_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMDB DATA',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 66, 66, 66),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 23,
            color: Color.fromARGB(255, 253, 216, 53),
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(fontSize: 19),
          headline3: TextStyle(fontSize: 17, color: Colors.white),
          headline4: TextStyle(fontSize: 17, color: Colors.white54),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.white,
          secondary: const Color.fromARGB(255, 253, 216, 53),
          tertiary: const Color.fromARGB(255, 66, 66, 66),
          outline: Colors.white70,
        ),
        backgroundColor: Colors.black87,
        listTileTheme: const ListTileThemeData(
          tileColor: Colors.black87,
          textColor: Colors.white,
        ),
      ),
      home: const TitleBasicsListPage(),
    );
  }
}
