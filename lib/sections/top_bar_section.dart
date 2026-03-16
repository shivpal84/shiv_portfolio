import 'package:flutter/material.dart';

class TopBarSection extends StatelessWidget {
  const TopBarSection({
    super.key,
    required this.isDesktop,
    required this.onNavSelected,
  });

  final bool isDesktop;
  final ValueChanged<String> onNavSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Text(
          'Shivpal Singh',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        const Spacer(),
        if (isDesktop)
          Row(
            children: <Widget>[
              _NavItem(label: 'Home', onTap: onNavSelected),
              const SizedBox(width: 20),
              _NavItem(label: 'About', onTap: onNavSelected),
              const SizedBox(width: 20),
              _NavItem(label: 'Experience', onTap: onNavSelected),
              const SizedBox(width: 20),
              _NavItem(label: 'Projects', onTap: onNavSelected),
              const SizedBox(width: 20),
              _NavItem(label: 'Contact', onTap: onNavSelected),
            ],
          )
        else
          const Icon(Icons.menu, color: Colors.white),
      ],
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({required this.label, required this.onTap});

  final String label;
  final ValueChanged<String> onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(label),
      borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        child: Text(
          label,
          style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
        ),
      ),
    );
  }
}
