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
