part of 'order_cubit.dart';


@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}
final class OrderLoading extends OrderState {}
final class OrderSuccess extends OrderState {
  final List<OrderEntity> orders;
  OrderSuccess({required this.orders});
}
final class OrderFailure extends OrderState {
  final String message;
  OrderFailure({required this.message});
}



