import 'package:flutter/material.dart';
import 'package:shiv_portfolio/core/panel_decoration.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.isDesktop,
    required this.isTablet,
    required this.skills,
    required this.resumeUrl,
  });

  final bool isDesktop;
  final bool isTablet;
  final List<String> skills;
  final String resumeUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: portfolioPanelDecoration(),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(isDesktop ? 34 : 20),
            child: isDesktop
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(child: _HeroText(resumeUrl: resumeUrl)),
                      const SizedBox(width: 24),
                      const Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: _HeroVisual(size: 320),
                        ),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _HeroText(resumeUrl: resumeUrl),
                      const SizedBox(height: 18),
                      Align(
                        alignment: Alignment.center,
                        child: _HeroVisual(size: isTablet ? 260 : 220),
                      ),
                    ],
                  ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Color(0xFF1F2A3A))),
              color: Color(0xFF0A1627),
            ),
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              runSpacing: 10,
              spacing: 12,
              children: skills
                  .map(
                    (String skill) => 
                    Padding(padding: EdgeInsets.symmetric(horizontal: 30), child: 
                    Text(
                      skill,
                      style: const TextStyle(
                        color: Color(0xFF7D8CA4),
                        fontSize: 14,
                      ),)
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroText extends StatelessWidget {
  const _HeroText({required this.resumeUrl});

  final String resumeUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Hello.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.w800,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          "I'm Shivpal",
          style: TextStyle(
            color: Color(0xFFD1D5DB),
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Senior Mobile Developer',
          style: TextStyle(
            color: Colors.white,
            fontSize: 44,
            fontWeight: FontWeight.w800,
            height: 1.05,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Flutter | Android | iOS',
          style: TextStyle(
            color: Color(0xFFFF6B4A),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 12,
          runSpacing: 10,
          children: <Widget>[
            const _PrimaryButton(label: 'Got a project?'),
            _GhostButton(label: 'My Resume', url: resumeUrl),
          ],
        ),
      ],
    );
  }
}

class _HeroVisual extends StatelessWidget {
  const _HeroVisual({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: size * 0.95,
            height: size * 0.95,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0x66FF6B4A), width: 22),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: Color(0x33FF6B4A),
                  blurRadius: 36,
                  spreadRadius: 8,
                ),
              ],
            ),
          ),
          Container(
            width: size * 0.72,
            height: size * 0.72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0x33FFFFFF), width: 2),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Color(0xFF223147), Color(0xFF0F172A)],
              ),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/shivpal_profile.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFFF6B4A),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _GhostButton extends StatelessWidget {
  const _GhostButton({required this.label, required this.url});

  final String label;
  final String url;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async {
        final Uri? uri = Uri.tryParse(url);
        if (uri == null) {
          return;
        }
        await launchUrl(uri);
      },
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Color(0xFFFF6B4A)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
    );
  }
}
