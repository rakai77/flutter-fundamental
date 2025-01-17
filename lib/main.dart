import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/database/restaurant_database_service.dart';
import 'package:restaurant_app/provider/bookmark/restaurant_database_provider.dart';
import 'package:restaurant_app/provider/detail/restaurant_detail_provider.dart';
import 'package:restaurant_app/provider/home/restaurant_list_provider.dart';
import 'package:restaurant_app/provider/main/index_nav_provider.dart';
import 'package:restaurant_app/provider/setting/theme_provider.dart';
import 'package:restaurant_app/screen/detail/detail_screen.dart';
import 'package:restaurant_app/screen/main/main_screen.dart';
import 'package:restaurant_app/screen/setting/setting_screen.dart';
import 'package:restaurant_app/static/navigation_route.dart';
import 'package:restaurant_app/style/theme/restaurant_theme.dart';

import 'data/service/api_service.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => IndexNavProvider(),
          ),
          Provider(
            create: (context) => ApiService(),
          ),
          ChangeNotifierProvider(
            create: (context) => RestaurantListProvider(
                context.read<ApiService>()
            ),
          ),
          ChangeNotifierProvider(
            create: (context) => RestaurantDetailProvider(
                context.read<ApiService>()
            ),
          ),
          Provider(
            create: (context) => RestaurantDatabaseService(),
          ),
          ChangeNotifierProvider(
            create: (context) => RestaurantDatabaseProvider(
              context.read<RestaurantDatabaseService>()
            ),
          ),
          ChangeNotifierProvider(
            create: (context) => ThemeProvider()..getTheme(),
          )
        ],
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return MaterialApp(
      title: 'Restaurant App',
      theme: RestaurantTheme.lightTheme,
      darkTheme: RestaurantTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      initialRoute: NavigationRoute.mainRoute.name,
      routes: {
        NavigationRoute.mainRoute.name: (context) => const MainScreen(),
        NavigationRoute.detailRoute.name: (context) => DetailScreen(
          id: ModalRoute.of(context)?.settings.arguments as String,
        ),
        NavigationRoute.settingRoute.name: (context) => SettingScreen()
      },
    );
  }
}