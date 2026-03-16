import 'package:flutter/material.dart';

BoxDecoration portfolioPanelDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(16),
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[Color(0xFF101E34), Color(0xFF081324)],
    ),
    border: Border.all(color: const Color(0xFF1F2A3A)),
    boxShadow: const <BoxShadow>[
      BoxShadow(
        color: Color(0x40000000),
        blurRadius: 30,
        offset: Offset(0, 14),
      ),
    ],
  );
}
