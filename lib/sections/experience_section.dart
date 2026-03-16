import 'package:flutter/material.dart';
import 'package:shiv_portfolio/core/panel_decoration.dart';
import 'package:shiv_portfolio/models/portfolio_models.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({
    super.key,
    required this.isDesktop,
    required this.experiences,
  });

  final bool isDesktop;
  final List<ExperienceEntry> experiences;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: portfolioPanelDecoration(),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Work Experience',
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 18),
          ListView.separated(
            itemCount: experiences.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, __) => const SizedBox(height: 18),
            itemBuilder: (BuildContext context, int index) {
              return _ExperienceItem(
                isDesktop: isDesktop,
                experience: experiences[index],
                index: index
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ExperienceItem extends StatelessWidget {
  const _ExperienceItem({
    required this.isDesktop,
    required this.experience,
    required this.index,
  });

  final bool isDesktop;
  final ExperienceEntry experience;
  final int index;

  @override
  Widget build(BuildContext context) {
    final String roleMeta =
        '${experience.company} · ${experience.employmentType}';
    final String locationMeta = experience.workMode == null
        ? experience.location
        : '${experience.location} · ${experience.workMode}';

    return Container(
      padding: EdgeInsets.all(isDesktop ? 18 : 14),
      margin: EdgeInsets.only(left: ((index%2!=0) ? MediaQuery.of(context).size.width/2 -100 : 0),right: ((index%2==0) ? MediaQuery.of(context).size.width/2 -100 : 0)),
      decoration: BoxDecoration(
        color: const Color(0xFF0A1627),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF1F2A3A)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            experience.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              height: 1.2,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            roleMeta,
            style: const TextStyle(
              color: Color(0xFFD1D5DB),
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            experience.duration,
            style: const TextStyle(
              color: Color(0xFFFF6B4A),
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            locationMeta,
            style: const TextStyle(
              color: Color(0xFF9CA3AF),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (experience.highlights.isNotEmpty) ...<Widget>[
            const SizedBox(height: 12),
            ...experience.highlights.map(
              (String highlight) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  '• $highlight',
                  style: const TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 15,
                    height: 1.45,
                  ),
                ),
              ),
            ),
          ],
          const SizedBox(height: 8),
          Text(
            experience.skillsSummary,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
