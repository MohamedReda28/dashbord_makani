import 'package:flutter/material.dart';
import '../../../domins/entitys/order entity.dart';
import 'order item.dart';

class OrderItemListView extends StatelessWidget {
  const OrderItemListView({super.key, required this.orders});
  final List<OrderEntity> orders;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return OrderItem(orderEntity: orders[index]);
        },
        separatorBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
          );
        });
  }
}

// ListView.builder(
// physics: const NeverScrollableScrollPhysics(),
// shrinkWrap: true,
// itemCount: orders.length,
// itemBuilder: (context, index) {
// return Padding(
// padding: const EdgeInsets.symmetric(vertical: 10),
// child: OrderItem(orderModel: orders[index]),
// );
// });
