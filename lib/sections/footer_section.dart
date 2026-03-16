import 'package:flutter/material.dart';
import 'package:shiv_portfolio/core/panel_decoration.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  static final Uri _emailUri = Uri(
    scheme: 'mailto',
    path: 'rathoreshivpal060699@gmail.com',
  );
  static final Uri _phoneUri = Uri(
    scheme: 'tel',
    path: '+917296985526',
  );
  static final Uri _linkedinUri = Uri.parse(
    'https://www.linkedin.com/in/shivpal-singh-rathore',
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: portfolioPanelDecoration(),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        runSpacing: 12,
        children: <Widget>[
          _ContactItem(
            icon: Icons.mail_outline,
            label: 'rathoreshivpal060699@gmail.com',
            onTap: () => _launchUri(_emailUri),
          ),
          _ContactItem(
            icon: Icons.work_outline,
            label: 'linkedin.com/in/shivpal-singh-rathore',
            onTap: () => _launchUri(_linkedinUri),
          ),
          _ContactItem(
            icon: Icons.call_outlined,
            label: '+91 7296985526',
            onTap: () => _launchUri(_phoneUri),
          ),
          const _ContactItem(
            icon: Icons.code,
            label: 'GitHub profile',
          ),
        ],
      ),
    );
  }

  Future<void> _launchUri(Uri uri) async {
    await launchUrl(uri, mode: LaunchMode.platformDefault);
  }
}

class _ContactItem extends StatelessWidget {
  const _ContactItem({
    required this.icon,
    required this.label,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final Widget content = Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(icon, size: 18, color: const Color(0xFFFF6B4A)),
        const SizedBox(width: 10),
        Text(
          label,
          style: TextStyle(
            color: onTap == null ? const Color(0xFF9CA3AF) : Colors.white,
            fontWeight: onTap == null ? FontWeight.w500 : FontWeight.w600,
          ),
        ),
      ],
    );

    if (onTap == null) {
      return content;
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        child: content,
      ),
    );
  }
}
