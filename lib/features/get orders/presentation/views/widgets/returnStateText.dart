import 'package:flutter/material.dart';

String getStatusText(String status) {
  switch (status.toLowerCase()) {
    case "قيد الانتظار":
      return 'قيد الانتظار';
    case 'يتم التحضير':
      return 'يتم التحضير';
    case 'جاري التوصيل':
      return 'جاري التوصيل';
    case 'تم التوصل':
      return 'تم التوصل';
    case 'فشل':
      return 'فشل';
    default:
      return 'غير معروف';
  }
}
