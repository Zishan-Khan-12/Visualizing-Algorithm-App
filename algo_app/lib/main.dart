import 'package:algo_app/provider/search/linear_search_provider.dart';
import 'package:algo_app/provider/sort/quicksort.dart';
import 'package:algo_app/provider/sort/selectionsort.dart';
import 'package:algo_app/ux/pages/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Algorithms',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => LinerSearchProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => QuickSortProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => SelectionSortProvider(),
            )
          ],
          child: Home(),
        ),
      ),
    );
  }
}
