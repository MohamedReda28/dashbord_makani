import 'package:flutter/material.dart';

Color getStatusColor(String status) {
  switch (status.toLowerCase()) {
    case "قيد الانتظار":
      return Colors.orange;
    case 'يتم التحضير':
      return Colors.blue;
    case 'جاري التوصيل':
      return Colors.teal;
    case 'تم التوصل':
      return Colors.green;
    case 'فشل':
      return Colors.red;
    default:
      return Colors.grey;
  }
}