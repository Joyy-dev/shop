import 'package:ecommerce/provider/search.dart';
import 'package:ecommerce/widget/search_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:standard_searchbar/old/standard_searchbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    bool showSuggestion = false;

    void _updateSuggestion(String query) {
      final searchProvider = context.read<Search>();
      searchProvider.filteredItems(query);

      setState(() {
        showSuggestion = query.isNotEmpty;
      });
    }

    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.home)),
          IconButton(onPressed: () {}, icon: Icon(Icons.grid_view)),
          IconButton(onPressed: () {}, icon: Icon(Icons.add_alert_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.person_3_outlined))
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  image: DecorationImage(
                    opacity: 0.5,
                    image: AssetImage('assets/images/circleframe.png',), 
                    fit: BoxFit.cover
                  )
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Find the best \noutfit for you',
                        style: TextStyle(
                          height: 10,
                          fontSize: 20, 
                          fontWeight: FontWeight.bold
                        ),),
                        IconButton(onPressed: () {},icon: Icon(Icons.shopping_bag_outlined)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.chat_bubble_outline)),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    StandardSearchBar(
                      onChanged: (value) {
                        _updateSuggestion(value);
                      },
                    ),
                    if (showSuggestion) SearchPage()
                  ],
                ),
              )
            ]
          )
        ],
      )
    );
  }
}