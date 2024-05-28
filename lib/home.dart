// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchFoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Search Food',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: Container(
          margin: EdgeInsets.all(10.0),
          width: 40, // Set the width of the square button
          height: 40, // Set the height of the square button
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            color: Colors.white, // Background color of the button
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {},
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/user.jpeg'), // Replace with your user profile image
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBar(),
            SizedBox(height: 16),
            Text(
              'Found 80 results',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(child: FoodList()),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons
                          .search, // Change this to a bold icon if needed
                      color: Colors.black,
                      size: 28,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Spice Food',
                            hintStyle: TextStyle(
                              fontWeight:
                                  FontWeight.bold, // Make hint text bold
                              color: Colors.black,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 10), // Space between search bar and orange container
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              Icons.tune,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class FoodList extends StatelessWidget {
  final List<FoodItem> items = [
    FoodItem('Oni Sandwich', 'Spicy chicken sandwich', 69, 6.72,
        'assets/oni_sandwich.png'),
    FoodItem('Dan Noodles', 'Spicy fruit mixed', 120, 8.86,
        'assets/dan_noodles.png'),
    FoodItem('Chicken Dimsum', 'Spicy chicken dimsum', 65, 6.99,
        'assets/chicken_dimsum.png'),
    FoodItem(
        'Egg Pasta', 'Spicy chicken pasta', 78, 9.80, 'assets/egg_pasta.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.8,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return FoodCard(item: items[index]);
      },
    );
  }
}

class FoodItem {
  final String name;
  final String description;
  final int calories;
  final double price;
  final String imageUrl;

  FoodItem(
      this.name, this.description, this.calories, this.price, this.imageUrl);
}

class FoodCard extends StatelessWidget {
  final FoodItem item;

  FoodCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              image: DecorationImage(
                image: AssetImage(item.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  item.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  item.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.local_fire_department,
                      color: Colors.red,
                      size: 18,
                    ),
                    SizedBox(width: 5),
                    Text(
                      '${item.calories} Calories',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  '\$${item.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
