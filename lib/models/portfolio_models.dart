class MetricItem {
  const MetricItem({required this.label, required this.value});

  final String label;
  final String value;
}

class ProjectItem {
  const ProjectItem({
    required this.title,
    required this.subtitle,
    required this.description,
    this.appLinkAndroid = '',
    this.appLinkIOS = '',
    this.order = 9999,
  });

  factory ProjectItem.fromMap(Map<String, dynamic> map) {
    return ProjectItem(
      title: (map['title'] as String?)?.trim() ?? '',
      subtitle: (map['subtitle'] as String?)?.trim() ?? '',
      description: (map['description'] as String?)?.trim() ?? '',
      appLinkAndroid: (map['appLinkAndroid'] as String?)?.trim() ?? '',
      appLinkIOS: (map['appLinkIOS'] as String?)?.trim() ?? '',
      order: (map['order'] as num?)?.toInt() ?? 9999,
    );
  }

  bool get isValid =>
      title.isNotEmpty && description.isNotEmpty;

  final String title;
  final String subtitle;
  final String description;
  final String appLinkAndroid;
  final String appLinkIOS;
  final int order;
}

class ExperienceEntry {
  const ExperienceEntry({
    required this.title,
    required this.company,
    required this.employmentType,
    required this.duration,
    required this.location,
    required this.highlights,
    required this.skillsSummary,
    this.workMode,
  });

  final String title;
  final String company;
  final String employmentType;
  final String duration;
  final String location;
  final String? workMode;
  final List<String> highlights;
  final String skillsSummary;
}
