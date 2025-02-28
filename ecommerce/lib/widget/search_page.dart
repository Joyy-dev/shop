import 'package:flutter/material.dart';
import 'package:standard_searchbar/old/standard_searchbar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: ListView(
        children: [
          StandardSearchBar(
            maxSuggestions: 6,
            hintText: 'Find a product',
          )
        ],
      ),
    );
  }
}