import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:makani_dashbord/core/enums/order_enum.dart';
import 'package:makani_dashbord/features/get%20orders/data/models/order%20model.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/repos/order_reop/order_repo.dart';
import '../../../../../domins/entitys/order entity.dart';
part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.orderRepo) : super(OrderInitial());
  final OrderRepo orderRepo;
  StreamSubscription? streamSubscription;
  Future<void> getOrders() async {
    emit(OrderLoading());
    streamSubscription = orderRepo.getOrders().listen((result){
      result.fold(
            (failure) => emit(OrderFailure(message: failure.message)),
            (orders) => emit(OrderSuccess(orders: orders)),
      );
    });
  }
  Future<void>cancelSteram()async{
    streamSubscription?.cancel();
    return super.close();
  }
}



