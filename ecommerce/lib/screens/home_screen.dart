import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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