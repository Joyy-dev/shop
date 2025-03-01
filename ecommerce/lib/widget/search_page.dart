import 'package:ecommerce/provider/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
          children: [
            Consumer<Search>(
              builder: (context, search, child) {
                return Column(
                  children: [
                    Text('Search history...',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey
                    ),),
                    if (search.searchHistory.isEmpty)
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text('No recent searches'),
                    )
                    else
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: search.searchHistory.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(search.searchHistory[index]),
                            onTap: () {
                              _searchController.text = search.searchHistory[index];
                              search.filteredItems(search.searchHistory[index]);
                            },
                          );
                        }
                      ),
                    ),
                    
                  ],
                );
            },),
            const SizedBox(height: 10,),
            TextButton(
              onPressed: () {
                context.read<Search>().clearSearchHistory();
              }, 
              child: Text('Delete search history',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18
              ),)
            ),
            const SizedBox(height: 10,),
            Consumer<Search>(
              builder: (context, searchProvider, child) {
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1
                    ), 
                    itemBuilder: (context, index) {
                      var item = searchProvider.popularSearch[index];
                      return GestureDetector(
                        onTap: () {
                          _searchController.text = item['title']!;
                          searchProvider.filteredItems(item['title']!);
                        },
                        child: Column(
                          children: [
                            Expanded(
                              child: ClipRect(
                                child: Image.asset(item['image']!,
                                fit: BoxFit.cover,
                              ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(item['title']!,),
                            )
                          ],
                        ),
                      );
                    }
                  ),
                );
              }
            )
          ],
      ),
    );
  }
}