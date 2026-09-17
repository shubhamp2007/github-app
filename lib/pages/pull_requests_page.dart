import 'package:flutter/material.dart';
import 'package:flutter_octicons/flutter_octicons.dart';

class PullRequestsPage extends StatelessWidget {
  const PullRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Pull Requests',
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
          _PullRequestCard(
            author: 'MonuChaudhary14 / docusaurus-2026 #24',
            title: 'Created shubham.md and updated navbar',
            icon: OctIcons.git_pull_request_16,
            iconColor: Colors.green,
            actor: IconButton(
              onPressed: () {},
              padding: const EdgeInsets.all(0),
              icon: Icon(OctIcons.comment_16, size: 12),
            ),
            timeAgo: '16d',
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

class _PullRequestCard extends StatelessWidget {
  final String author;
  final String title;
  final IconData icon;
  final Color iconColor;
  final Widget actor;
  final String timeAgo;

  const _PullRequestCard({
    required this.author,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.actor,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: colorScheme.outline.withValues(alpha: 0.2)),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2, right: 12),
            child: Icon(icon, size: 20, color: iconColor),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        author,
                        style: TextStyle(
                          fontSize: 14,
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      timeAgo,
                      style: TextStyle(
                        fontSize: 13,
                        color: colorScheme.onSurface.withValues(alpha: 0.5),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  title,
                  style: TextStyle(fontSize: 15, color: colorScheme.onSurface),
                ),
                const SizedBox(height: 2),
                actor,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
