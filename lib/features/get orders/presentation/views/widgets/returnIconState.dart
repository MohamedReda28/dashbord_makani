import 'package:flutter/material.dart';

IconData getStatusIcon(String status) {
  switch (status.toLowerCase()) {
    case 'pending':
      return Icons.access_time;
    case 'inprogress':
      return Icons.build_circle;
    case 'shipped':
      return Icons.local_shipping;
    case 'delivered':
      return Icons.check_circle_outline;
    case 'canceled':
      return Icons.cancel_outlined;
    default:
      return Icons.help_outline;
  }
}