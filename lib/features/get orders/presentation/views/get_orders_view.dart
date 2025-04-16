import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makani_dashbord/features/get%20orders/presentation/views/widgets/ordersViewBodyBuilder.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/repos/order_reop/order_repo.dart';
import '../../../../core/services/git_it_Service.dart';
import 'maneger/cubit/order_cubit.dart';

class GetOrders extends StatelessWidget {
  const GetOrders({super.key});
  static const routName = 'GetOrders';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit(
        getIt.get<OrderRepo>(),
      ),
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'الطلبات',
              style: TextStyle(fontSize: 26),
            ),
          ),
          body: const OrdersViewBodyBuilder()),
    );
  }
}

