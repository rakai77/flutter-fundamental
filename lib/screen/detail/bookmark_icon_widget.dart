import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/provider/bookmark/restaurant_database_provider.dart';
import '../../provider/detail/bookmark_icon_provider.dart';

class BookmarkIconWidget extends StatefulWidget {
  final Restaurant restaurant;

  const BookmarkIconWidget({super.key, required this.restaurant});

  @override
  State<StatefulWidget> createState() => _BookmarkIconWidgetState();

}

class _BookmarkIconWidgetState extends State<BookmarkIconWidget> {

  @override
  void initState() {
    super.initState();

    final bookmarkIconProvider = context.read<BookmarkIconProvider>();
    final bookmarkDatabaseProvider = context.read<RestaurantDatabaseProvider>();

    Future.microtask(() async {
      await bookmarkDatabaseProvider.loadRestaurantValueById(widget.restaurant.id);
      final value = bookmarkDatabaseProvider.restaurant == null
          ? false
          : bookmarkDatabaseProvider.restaurant!.id == widget.restaurant.id;
      bookmarkIconProvider.isBookmarked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final bookmarkIconProvider = context.read<BookmarkIconProvider>();
        final bookmarkDatabaseProvider = context.read<RestaurantDatabaseProvider>();
        final isBookmarked = bookmarkIconProvider.isBookmarked;

        if(isBookmarked) {
         await bookmarkDatabaseProvider.removeRestaurantValueById(widget.restaurant.id);
        } else {
         await bookmarkDatabaseProvider.saveRestaurantValue(widget.restaurant);
        }
        bookmarkIconProvider.isBookmarked = !isBookmarked;
        bookmarkDatabaseProvider.loadAllRestaurantValue();
      },
      icon: Icon(
        context.watch<BookmarkIconProvider>().isBookmarked
            ? Icons.bookmark
            : Icons.bookmark_outline
      ),
    );
  }
}