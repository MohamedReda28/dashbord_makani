
import 'package:dartz/dartz.dart';

import '../../../features/get orders/domins/entitys/order entity.dart';
import '../../erroes/Failur.dart';

abstract class OrderRepo{

  Stream<Either<Failur,List<OrderEntity>>> getOrders();
}