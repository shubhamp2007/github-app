import 'package:flutter/material.dart';
import 'package:flutter_octicons/flutter_octicons.dart';

class CopilotPage extends StatelessWidget {
  const CopilotPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.surface,
        title: Text(
          'Copilot',
          style: textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: colors.primary),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SectionTitle('Agent Sessions'),
          const SizedBox(height: 12),
          _AgentSessionsCard(),
          const SizedBox(height: 12),
          _SectionTitle('Chats'),
          const SizedBox(height: 12),
          _ChatsCard(),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}

class _CardBox extends StatelessWidget {
  final Widget child;
  const _CardBox({required this.child});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border.all(color: colors.outline, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}

class _AgentSessionsCard extends StatelessWidget {
  const _AgentSessionsCard();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return _CardBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: const Color(0xFF30363D),
                child: Icon(
                  OctIcons.agent_16,
                  color: colors.onSurface,
                  size: 16,
                ),
              ),
              const SizedBox(width: 12),
              CircleAvatar(
                radius: 24,
                backgroundColor: colors.primary,
                child: Icon(
                  OctIcons.issue_opened_16,
                  color: colors.onPrimary,
                  size: 16,
                ),
              ),
              const SizedBox(width: 12),
              CircleAvatar(
                radius: 24,
                backgroundColor: const Color(0xFF238636),
                child: Icon(
                  OctIcons.git_pull_request_16,
                  color: const Color(0xFFAFDBC5),
                  size: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Delegate tasks to GitHub Copilot cloud agent',
            textAlign: TextAlign.center,
            style: textTheme.titleMedium,
          ),
          const SizedBox(height: 4),
          Text(
            "Let Copilot work independently in the background to complete tasks, and then monitor Copilot's progress.",
            textAlign: TextAlign.center,
            style: textTheme.titleSmall,
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
                'UPGRADE TO COPILOT PRO',
                style: TextStyle(
                  color: colors.primary,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatsCard extends StatelessWidget {
  const _ChatsCard();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return _CardBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: const Color(0xFF30363D),
                child: Icon(
                  OctIcons.copilot_16,
                  color: colors.onSurface,
                  size: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'No chats yet',
            textAlign: TextAlign.center,
            style: textTheme.titleMedium,
          ),
          const SizedBox(height: 4),
          Text(
            "Ask Copilot anything to start your first chat.",
            textAlign: TextAlign.center,
            style: textTheme.titleSmall,
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(8),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Text(
              'NEW CHAT',
              style: TextStyle(
                color: colors.primary,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
