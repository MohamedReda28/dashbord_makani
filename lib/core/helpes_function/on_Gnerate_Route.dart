import 'package:flutter/material.dart';
import '../../features/addProdut/presintatin/view/AddProductView.dart';
import '../../features/addpost/presentation/views/addpostview.dart';
import '../../features/dashord/views/dashbrd view.dart';
import '../../features/get orders/presentation/views/get_orders_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashBordView.routName:
      return MaterialPageRoute(builder: (context) => const DashBordView());
    case AddProductView.routName:
      return MaterialPageRoute(builder: (context) => const AddProductView());
    case GetOrders.routName:
      return MaterialPageRoute(builder: (context) => const GetOrders());
    case Addpostview.routName:
      return MaterialPageRoute(builder: (context) => const Addpostview());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
