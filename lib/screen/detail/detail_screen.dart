import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/provider/detail/restaurant_detail_provider.dart';
import 'package:restaurant_app/screen/detail/body_detail_screen_widget.dart';
import '../../provider/detail/bookmark_icon_provider.dart';
import '../../static/restaurant_detail_result_state.dart';
import 'bookmark_icon_widget.dart';

class DetailScreen extends StatefulWidget {
  final String id;

  const DetailScreen({super.key, required this.id});

  @override
  State<StatefulWidget> createState() => _DetailScreen();
}

class _DetailScreen extends State<DetailScreen> {

  @override
  void initState() {
    super.initState();
    Future.microtask((){
      context.read<RestaurantDetailProvider>().fetchRestaurantDetail(widget.id);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Detail'),
        actions: [
          ChangeNotifierProvider(
            create: (context) => BookmarkIconProvider(),
            child: Consumer<RestaurantDetailProvider>(
              builder: (context, value, child) {
                return switch (value.resultState) {
                  RestaurantDetailLoadedState(data: var restaurant) =>
                      BookmarkIconWidget(restaurant: Restaurant(
                          id: restaurant.id,
                          name: restaurant.name,
                          description: restaurant.description,
                          pictureId: restaurant.pictureId,
                          city: restaurant.city,
                          rating: restaurant.rating
                      )),
                  _ => const SizedBox(),
                };
              },
            ),
          ),
        ],
      ),
      body: Consumer<RestaurantDetailProvider>(
        builder: (context, value, child) {
          return switch (value.resultState) {
            RestaurantDetailLoadingState() => const Center(
                child: CircularProgressIndicator(
                  color: Colors.yellow,
                ),
              ),
            RestaurantDetailLoadedState(data: var restaurantDetail) =>
              BodyDetailScreenWidget(restaurantDetail: restaurantDetail),
            RestaurantDetailErrorState(error: var errorMessage) => Center(
                child: Text(errorMessage),
              ),
            _ => const SizedBox()
          };
        },
      ),
    );
  }
}
