import 'package:flutter/material.dart';

enum MessageType {
  danger,
  primary,
  warning,
  success,
  info,
}

class MessageTypeColors {
  static const Color danger = Color(0xFFFF597B);

  static const Color success = Color(0xFF4CD964);

  static const Color warning = Color(0xFFF7B500);

  static const Color primary = Color(0xFF40C8F1);

  static const Color info = Color(0xFFD9DBE9);
}
