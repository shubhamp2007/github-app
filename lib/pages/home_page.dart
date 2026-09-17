import 'package:flutter/material.dart';
import 'package:flutter_octicons/flutter_octicons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            constraints: const BoxConstraints(),
            icon: Icon(OctIcons.search_16, color: colors.primary, size: 16),
            onPressed: () {},
          ),
          IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            constraints: const BoxConstraints(),
            icon: Icon(OctIcons.sync_16, color: colors.primary, size: 16),
            onPressed: () {},
          ),
          IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            constraints: const BoxConstraints(),
            icon: Icon(
              OctIcons.plus_circle_16,
              color: colors.primary,
              size: 16,
            ),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CircleAvatar(
              radius: 12,
              backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/88220606?size=64',
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Work',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_horiz, color: Colors.grey),
                ),
              ],
            ),
          ),
          _MenuTile(
            icon: OctIcons.issue_opened_16,
            bgColor: Colors.green,
            label: 'Issues',
          ),
          _MenuTile(
            icon: OctIcons.git_pull_request_16,
            bgColor: Colors.blue,
            label: 'Pull Requests',
          ),
          _MenuTile(
            icon: OctIcons.comment_discussion_16,
            bgColor: Colors.purple,
            label: 'Discussions',
          ),
          _MenuTile(
            icon: OctIcons.table_16,
            bgColor: Colors.grey,
            label: 'Projects',
          ),
          _MenuTile(
            icon: OctIcons.repo_16,
            bgColor: Colors.blueGrey,
            label: 'Top Repositories',
          ),
          _MenuTile(
            icon: OctIcons.organization_16,
            bgColor: Colors.orange,
            label: 'Organizations',
          ),
          _MenuTile(
            icon: OctIcons.star_16,
            bgColor: Colors.yellow,
            label: 'Starred',
          ),
          const Divider(height: 24),
          Padding(padding: EdgeInsetsGeometry.all(16), child: _FavoritesCard()),
          const Divider(height: 24),
          Padding(padding: EdgeInsetsGeometry.all(16), child: _ShortcutsCard()),
        ],
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final IconData icon;
  final Color bgColor;
  final String label;

  const _MenuTile({
    required this.icon,
    required this.bgColor,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.white, size: 16),
      ),
      title: Text(label, style: const TextStyle(fontSize: 16)),
      onTap: () {},
    );
  }
}

class _FavoritesCard extends StatelessWidget {
  const _FavoritesCard();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              'Favorites',
              textAlign: TextAlign.left,
              style: textTheme.titleMedium,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            "Add favorite repositories for quick access at any time, without having to search",
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: colors.outline),
                backgroundColor: const Color(0xFF1F242C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'ADD FAVORITES',
                style: TextStyle(color: colors.primary, letterSpacing: 0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ShortcutsCard extends StatelessWidget {
  const _ShortcutsCard();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              'Shortcuts',
              textAlign: TextAlign.left,
              style: textTheme.titleMedium,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ShortcutsAvatar(
                icon: OctIcons.zap_16,
                color: Colors.grey.shade100,
                bgColor: Colors.grey,
              ),
              _ShortcutsAvatar(
                icon: OctIcons.issue_opened_16,
                color: Colors.green.shade100,
                bgColor: Colors.green,
              ),
              _ShortcutsAvatar(
                icon: OctIcons.git_pull_request_16,
                color: Colors.blue.shade100,
                bgColor: Colors.blue,
              ),
              _ShortcutsAvatar(
                icon: OctIcons.comment_discussion_16,
                color: Colors.purple.shade100,
                bgColor: Colors.purple,
              ),
              _ShortcutsAvatar(
                icon: OctIcons.organization_16,
                color: Colors.orange.shade100,
                bgColor: Colors.orange,
              ),
              _ShortcutsAvatar(
                icon: OctIcons.people_16,
                color: Colors.pink.shade100,
                bgColor: Colors.pink,
              ),
              _ShortcutsAvatar(
                icon: OctIcons.briefcase_16,
                color: Colors.purple.shade100,
                bgColor: Colors.purple,
              ),
              _ShortcutsAvatar(
                icon: OctIcons.file_diff_16,
                color: Colors.grey.shade100,
                bgColor: Colors.grey,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "The things you need, one tap away",
            textAlign: TextAlign.center,
            style: textTheme.titleMedium,
          ),
          const SizedBox(height: 6),
          Text(
            "Fast access your list of issues, Pull Requests, or Discussions",
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: colors.outline),
                backgroundColor: const Color(0xFF1F242C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'GET STARTED',
                style: TextStyle(color: colors.primary, letterSpacing: 0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ShortcutsAvatar extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color bgColor;
  const _ShortcutsAvatar({
    required this.icon,
    required this.color,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      widthFactor: 0.85,
      child: CircleAvatar(
        radius: 16,
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: CircleAvatar(
          radius: 14,
          backgroundColor: bgColor,
          child: Icon(icon, color: color, size: 16),
        ),
      ),
    );
  }
}
