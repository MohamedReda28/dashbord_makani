import 'package:flutter/material.dart';

String getStatusText(String status) {
  switch (status.toLowerCase()) {
    case 'pending':
      return 'قيد الانتظار';
    case 'inprogress':
      return 'يتم التحضير';
    case 'shipped':
      return 'جاري التوصيل';
    case 'delivered':
      return 'تم التوصل';
    case 'canceled':
      return 'فشل';
    default:
      return 'غير معروف';
  }
}
