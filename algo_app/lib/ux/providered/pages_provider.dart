import 'package:algo_app/provider/search/linear_search_provider.dart';
import 'package:algo_app/provider/sort/insertion_sort_provider.dart';
import 'package:algo_app/provider/sort/quicksort.dart';
import 'package:algo_app/provider/sort/selectionsort.dart';
import 'package:algo_app/ux/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:algo_app/provider/search/binary_search_provider.dart';
import 'package:algo_app/provider/sort/bubble_sort_provider.dart';
import 'package:algo_app/ux/pages/sort_page.dart';

class PagesProvider extends ChangeNotifier {
  String categoryKey = 'Search';

  final _searchPages = [
    SearchPage<LinerSearchProvider>(title: 'Linear Search'),
    SearchPage<BinarySearchProvider>(title: 'Binary Search'),
  ];
  final _sortPages = [
    SortPage<BubbleSortProvider>(title: 'Bubble Sort'),
    SortPage<InsertionSortProvider>(title: 'Insertion Sort'),
    SortPage<SelectionSortProvider>(title: 'Selection Sort'),
    SortPage<QuickSortProvider>(
      title: 'Quick Sort',
      blockSize: 70,
    )
  ];

  void changeKey(String key) {
    categoryKey = key;
    notifyListeners();
  }

  List<StatelessWidget> get pages {
    // if (categoryKey == 'Search') {
    //   return
    // }
    switch (categoryKey) {
      case 'Search':
        return _searchPages;
        break;
      case 'Sort':
        return _sortPages;
        break;
      default:
        return _searchPages;
        break;
    }
  }
}
