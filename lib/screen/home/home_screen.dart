import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/home/restaurant_list_provider.dart';
import 'package:restaurant_app/screen/home/restaurant_card_widget.dart';
import 'package:restaurant_app/static/navigation_route.dart';
import 'package:restaurant_app/static/restaurant_list_result_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<RestaurantListProvider>().fetchRestaurantList();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant'),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(
                    context,
                    NavigationRoute.settingRoute.name
                );
              },
              icon: Icon(
                Icons.settings
              )
          )
        ],
      ),
      body: Consumer<RestaurantListProvider>(
        builder: (context, value, child) {
          return switch (value.resultState) {
            RestaurantListLoadingState() => const Center(
              child: CircularProgressIndicator(
                color: Colors.yellow,
              ),
            ),
            RestaurantListLoadedState(data: var restaurantList) => ListView.builder(
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
            RestaurantListErrorState(error: var errorMessage) => Center(
              child: Text(errorMessage),
            ),
            _ => const SizedBox()
          };
        },
      ),
    );
  }
}