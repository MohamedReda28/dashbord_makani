part of 'update_order_cubit.dart';

@immutable
sealed class UpdateOrderState {}

final class UpdateOrderInitial extends UpdateOrderState {}
final class UpdateOrderLoading extends UpdateOrderState {}
final class UpdateOrderSuccess extends UpdateOrderState {
   
}
final class UpdateOrderFaluir extends UpdateOrderState {
  final String message;
   UpdateOrderFaluir({required this.message});
}

