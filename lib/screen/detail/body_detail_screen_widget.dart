import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant_detail.dart';
import 'package:restaurant_app/screen/detail/menu_card_widget.dart';
import 'package:restaurant_app/utils/image_url_utils.dart';

class BodyDetailScreenWidget extends StatelessWidget {
  final RestaurantDetail restaurantDetail;

  const BodyDetailScreenWidget({super.key, required this.restaurantDetail});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            restaurantDetail.pictureId.largeImageUrl,
            fit: BoxFit.cover,
          ),
          const SizedBox.square(dimension: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                restaurantDetail.name,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  const SizedBox.square(dimension: 4),
                  Text(
                    restaurantDetail.rating.toString(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox.square(dimension: 4),
              Text(
                '${restaurantDetail.address}, ${restaurantDetail.city}',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox.square(dimension: 16),
          Text(
            restaurantDetail.description,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox.square(dimension: 16),
          if (restaurantDetail.menus.foods.isNotEmpty) ...[
            Text(
              'Foods',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox.square(dimension: 8),
            SizedBox(
              height: 30,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: restaurantDetail.menus.foods.length,
                itemBuilder: (context, index) {
                  final foods = restaurantDetail.menus.foods[index];
                  return MenuCardWidget(
                    menu: foods.name,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 8),
              ),
            ),
          ],
          const SizedBox.square(dimension: 16),
          if (restaurantDetail.menus.drinks.isNotEmpty) ...[
            Text(
              'Drinks',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox.square(dimension: 8),
            SizedBox(
              height: 30,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: restaurantDetail.menus.drinks.length,
                itemBuilder: (context, index) {
                  final drinks = restaurantDetail.menus.drinks[index];
                  return MenuCardWidget(
                    menu: drinks.name,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 8),
              ),
            ),
          ],
          const SizedBox.square(dimension: 16),
        ],
      ),
    );
  }
}
