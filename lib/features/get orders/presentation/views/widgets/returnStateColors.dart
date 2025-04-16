import 'package:flutter/material.dart';

Color getStatusColor(String status) {
  switch (status.toLowerCase()) {
    case 'pending':
      return Colors.orange;
    case 'inprogress':
      return Colors.blue;
    case 'shipped':
      return Colors.teal;
    case 'delivered':
      return Colors.green;
    case 'canceled':
      return Colors.red;
    default:
      return Colors.grey;
  }
}