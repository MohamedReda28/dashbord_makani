import 'package:flutter/material.dart';

IconData getStatusIcon(String status) {
  switch (status.toLowerCase()) {
    case "قيد الانتظار":
      return Icons.access_time;
    case 'يتم التحضير':
      return Icons.build_circle;
    case 'جاري التوصيل':
      return Icons.local_shipping;
    case 'تم التوصل':
      return Icons.check_circle_outline;
    case 'فشل':
      return Icons.cancel_outlined;
    default:
      return Icons.help_outline;
  }
}