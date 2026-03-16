import 'package:flutter/material.dart';
import 'package:shiv_portfolio/core/panel_decoration.dart';
import 'package:shiv_portfolio/models/portfolio_models.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({
    super.key,
    required this.isDesktop,
    required this.isTablet,
    required this.projects,
  });

  final bool isDesktop;
  final bool isTablet;
  final List<ProjectItem> projects;

  @override
  Widget build(BuildContext context) {
    final double cardWidth = isDesktop ? 520 : (isTablet ? 430 : 290);
    final double cardHeight = isDesktop ? 260 : 290;

    return Container(
      decoration: portfolioPanelDecoration(),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Projects',
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'Swipe to explore projects',
            style: TextStyle(color: Color(0xFF7D8CA4), fontSize: 13),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: cardHeight,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: projects.length,
              separatorBuilder: (_, __) => const SizedBox(width: 14),
              itemBuilder: (BuildContext context, int index) {
                final ProjectItem project = projects[index];
                return SizedBox(
                  width: cardWidth,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0A1627),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFF1F2A3A)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          project.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          project.subtitle,
                          style: const TextStyle(
                            color: Color(0xFFFF6B4A),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: Scrollbar(
                            thumbVisibility: true,
                            child: SingleChildScrollView(
                              child: Text(
                                project.description,
                                style: const TextStyle(
                                  color: Color(0xFF9CA3AF),
                                  height: 1.6,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
