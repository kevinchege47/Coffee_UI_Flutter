// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:coffeeui/components/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/coffee_tiles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //list of coffee types
  final List coffeeType = [
    ['Cappuccino', true],
    ['Latte', false],
    ['Mocha', false],
    ['Americano', false],
  ];

  //user tapped on coffee types
  void coffeeTypeSelected(int index) {
    setState(() {
      //this for loop makes every selection false
      for(int i=0;i<coffeeType.length;i++){
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_box), label: 'Account'),
      ]),
      body: Column(
        children: [
          //  find best coffee for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Find the best coffee for you",
              style: GoogleFonts.bebasNeue(fontSize: 60),
            ),
          ),
          SizedBox(height: 25),
          //  Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search Your Coffee",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600))),
            ),
          ),
          SizedBox(height: 25),
          //horizontal list view of coffee types
          Container(
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coffeeType.length,
                itemBuilder: (context, index) {
                  return CoffeeType(
                    name: coffeeType[index][0],
                    isSelected: coffeeType[index][1],
                    onTap: () {
                      coffeeTypeSelected(index);
                    },
                  );
                }),
          ),
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeeTile(coffeeImagePath:
              'assets/images/coffeeone.jpg',coffeeName:
              'Mocha',coffeePrice:
              '6.00'),
              CoffeeTile(coffeeImagePath:
              'assets/images/coffeetwo.jpg',coffeeName:
              'Cappuccino',coffeePrice:
              '4.00'),
              CoffeeTile(coffeeImagePath:
              'assets/images/coffee3.jpg',coffeeName:
              'Americano',coffeePrice:
              '9.00'),
            ],
          ))
          //  horizontal list view of coffee tiles
        ],
      ),
    );
  }
}
