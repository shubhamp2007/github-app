import 'package:flutter/material.dart';
import 'package:flutter_octicons/flutter_octicons.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Inbox',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.lightBlue),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              _Chip(label: 'Inbox', isDropdown: true),
              const SizedBox(width: 8),
              _Chip(label: 'Focused'),
              const SizedBox(width: 8),
              _Chip(label: 'Unread'),
              const SizedBox(width: 8),
              _Chip(label: 'Repository', isDropdown: true),
            ],
          ),
          const SizedBox(height: 16),
          _InboxMessage(
            author: 'codeshankarbhardwaj / Wind-Jammer #9',
            title: 'Feature/game logic',
            icon: OctIcons.git_merge_16,
            iconColor: Colors.purple.shade800,
            actor: Row(
              children: [
                const CircleAvatar(
                  radius: 8,
                  backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/88220606?size=64',
                  ),
                ),
                const SizedBox(width: 6),
                Flexible(
                  child: Text(
                    'Merged #9 into main.',
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            timeAgo: '7d',
          ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final bool isDropdown;

  const _Chip({required this.label, this.isDropdown = false});

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
          if (isDropdown) ...[
            const SizedBox(width: 4),
            const Icon(OctIcons.chevron_down_16, size: 14, color: Colors.white),
          ],
        ],
      ),
    );
  }
}

class _InboxMessage extends StatelessWidget {
  final String author;
  final String title;
  final IconData icon;
  final Color iconColor;
  final Widget actor;
  final String timeAgo;

  const _InboxMessage({
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
