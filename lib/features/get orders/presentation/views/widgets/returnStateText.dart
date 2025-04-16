import 'package:flutter/material.dart';

String getStatusText(String status) {
  switch (status.toLowerCase()) {
    case 'pending':
      return 'Pending';
    case 'inprogress':
      return 'In Progress';
    case 'shipped':
      return 'Shipped';
    case 'delivered':
      return 'Delivered';
    case 'canceled':
      return 'Canceled';
    default:
      return 'Unknown';
  }
}
