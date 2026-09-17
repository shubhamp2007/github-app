import 'package:flutter/material.dart';
import 'package:flutter_octicons/flutter_octicons.dart';

class IssuesPage extends StatelessWidget {
  const IssuesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Issues',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            constraints: const BoxConstraints(),
            icon: Icon(OctIcons.search_16, color: Colors.lightBlue, size: 16),
            onPressed: () {},
          ),
          IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            constraints: const BoxConstraints(),
            icon: Icon(Icons.more_vert, color: Colors.lightBlue, size: 24),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _Chip(label: 'Open'),
                const SizedBox(width: 8),
                _Chip(label: 'Created by me'),
                const SizedBox(width: 8),
                _Chip(label: 'Visibility'),
                const SizedBox(width: 8),
                _Chip(label: 'Organization'),
                const SizedBox(width: 8),
                _Chip(label: 'Repository'),
                const SizedBox(
                  height: 24,
                  child: VerticalDivider(
                    width: 16,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
                _Chip(label: 'Sort: Newest'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;

  const _Chip({required this.label});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        backgroundColor: colorScheme.surface,
        side: BorderSide(color: colorScheme.outline),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 4),
          const Icon(OctIcons.chevron_down_16, size: 14, color: Colors.white),
        ],
      ),
    );
  }
}
