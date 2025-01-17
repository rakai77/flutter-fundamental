import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/setting/theme_provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(
              'Tampilan',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600
              )
            ),
            subtitle: Text(
              'Atur warna tampilan aplikasi',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w400
              ),
            ),
            trailing: Consumer<ThemeProvider>(
              builder: (context, value, child) {
                final isDarkMode = value.themeMode == ThemeMode.dark;
                return Switch(
                    value: isDarkMode,
                    onChanged: (isDarkMode) {
                      value.setTheme();
                    }
                );
              },
            )
          ),
          const SizedBox(height: 4),
          ListTile(
            title: Text(
                'Notifikasi',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600
                )
            ),
            subtitle: Text(
              'Atur notifikasi pengingat',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w400
              ),
            ),
            trailing: Switch(
              value: true,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}