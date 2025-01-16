import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/bookmark/restaurant_database_provider.dart';
import 'package:restaurant_app/screen/home/restaurant_card_widget.dart';
import 'package:restaurant_app/static/navigation_route.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<StatefulWidget> createState() => _BookmarkScreen();
}

class _BookmarkScreen extends State<BookmarkScreen> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<RestaurantDatabaseProvider>().loadAllRestaurantValue();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmark List'),
      ),
      body: Consumer<RestaurantDatabaseProvider>(
        builder: (context, value, child) {
          final restaurantList = value.restaurantList ?? [];
          return switch (restaurantList.isNotEmpty) {
            true => ListView.builder(
              itemCount: restaurantList.length,
              itemBuilder: (context, index) {
                final restaurant = restaurantList[index];

                return RestaurantCard(
                restaurant: restaurant,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    NavigationRoute.detailRoute.name,
                    arguments: restaurant.id
                  );
                }
                );
              },
            ),
           _ => const Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("No Bookmarked"),
               ],
             ),
           ),
          };
        },
      )
    );
  }
}