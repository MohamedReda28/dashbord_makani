import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makani_dashbord/core/widget/customErrorWidght.dart';
import 'package:makani_dashbord/features/addProdut/presintatin/view/Widget/CustomProgressHUD.dart';
import 'package:makani_dashbord/features/get%20orders/presentation/views/maneger/cubit/update_order/update_order_cubit.dart';

import '../maneger/cubit/order/order_cubit.dart';

class UpdateOrderBuilder extends StatelessWidget {
  const UpdateOrderBuilder({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateOrderCubit, UpdateOrderState>(
        builder: (context, state) {
      return CustoProgressHUD(
        isLoading: state is UpdateOrderLoading,
        child: child,
      );
    }, listener: (context, state) {
      if (state is UpdateOrderSuccess) {
        const CustomSnakebarwidght(
          text: 'تم تعديل الحاله بنجاح',
        );
        //context.read<OrderCubit>().getOrders();
      }
      if (state is UpdateOrderFaluir) {
        CustomSnakebarwidght(
          text: state.message,
        );
      }
    });
  }
}
