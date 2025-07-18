

import '../../../../core/enums/order_enum.dart';
import '../../domins/entitys/order entity.dart';
import 'AddressOrder_model.dart';
import 'orderProductModel.dart';

class OrderModel {
  final double totalPrice;
  final String uID;
  final String oID;
  final AddressOrderModel addressOrderModel;
  final List<Orderproductmodel> orderProductModel;
  final String payMethod;
  final String orderNumber;
  final String status;
  final String methodOfReceipt;

  OrderModel(
      {required this.totalPrice,
        required this.orderNumber,
        required this.methodOfReceipt,
      required this.uID,
      required this.oID,
     required this.addressOrderModel,
      required this.status,
      required this.orderProductModel,
      required this.payMethod});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderNumber: json['orderNumber'],
      methodOfReceipt: json['methodOfReceipt'],
      oID: json['oID'],
      totalPrice: json['totalPrice'],
      uID: json['uID'],
      status:  json['status'],
      addressOrderModel: AddressOrderModel.fromJson(json['addressOrderModel']),
      orderProductModel: List<Orderproductmodel>.from(
          json['orderProductModel'].map((x) => Orderproductmodel.fromJson(x))),
      payMethod: json['payMethod'],
    );
  }

  toJson() {
    return {
      'totalPrice': totalPrice,
      'uID': uID,
      'oID': oID, 
      'status':  status,
      'date': DateTime.now().toString(),
      'addressOrderModel': addressOrderModel.toJson(),
      'orderProductModel': orderProductModel.map((e) => e.toJson()).toList(),
      'payMethod': payMethod,
    
    };
  }
  OrderEntity toEntity(){
    return OrderEntity(
      oID:  oID,
      methodOfReceipt: methodOfReceipt,
      orderNumber: orderNumber,
      totalPrice: totalPrice,
      status:  status,
      uID: uID,
      payMethod: payMethod, 
      addressOrderEntity:  addressOrderModel.toEntity(),
      orderProductEntity:  orderProductModel.map((e) => e.toEntity()).toList()
      );
     
  }
}
