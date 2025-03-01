import 'dart:collection';
import 'package:flutter/material.dart';

class Search with ChangeNotifier {
  final List<Map<String, String>> _searchList = [
    {'title': 'Nike Air Jordan'},
    {'title': 'Curry 5'},
    {'title': 'Jordan BRED'},
    {'title': 'Heiden Heritage Xylo'},
    {'title': 'Ventela Public'}
  ];

  final List<Map<String, String>> _popularSearches = [
    {'title': 'Heiden Heritage', 'images': 'assets/images/tech-wear.jpg'},
    {'title': 'Tech Wear', 'images': 'assets/images/tech-wear.jpg'},
    {'title': 'Local Wear', 'images': 'assets/images/tech-wear.jpg'},
    {'title': 'Flannel Hoodie', 'images': 'assets/images/images.jpeg'},
    {'title': 'Sport Shoes', 'images': 'assets/images/sport-shoe.jpeg'},
    {'title': 'Sport Shoes', 'images': 'assets/images/sport-shoe.jpeg'},
    {'title': 'Black Tshirt', 'images': 'assets/images/download.jpeg'},
    {'title': 'Sort Wear', 'images': 'assets/images/images.jpeg'},
    {'title': 'Oversized Tshirt', 'images': 'assets/images/download.jpeg'}
  ];

  final List<String> _searchHistory = [];
  List<Map<String, String>> _searchResults = [];

  Search() {
    _searchResults = List.from(_searchList);
  }

  UnmodifiableListView<Map<String, String>> get searchResult => UnmodifiableListView(_searchResults);
  UnmodifiableListView<String> get searchHistory => UnmodifiableListView(_searchHistory);
  UnmodifiableListView<Map<String, String>> get popularSearch => UnmodifiableListView(_popularSearches);


  void filteredItems (String query) {
    if (query.isEmpty) {
      _searchResults = List.from(_searchList);
    } else {
      _searchResults = _searchList.where((items) => items['title']!.toLowerCase().contains(query.toLowerCase())).toList();
    }
    notifyListeners();
  }

  void addToSearchHistory (String query) {
    if (query.isEmpty && !_searchHistory.contains(query)) {
      _searchHistory.insert(0, query);
      if (_searchHistory.length > 5) {
        _searchHistory.removeLast();
      }
      notifyListeners();
    }
  }

  void clearSearchHistory () {
    _searchHistory.clear();
    notifyListeners();
  }
}