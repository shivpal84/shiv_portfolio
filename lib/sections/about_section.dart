import 'package:flutter/material.dart';
import 'package:shiv_portfolio/core/panel_decoration.dart';
import 'package:shiv_portfolio/models/portfolio_models.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({
    super.key,
    required this.isDesktop,
    required this.metrics,
  });

  final bool isDesktop;
  final List<MetricItem> metrics;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: portfolioPanelDecoration(),
      padding: const EdgeInsets.all(24),
      child: isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Expanded(child: _ServicesList()),
                const SizedBox(width: 28),
                Expanded(child: _AboutText(metrics: metrics)),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const _ServicesList(),
                const SizedBox(height: 24),
                _AboutText(metrics: metrics),
              ],
            ),
    );
  }
}

class _ServicesList extends StatelessWidget {
  const _ServicesList();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _ServiceItem(label: 'Mobile App Development'),
        SizedBox(height: 18),
        _ServiceItem(label: 'Offline-First Architecture'),
        SizedBox(height: 18),
        _ServiceItem(label: 'App Performance & Scaling'),
      ],
    );
  }
}

class _ServiceItem extends StatelessWidget {
  const _ServiceItem({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFF2B3C54)),
          ),
          child: const Icon(Icons.code, size: 16, color: Color(0xFFFF6B4A)),
        ),
        const SizedBox(width: 12),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFFD1D5DB),
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}

class _AboutText extends StatelessWidget {
  const _AboutText({required this.metrics});

  final List<MetricItem> metrics;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'About me',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.w800,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Senior Mobile Developer with 5+ years of experience building scalable Flutter applications with Clean Architecture, BLoC, Firebase, and production testing. I specialize in reliable real-time and offline-first systems.',
          style: TextStyle(
            color: Color(0xFF9CA3AF),
            fontSize: 15,
            height: 1.7,
          ),
        ),
        const SizedBox(height: 18),
        Wrap(
          spacing: 14,
          runSpacing: 12,
          children: metrics
              .map(
                (MetricItem metric) => _MetricCard(metric: metric),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({required this.metric});

  final MetricItem metric;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0A1627),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF1F2A3A)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            metric.value,
            style: const TextStyle(
              color: Color(0xFFFF6B4A),
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            metric.label,
            style: const TextStyle(color: Color(0xFF9CA3AF), height: 1.4),
          ),
        ],
      ),
    );
  }
}
