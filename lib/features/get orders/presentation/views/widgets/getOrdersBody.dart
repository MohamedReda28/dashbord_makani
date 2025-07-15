import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../domins/entitys/order entity.dart';
import 'fillter section.dart';
import 'order_item_list_view.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key, required this.orders});
 final List<OrderEntity> orders;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
               // const Fillter_Section(),
                const SizedBox(
                  height: 16,
                ),
                OrderItemListView(
                  orders:orders,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
