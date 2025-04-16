import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/helpes_function/get_order_dummy.dart';
import '../../../../../core/widget/customErrorWidght.dart';
import '../maneger/cubit/order_cubit.dart';
import 'getOrdersBody.dart';

class OrdersViewBodyBuilder extends StatefulWidget {
  const OrdersViewBodyBuilder({super.key});

  @override
  State<OrdersViewBodyBuilder> createState() => _OrdersViewBodyBuilderState();
}

class _OrdersViewBodyBuilderState extends State<OrdersViewBodyBuilder> {
  @override
  void initState() {
    context.read<OrderCubit>().getOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(builder: (context, state) {
      if (state is OrderSuccess) {
        return OrdersViewBody(
          orders: state.orders,
        );
      } else if (state is OrderFailure) {
        return const Customerrorwidght(text: 'حدث خطأ');
      } else {
        return Skeletonizer(
            enabled: true,
            child: OrdersViewBody(orders: [getdummydata(), getdummydata()]));
      }
    });
  }
}
