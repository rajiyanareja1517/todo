import 'package:flutter/material.dart';
import 'package:todo_db/view/create_todo_page.dart';
import 'package:todo_db/view/home_page.dart';
import 'view/favorite_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
       '/':(context)=>HomePage(),
        'create':(context)=>CreateTodoPage(),
        'fav':(context)=>FavoritePage(),
      },
    );
  }
}

