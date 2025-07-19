import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:makani_dashbord/core/enums/order_enum.dart';
import 'package:makani_dashbord/core/repos/order_reop/order_repo.dart';
import 'package:makani_dashbord/generated/intl/messages_en.dart';
import 'package:meta/meta.dart';

part 'update_order_state.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderState> {
  UpdateOrderCubit(this.orderRepo) : super(UpdateOrderInitial());
  final OrderRepo orderRepo;

   Future<void> updateOrder({required String
   status,required String oID} )async{
      emit(UpdateOrderLoading());
     var result = await orderRepo.updatOrders(
         status, oID);
     result.fold(
      (faluir) => emit(UpdateOrderFaluir(message:faluir.message)),
      ( right) => emit(UpdateOrderSuccess()),
     );
 }
}