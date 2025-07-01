import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basics/provider/theme_changer_provider.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({super.key});

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    final isDarkMode = themeChanger.themeMode == ThemeMode.dark ||
        (themeChanger.themeMode == ThemeMode.system &&
            MediaQuery.of(context).platformBrightness == Brightness.dark);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Theme Changer',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        elevation: 4,
        backgroundColor: isDarkMode ? Colors.grey[900] : Colors.blueAccent,
        foregroundColor: isDarkMode ? Colors.white : Colors.white,
        shadowColor: isDarkMode ? Colors.black54 : Colors.blue.withOpacity(0.3),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: isDarkMode ? Colors.grey[850] : Colors.grey[100],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Text(
                'Choose Your Theme',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 12),
              _buildThemeTile(
                context,
                title: 'Light Mode',
                value: ThemeMode.light,
                groupValue: themeChanger.themeMode,
                onChanged: themeChanger.setTheme,
                icon: Icons.wb_sunny,
                isDarkMode: isDarkMode,
              ),
              _buildThemeTile(
                context,
                title: 'Dark Mode',
                value: ThemeMode.dark,
                groupValue: themeChanger.themeMode,
                onChanged: themeChanger.setTheme,
                icon: Icons.nightlight_round,
                isDarkMode: isDarkMode,
              ),
              _buildThemeTile(
                context,
                title: 'System Default',
                value: ThemeMode.system,
                groupValue: themeChanger.themeMode,
                onChanged: themeChanger.setTheme,
                icon: Icons.settings,
                isDarkMode: isDarkMode,
              ),
              const SizedBox(height: 24),
              Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.favorite,
                      size: 50,
                      color: isDarkMode ? Colors.redAccent : Colors.red,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Made with Love',
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: isDarkMode ? Colors.white70 : Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThemeTile(
    BuildContext context, {
    required String title,
    required ThemeMode value,
    required ThemeMode groupValue,
    required ValueChanged<ThemeMode?> onChanged,
    required IconData icon,
    required bool isDarkMode,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: isDarkMode ? Colors.grey[800] : Colors.white,
      child: RadioListTile<ThemeMode>(
        title: Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: isDarkMode ? Colors.white70 : Colors.blueAccent,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        activeColor: Colors.blueAccent,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}