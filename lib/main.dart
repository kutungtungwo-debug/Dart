import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF7F9FC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1C3557),
          surface: const Color(0xFFF7F9FC),
        ),
        fontFamily: 'Roboto',
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const _ink = Color(0xFF172238);
  static const _muted = Color(0xFF6E7F98);
  static const _line = Color(0xFFE5EBF2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTopBar(),
                  const SizedBox(height: 22),
                  _buildProfileHeader(),
                  const SizedBox(height: 20),
                  _buildStats(),
                  const SizedBox(height: 24),
                  _buildSectionTitle('About Me'),
                  const SizedBox(height: 8),
                  const Text(
                    'Passionate Lead Mobile Engineer specialized in Flutter, Dart, and building high-performance cross-platform applications. Focused on elegant design and reliable products.',
                    style: TextStyle(color: _muted, height: 1.55, fontSize: 13),
                  ),
                  const SizedBox(height: 20),
                  _buildSectionTitle('Skills & Expertise'),
                  const SizedBox(height: 9),
                  _buildSkills(),
                  const SizedBox(height: 22),
                  _buildSectionTitle('Featured Projects'),
                  const SizedBox(height: 10),
                  _buildProjects(),
                  const SizedBox(height: 22),
                  _buildContactCard(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return SizedBox(
      height: 42,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _iconButton(Icons.chevron_left, 'Back'),
          const Text(
            'Profile',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: _ink,
            ),
          ),
          _iconButton(Icons.share_outlined, 'Share profile'),
        ],
      ),
    );
  }

  Widget _iconButton(IconData icon, String label) {
    return Tooltip(
      message: label,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: _line),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, size: 19, color: _ink),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 96,
                height: 96,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFFF8E85), width: 2),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/avatar.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const ColoredBox(
                          color: Color(0xFFE7EDF3),
                          child: Icon(Icons.person, size: 56, color: _muted),
                        ),
                  ),
                ),
              ),
              Positioned(
                right: -1,
                bottom: 5,
                child: Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    color: const Color(0xFF168FC2),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(Icons.check, size: 13, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Alex Rivers',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: _ink,
          ),
        ),
        const SizedBox(height: 3),
        const Text(
          'Lead Mobile Engineer',
          style: TextStyle(fontSize: 12, color: _muted),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: const Color(0xFFF0F4F8),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.location_on_outlined, size: 13, color: _muted),
              SizedBox(width: 4),
              Text('Tokyo, Japan', style: TextStyle(fontSize: 10, color: _ink)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStats() {
    return Container(
      width: double.infinity,
      height: 78,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F5F9), width: 1),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A17304F),
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          const Expanded(
            child: _StatItem(value: '148', label: 'Projects'),
          ),
          const SizedBox(
            height: 28,
            child: VerticalDivider(
              width: 1,
              thickness: 1,
              color: Color(0xFFE5EBF2),
            ),
          ),
          const Expanded(
            child: _StatItem(value: '9 Yrs', label: 'Experience'),
          ),
          const SizedBox(
            height: 28,
            child: VerticalDivider(
              width: 1,
              thickness: 1,
              color: Color(0xFFE5EBF2),
            ),
          ),
          const Expanded(
            child: _StatItem(value: '4.9 ★', label: 'Rating', highlight: true),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: _ink,
      ),
    );
  }

  Widget _buildSkills() {
    const skills = [
      _SkillData('⌁', 'Flutter', Color(0xFFE2F4FF), Color(0xFF1683C3)),
      _SkillData('<>', 'Dart', Color(0xFFE5F7EB), Color(0xFF21834C)),
      _SkillData('▤', 'Clean Arch', Color(0xFFFFE8EC), Color(0xFFE94F68)),
      _SkillData('⌑', 'UI/UX', Color(0xFFF1E8FF), Color(0xFF8651C8)),
      _SkillData('♨', 'Firebase', Color(0xFFFFF2D1), Color(0xFFC18400)),
    ];

    Widget buildChip(_SkillData skill) {
      return SizedBox(
        width: 90,
        height: 32,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: skill.background,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  '${skill.symbol}  ${skill.name}',
                  maxLines: 1,
                  softWrap: false,
                  style: TextStyle(
                    color: skill.foreground,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildChip(skills[0]),
            const SizedBox(width: 6),
            buildChip(skills[1]),
            const SizedBox(width: 6),
            buildChip(skills[2]),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildChip(skills[3]),
            const SizedBox(width: 6),
            buildChip(skills[4]),
          ],
        ),
      ],
    );
  }

  Widget _buildProjects() {
    return Row(
      children: [
        Expanded(
          child: _ProjectCard(
            title: 'E-Shop Flutter',
            subtitle: 'Mobile App  •  2026',
            imageAsset: 'assets/images/shop.png',
          ),
        ),
        const SizedBox(width: 10),
        const Expanded(
          child: _ProjectCard(
            title: 'Crypto Vault',
            subtitle: 'Finance  •  Clean Arch',
            imageAsset: 'assets/images/crypto.png',
          ),
        ),
      ],
    );
  }

  Widget _buildContactCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _line),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0817304F),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: const Column(
        children: [
          _ContactRow(
            icon: Icons.alternate_email,
            title: 'Contact Information',
            isHeading: true,
          ),
          _ContactRow(icon: Icons.mail_outline, title: 'alex.rivers@email.com'),
          _ContactRow(
            icon: Icons.call_outlined,
            title: '+81 (90) 1234-5678',
            isLast: true,
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.value,
    required this.label,
    this.highlight = false,
  });

  final String value;
  final String label;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: TextStyle(
              color: highlight ? const Color(0xFFE0A500) : ProfilePage._ink,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              height: 1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: ProfilePage._muted,
              fontSize: 10,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _SkillData {
  const _SkillData(this.symbol, this.name, this.background, this.foreground);

  final String symbol;
  final String name;
  final Color background;
  final Color foreground;
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({
    required this.title,
    required this.subtitle,
    required this.imageAsset,
  });

  final String title;
  final String subtitle;
  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFE4EAF1)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 76,
              width: double.infinity,
              child: Image.asset(
                imageAsset,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const ColoredBox(
                  color: Color(0xFFE8EDF3),
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    color: ProfilePage._muted,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 6, 6, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: ProfilePage._ink,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: ProfilePage._muted,
                      fontSize: 8,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({
    required this.icon,
    required this.title,
    this.isHeading = false,
    this.isLast = false,
  });

  final IconData icon;
  final String title;
  final bool isHeading;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isHeading ? 48 : 46,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(bottom: BorderSide(color: Color(0xFFF0F3F7))),
      ),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Icon(icon, size: 14, color: ProfilePage._muted),
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: ProfilePage._ink,
                fontSize: isHeading ? 11 : 10,
                fontWeight: isHeading ? FontWeight.w700 : FontWeight.w400,
              ),
            ),
          ),
          const Icon(Icons.chevron_right, color: Color(0xFFC4D0DE), size: 18),
        ],
      ),
    );
  }
}
