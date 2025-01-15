import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/detail/restaurant_detail_provider.dart';
import 'package:restaurant_app/screen/detail/body_detail_screen_widget.dart';

import '../../static/restaurant_detail_result_state.dart';

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
