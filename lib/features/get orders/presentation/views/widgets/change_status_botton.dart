import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makani_dashbord/features/get%20orders/domins/entitys/order%20entity.dart';

import '../../../../../core/enums/order_enum.dart';
import '../maneger/cubit/update_order/update_order_cubit.dart';
class ChangeStatusBotton extends StatelessWidget {
  const ChangeStatusBotton({super.key, required this.orderEntity});
 final OrderEntity orderEntity;
  @override
  Widget build(BuildContext context) {
    return     FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrder(

                  status:'يتم التحضير',
                  oID: orderEntity.oID
              );
            },
            child: const Text('يتم التحضير'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrder(

                  status: 'جاري التوصيل',
                  oID: orderEntity.oID
              );
            },
            child: const Text('جاري التوصيل'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrder(

                  status: 'تم التوصل',
                  oID: orderEntity.oID
              );
            },
            child: const Text('تم التوصل'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrder(

                  status: 'فشل',
                  oID: orderEntity.oID
              );
            },
            child: const Text('فشل'),
          ),
        ],
      ),
    );
  }
}
