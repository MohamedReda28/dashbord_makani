import '../../../../core/enums/order_enum.dart';
import 'AddressOrder_entity.dart';
import 'orderProductEntity.dart';

class OrderEntity {
  final double totalPrice;
  final String uID;
  final String oID;
  final String orderNumber;
  final AddressOrderEntity addressOrderEntity;
  final List<OrderproductEntity> orderProductEntity;
  final String payMethod;
  final OrderStateEnum status;
  final String methodOfReceipt;

  OrderEntity(
      {required this.totalPrice,
        required this.orderNumber,
        required this.methodOfReceipt,
      required this.uID,
      required this.oID,
      required this.addressOrderEntity,
      required this.orderProductEntity,
      required this.status,
      required this.payMethod,});


}
