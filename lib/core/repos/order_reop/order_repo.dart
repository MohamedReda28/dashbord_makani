
import 'package:dartz/dartz.dart';

import '../../../features/get orders/domins/entitys/order entity.dart';
import '../../enums/order_enum.dart';
import '../../erroes/Failur.dart';

abstract class OrderRepo{

  Stream<Either<Failur,List<OrderEntity>>> getOrders();
  Future<Either<Failur,void>> updatOrders(String state, String oID);

}