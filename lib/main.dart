import 'package:flutter/material.dart';
import 'package:flutter_octicons/flutter_octicons.dart';
import 'package:github_app/pages/copilot_page.dart';
import 'package:github_app/pages/explore_page.dart';
import 'package:github_app/pages/home_page.dart';
import 'package:github_app/pages/inbox_page.dart';

void main() {
  runApp(Main());
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedIndex = 0;

  static const Color background = Color(0xFF0D1117);
  static const Color surface = Color(0xFF161B22);
  static const Color secondarySurface = Color(0xFF1F242C);
  static const Color border = Color(0xFF30363D);
  static const Color primary = Color(0xFFF0F6FC);
  static const Color secondary = Color(0xFF8B949E);
  static const Color accentBlue = Color(0xFF1F6FEB);

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [HomePage(), InboxPage(), ExplorePage(), CopilotPage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: background,
        colorScheme: const ColorScheme.dark(
          surface: surface,
          primary: accentBlue,
          onPrimary: primary,
          onSurface: primary,
          secondary: secondary,
          outline: border,
        ),
        cardTheme: const CardThemeData(
          color: surface,
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: border, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        dividerTheme: const DividerThemeData(
          color: border,
          thickness: 1,
          space: 1,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: primary,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          titleMedium: TextStyle(
            color: primary,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          titleSmall: TextStyle(color: secondary, fontSize: 14),
          bodyLarge: TextStyle(color: primary, fontSize: 16),
          bodyMedium: TextStyle(color: primary, fontSize: 14),
          bodySmall: TextStyle(color: secondary, fontSize: 12),
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: surface,
          indicatorColor: secondarySurface,
          iconTheme: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const IconThemeData(color: primary);
            }
            return const IconThemeData(color: secondary);
          }),
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const TextStyle(
                color: primary,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              );
            }
            return const TextStyle(color: secondary, fontSize: 12);
          }),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: accentBlue,
          foregroundColor: primary,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
      ),
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: _navigateBottomBar,
          indicatorColor: Colors.blue.shade100,
          destinations: const [
            NavigationDestination(
              icon: Icon(OctIcons.home_24),
              selectedIcon: Icon(OctIcons.home_fill_24, color: Colors.blue),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(OctIcons.inbox_24),
              selectedIcon: Icon(OctIcons.inbox_fill_24, color: Colors.blue),
              label: 'Inbox',
            ),
            NavigationDestination(
              icon: Icon(OctIcons.telescope_24),
              selectedIcon: Icon(
                OctIcons.telescope_fill_24,
                color: Colors.blue,
              ),
              label: 'Explore',
            ),
            NavigationDestination(
              icon: Icon(OctIcons.copilot_24),
              selectedIcon: Icon(OctIcons.copilot_24, color: Colors.blue),
              label: 'Copilot',
            ),
          ],
        ),
      ),
    );
  }
}
