import 'package:flutter/material.dart';
import 'package:flutter_octicons/flutter_octicons.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Explore',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  'Discover',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          _MenuTile(
            icon: OctIcons.flame_16,
            bgColor: Colors.redAccent,
            label: 'Trending Repositories',
          ),
          _MenuTile(
            icon: OctIcons.smiley_16,
            bgColor: Colors.purple.shade300,
            label: 'Awesome Lists',
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Activity',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  padding: EdgeInsetsGeometry.zero,
                  onPressed: () {},
                  icon: Icon(OctIcons.filter_16, size: 16),
                ),
              ],
            ),
          ),
          _ActivityCard(
            user: 'someone',
            action: 'followed you',
            imageUrl:
                'https://cdn.jsdelivr.net/gh/alohe/avatars/png/vibrent_6.png',
            timeAgo: '2d',
            icon: OctIcons.feed_person_16,
            iconColor: Colors.blue,
            child: _GitHubUserCard(
              username: 'shubhamp2007',
              displayName: 'Shubham',
              avatarUrl:
                  'https://avatars.githubusercontent.com/u/88220606?size=64',
              bio: 'I am a Student in India, and I love writing Programs',
              repoCount: 92,
              followerCount: 6,
            ),
          ),
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

class _ActivityCard extends StatelessWidget {
  final String user;
  final String action;
  final String imageUrl;
  final String timeAgo;
  final IconData icon;
  final Color iconColor;
  final Widget child;

  const _ActivityCard({
    required this.user,
    required this.action,
    required this.imageUrl,
    required this.timeAgo,
    required this.icon,
    required this.iconColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundImage: NetworkImage(imageUrl),
                      ),
                      Positioned(
                        bottom: -4,
                        right: -8,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(icon, size: 16, color: iconColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 16),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '$user ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: action,
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text(timeAgo, style: TextStyle(color: Colors.grey, fontSize: 16)),
            ],
          ),
          SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}

class _GitHubUserCard extends StatelessWidget {
  final String username;
  final String displayName;
  final String avatarUrl;
  final String bio;
  final int repoCount;
  final int followerCount;

  const _GitHubUserCard({
    required this.username,
    required this.displayName,
    required this.avatarUrl,
    required this.bio,
    required this.repoCount,
    required this.followerCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade800, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(avatarUrl),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Text(
                    displayName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            bio,
            style: TextStyle(
              color: Colors.grey.shade300,
              fontSize: 14,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Icon(OctIcons.repo_16, size: 16, color: Colors.grey),
              const SizedBox(width: 6),
              Text(
                '$repoCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                'repositories',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(width: 16),
              Icon(OctIcons.people_16, size: 16, color: Colors.grey),
              const SizedBox(width: 6),
              Text(
                '$followerCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                'followers',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
