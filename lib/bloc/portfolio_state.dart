import 'package:shiv_portfolio/models/portfolio_models.dart';

class PortfolioState {
  const PortfolioState({
    required this.skills,
    required this.metrics,
    required this.projects,
    required this.experiences,
    required this.resumeUrl,
  });

  final List<String> skills;
  final List<MetricItem> metrics;
  final List<ProjectItem> projects;
  final List<ExperienceEntry> experiences;
  final String resumeUrl;

  PortfolioState copyWith({
    List<String>? skills,
    List<MetricItem>? metrics,
    List<ProjectItem>? projects,
    List<ExperienceEntry>? experiences,
    String? resumeUrl,
  }) {
    return PortfolioState(
      skills: skills ?? this.skills,
      metrics: metrics ?? this.metrics,
      projects: projects ?? this.projects,
      experiences: experiences ?? this.experiences,
      resumeUrl: resumeUrl ?? this.resumeUrl,
    );
  }
}
