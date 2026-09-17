import 'package:flutter/material.dart';
import 'package:flutter_octicons/flutter_octicons.dart';

class TopRepositoriesPage extends StatelessWidget {
  const TopRepositoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Top Repositories',
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
            child: Row(children: [_Chip(label: 'All')]),
          ),
          SizedBox(height: 12),
          _RepositoryCard(
            username: 'shubhamp2007',
            repo: 'github-app',
            imageUrl:
                'https://avatars.githubusercontent.com/u/88220606?size=64',
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

class _RepositoryCard extends StatelessWidget {
  final String username;
  final String repo;
  final String imageUrl;

  const _RepositoryCard({
    required this.username,
    required this.repo,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: CircleAvatar(
            radius: 12,
            backgroundImage: NetworkImage(imageUrl),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(username, style: TextStyle(fontSize: 14, color: Colors.grey)),
            Text(repo, style: TextStyle(fontSize: 14, color: Colors.white)),
          ],
        ),
      ],
    );
  }
}
