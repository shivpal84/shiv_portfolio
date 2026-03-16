import 'package:shiv_portfolio/models/portfolio_models.dart';

const String kResumeUrl =
    'https://drive.google.com/file/d/1MmwQtueulgHtVjRluVdXYYDXCQ8kCn_-/view?usp=drivesdk';

const List<String> kSkills = <String>[
  'Flutter',
  'Dart',
  'Android',
  'iOS',
  'Java',
  'Kotlin',
  'BLoC',
  'Riverpod',
  'Firebase',
  'ML Kit',
  'Google Maps',
  'Face Recognition',
  'Geo Fencing',
  'TDD',
  'Push Notifications',
];

const List<MetricItem> kMetrics = <MetricItem>[
  MetricItem(label: 'Completed Projects', value: '120+'),
  MetricItem(label: 'Client Satisfaction', value: '95%'),
  MetricItem(label: 'Years Experience', value: '5+'),
];

const List<ProjectItem> kProjects = <ProjectItem>[
  ProjectItem(
    title: 'LiveTrac',
    subtitle: 'Real-time Employee Tracking',
    description: '''1. Developed complete mobile app using Flutter
2. Implemented foreground & background tracking service
3. Handled aggressive battery optimization devices (Realme, Xiaomi)
4. Integrated Google Maps with real-time polyline updates
5. Built automatic trip start/stop detection
6. Used SQLite for trip data storage & archiving
7. Implemented trip archive migration logic
8. Coordinated backend API updates with manager & backend team
9. Implemented in-app update with Firebase Remote Config
10. Reduced app crash rate and improved background reliability''',
  ),
  ProjectItem(
    title: 'Face Kiosk',
    subtitle: 'ML Attendance System',
    description: '''Developed tablet-based kiosk application using Flutter
Integrated face recognition attendance workflow
Implemented camera handling and real-time face detection integration
Designed auto-login kiosk mode for continuous attendance capture
Implemented foreground service for uninterrupted operation
Handled device-level restrictions for kiosk environment stability
Integrated backend APIs for real-time attendance sync
Implemented offline data storage with auto-sync when internet restores
Optimized performance for long-running continuous app usage
Reduced crash rate and improved reliability for production deployment
Coordinated with backend and hardware team for seamless integration''',
  ),
  ProjectItem(
    title: 'TimeLabs ESS',
    subtitle: 'Employee Self Service App',
    description:
        '''Developed complete Employee Self-Service mobile application using Flutter
Implemented secure authentication & role-based access control
Integrated attendance, leave management, and payroll APIs
Implemented real-time attendance status with automatic time validation
Used MethodChannel to access native Android settings (Automatic Time check)
Integrated Firebase Remote Config for dynamic feature control
Implemented in-app update mechanism using Firebase Remote Config
Optimized API handling for multi-environment configuration (Dev/UAT/Prod)
Implemented local caching & offline handling for improved user experience
Coordinated backend API changes with manager and backend team to ensure zero production downtime
Improved performance and reduced app crashes through structured error handling''',
  ),
  ProjectItem(
    title: 'Fretchain',
    subtitle: 'Logistics & Route Planning',
    description:
        'Maps, routes, polylines, and operational flows for logistics and tracking use cases.',
  ),
];

const List<ExperienceEntry> kExperienceEntries = <ExperienceEntry>[
  ExperienceEntry(
    title: 'Mobile Application Developer',
    company: 'Timelabs',
    employmentType: 'Full-time',
    duration: 'Oct 2023 - Present',
    location: 'Jaipur, Rajasthan, India',
    workMode: 'Remote',
    highlights: <String>[
      'Developed and maintained mobile applications using Flutter, enhancing user experience and performance.',
    ],
    skillsSummary: 'Flutter, Android Development and +15 skills',
  ),
  ExperienceEntry(
    title: 'Mobile Application Developer',
    company: 'KPIS Pvt. Ltd.',
    employmentType: 'Full-time',
    duration: 'Sep 2021 - Oct 2023',
    location: 'Jaipur, Rajasthan, India',
    workMode: 'On-site',
    highlights: <String>[
      'Co-led the adoption of Flutter for cross-platform mobile development, enhancing team efficiency.',
      'Initiated and developed iOS applications from scratch, filling a critical gap in the team.',
    ],
    skillsSummary: 'Java, Kotlin and +17 skills',
  ),
  ExperienceEntry(
    title: 'Full Stack Developer',
    company: 'Zucol Group',
    employmentType: 'Full-time',
    duration: 'Dec 2020 - Sep 2021',
    location: 'Jaipur, Rajasthan, India',
    highlights: <String>[],
    skillsSummary: 'Android SDK',
  ),
];
