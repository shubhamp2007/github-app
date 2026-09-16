import 'package:flutter/material.dart';
import 'package:flutter_octicons/flutter_octicons.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: const Center(child: Text('Github App')),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(OctIcons.home_16),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: const Icon(OctIcons.inbox_16),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: const Icon(OctIcons.telescope_16),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: const Icon(OctIcons.copilot_16),
              label: 'Copilot',
            ),
          ],
        ),
      ),
    ),
  );
}
